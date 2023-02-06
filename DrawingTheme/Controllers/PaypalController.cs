using DrawingTheme.Models;
using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;

namespace DrawingTheme.Controllers
{
    public class PaypalController : Controller
    {
        static int UserID;
        static int OrderID;
        static int Amount;
        AutomatischeEntities DB = new AutomatischeEntities();
        public ActionResult PaymentWithPaypal(string Cancel = null)
        {
            if (Cancel != null)
            {
                return RedirectToAction("Orders",  new { Error = "Your have canceled your request, please pay your payment." });
            }
            APIContext apiContext = PaypalConfiguration.GetAPIContext();
            try
            {
                UserID = Convert.ToInt32(Request.QueryString["UserId"]);
                OrderID = Convert.ToInt32(Request.QueryString["OrderID"]);

         
                if (OrderID == 0)
                {
                    string OrderIDs = Request.Params["OrderID"];
                    OrderID = Convert.ToInt32(OrderIDs);
                }

                if (OrderID > 0)
                { Session["OrderID"] = OrderID; }
                if (UserID > 0)
                { Session["UserID"] = UserID; }
                string payerId = Request.Params["PayerID"];
                if (string.IsNullOrEmpty(payerId))
                {
                    //this section will be executed first because PayerID doesn't exist  
                    //it is returned by the create function call of the payment class  
                    // Creating a payment  
                    // baseURL is the url on which paypal sendsback the data.  
                    string baseURI = Request.Url.Scheme + "://" + Request.Url.Authority + "/Paypal/PaymentWithPayPal?";
                    //here we are generating guid for storing the paymentID received in session  
                    //which will be used in the payment execution  
                    var guid = Convert.ToString((new Random()).Next(100000));
                    //CreatePayment function gives us the payment approval url  
                    //on which payer is redirected for paypal account payment  
                    var createdPayment = this.CreatePayment(apiContext, baseURI + "guid=" + guid);
                    //get links returned from paypal in response to Create function call  
                    var links = createdPayment.links.GetEnumerator();
                    string paypalRedirectUrl = null;
                    while (links.MoveNext())
                    {
                        Links lnk = links.Current;
                        if (lnk.rel.ToLower().Trim().Equals("approval_url"))
                        {
                            //saving the payapalredirect URL to which user will be redirected for payment  
                            paypalRedirectUrl = lnk.href;
                        }
                    }
                    // saving the paymentID in the key guid  
                    Session.Add(guid, createdPayment.id);
                    return Redirect(paypalRedirectUrl);
                }
                else
                {
                    // This function exectues after receving all parameters for the payment  
                    var guid = Request.Params["guid"];
                    var executedPayment = ExecutePayment(apiContext, payerId, Session[guid] as string);
                    //If executed payment failed then we will show payment failure message to user  
                    tblTransaction Data = new tblTransaction();
                    if (executedPayment.state.ToLower() != "approved")
                    {

                        Data.PaymentDateTime = DateTime.Now;
                        Data.UserId = Convert.ToInt32(Session["UserID"]);
                        Data.OrderId = Convert.ToInt32(Session["OrderID"]);
                        Data.Amount = executedPayment.transactions[0].amount.total;
                        Data.PayerEmail = executedPayment.payer.payer_info.email;
                        Data.PayerFirstName = executedPayment.payer.payer_info.first_name;
                        Data.PayerLastName = executedPayment.payer.payer_info.last_name;
                        Data.PaypalPaymentId = executedPayment.id;
                        Data.PayerId = payerId;
                        Data.Status = "Failed";
                        DB.tblTransactions.Add(Data);
                        DB.SaveChanges();
                        int OrderNu = Convert.ToInt32(Session["OrderID"]);
                        tblOrder orders = DB.tblOrders.Find(OrderNu);
                        orders.TotalPrice = Convert.ToInt32(executedPayment.transactions[0].amount.total);
                        orders.Status = 0;
                        DB.Entry(orders);
                        DB.SaveChanges();
                        return RedirectToAction("Transaction", "Customer",new {Error="Payment Failed" });
                    }
                    
                    Data.PaymentDateTime = DateTime.Now;
                    Data.UserId = Convert.ToInt32(Session["UserID"]);
                    Data.OrderId = Convert.ToInt32(Session["OrderID"]);
                    Data.Amount = executedPayment.transactions[0].amount.total;
                    Data.PayerEmail = executedPayment.payer.payer_info.email;
                    Data.PayerFirstName = executedPayment.payer.payer_info.first_name;
                    Data.PayerLastName = executedPayment.payer.payer_info.last_name;
                    Data.PaypalPaymentId = executedPayment.id;
                    Data.PayerId = payerId;
                    Data.Status = "Successfull";
                    DB.tblTransactions.Add(Data);

                    int Order = Convert.ToInt32(Session["OrderID"]);
                    tblOrder order = DB.tblOrders.Find(Order);
                    order.TotalPrice = Convert.ToDouble(executedPayment.transactions[0].amount.total);
                    order.Status = 1;
                    DB.Entry(order);
                    DB.SaveChanges();
                    //DB.SaveChanges();
                    tblUser UserData = DB.tblUsers.Where(x => x.UserId == Data.UserId).FirstOrDefault();
                    string Email = UserData.Email;
                    List<Sp_GetBOMData_Result> BomData = DB.Sp_GetBOMData(Data.OrderId).ToList();
                    double? GT = DB.Sp_GetBOMData(Data.OrderId).Select(s => s.TotalPrice).Sum();

                    tblSetting setting = DB.tblSettings.Find(1);
                    bool? isAdmin = setting.IsAdminReceived;

                    string SenderEmail = setting.Email;//System.Configuration.ConfigurationManager.AppSettings["SenderEmail"].ToString();
                    string SenderPassword = setting.Password;//System.Configuration.ConfigurationManager.AppSettings["SenderPassword"].ToString();
                    SmtpClient Client = new SmtpClient(setting.SMTP, Convert.ToInt32(setting.Port));
                    Client.EnableSsl = Convert.ToBoolean(setting.isActive);
                    Client.Timeout = 100000;
                    Client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    Client.UseDefaultCredentials = false;
                    Client.Credentials = new System.Net.NetworkCredential(SenderEmail, SenderPassword);

                    string link = Request.Url.ToString();
                    link = link.Replace("ForgetPassword", "ChangeForgetPassword");

                    byte[] b = System.Text.ASCIIEncoding.ASCII.GetBytes(Email);
                    string encrypted = Convert.ToBase64String(b);


                    string body1 = "";
                    body1 += "<div class='d-flex justify-content-center' style='justify-content: center !important; '><table class='card p-3' style='width: 30%; transition: all 0.5s ease-in-out; border-radius: 0.55rem; background-color: #ffffff; border-color: #ffffff; position: relative; box-shadow: 0px 12px 23px 0px rgb(0 0 0 / 4%); margin-bottom: 30px; display: flex; flex-direction: column; min-width: 0; word-wrap: break-word; background-clip: border-box; border: 1px solid rgba(0,0,0,.125); padding: 1rem !important; '>";
                    body1 += "<tbody><tr><td></td><td style='text-align: center;width:100%;'><table class='w-100' style='width: 100% !important;'>";
                    body1 += "<tbody><tr><td style='text-align: center;'><h2 style='font-size: 2rem;font-weight: 500;margin: 0%;'>" + order.TotalPrice + " € Paid</h2></td></tr><tr><td class='pb-3 pt-3 text-center' style='padding-bottom: 1rem !important; padding-top: 1rem !important; text-align: center !important;'><h4 style='font-size: 1.5rem;font-weight: 500;margin: 0%;'>Thanks for using Automatische. Inc.</h4></td></tr>";
                    body1 += "<tr><td class='pb-3 pt-3' style='padding-bottom: 1rem !important; padding-top: 1rem !important; '><table class='w-100' style='width: 100% !important;'><tbody>";
                    body1 += "<tr><td>Attn:Order #:" + Data.tblOrder.OrderNumber + "<br></td></tr>";
                    body1 += "<tr><td style='padding-top: 40px;'><table class='table table-bordered' style='border: 1px solid #dee2e6; width: 100%; margin-bottom: 1rem; color: #212529; color: #555555; border-collapse: collapse; '><tbody>";
                    body1 += " <tr>";
                    body1 += "<td style='text-align: left; border-color: #ebebeb !important; border: 1px solid #dee2e6; padding: 0.75rem; vertical-align: top; border-top: 1px solid #dee2e6; '>ITEM NAME</td>";
                    body1 += "<td style='text-align: left; border-color: #ebebeb !important; border: 1px solid #dee2e6; padding: 0.75rem; vertical-align: top; border-top: 1px solid #dee2e6; '>ITEM ID</td>";
                    body1 += "<td style='text-align: left; border-color: #ebebeb !important; border: 1px solid #dee2e6; padding: 0.75rem; vertical-align: top; border-top: 1px solid #dee2e6; '>QTY</td>";
                    body1 += "<td style='text-align: left; border-color: #ebebeb !important; border: 1px solid #dee2e6; padding: 0.75rem; vertical-align: top; border-top: 1px solid #dee2e6; '>UNIT PRICE</td>";
                    body1 += "<td style='text-align: right; border-color: #ebebeb !important; border: 1px solid #dee2e6; padding: 0.75rem; vertical-align: top; border-top: 1px solid #dee2e6; '>TOTAL PRICE</td>";
                    body1 += "</tr>";
                    foreach (Sp_GetBOMData_Result item in BomData)
                    {
                        body1 += " <tr>";
                        body1 += "<td style='text-align: left; border-color: #ebebeb !important; border: 1px solid #dee2e6; padding: 0.75rem; vertical-align: top; border-top: 1px solid #dee2e6; '>"+item.subCategoryName+"</td>";
                        //body1 += "<td style='text-align: left; border-color: #ebebeb !important; border: 1px solid #dee2e6; padding: 0.75rem; vertical-align: top; border-top: 1px solid #dee2e6; '>"+item.SubCategoryID+"</td>";
                        body1 += "<td style='text-align: left; border-color: #ebebeb !important; border: 1px solid #dee2e6; padding: 0.75rem; vertical-align: top; border-top: 1px solid #dee2e6; '>"+item.Qty+"</td>";
                        body1 += "<td style='text-align: left; border-color: #ebebeb !important; border: 1px solid #dee2e6; padding: 0.75rem; vertical-align: top; border-top: 1px solid #dee2e6; '>"+item.Price+ "</td>";
                        body1 += "<td style='text-align: right; border-color: #ebebeb !important; border: 1px solid #dee2e6; padding: 0.75rem; vertical-align: top; border-top: 1px solid #dee2e6; '>" + item.TotalPrice+ "</td>";
                        body1 += "</tr>";
                    }
                   
                    body1 += "<tr><td style='text-align: right; border-color: #ebebeb !important; border: 1px solid #dee2e6; padding: 0.75rem; vertical-align: top; border-top: 1px solid #dee2e6; '><strong>Total</strong> </td>";
                    body1 += "<td style='text-align: right; border-color: #ebebeb !important; border: 1px solid #dee2e6; padding: 0.75rem; vertical-align: top; border-top: 1px solid #dee2e6; 'colspan='4'>" + GT + " €</td></tr>";
                    body1 += "</tbody></table>";
                    body1 += " </td></tr></tbody></table></td></tr>";
                    body1 += "</tbody> </table></td><td></td></tr></tbody></table></div>";

                    string body = "";
                    body += "<body  style='background-color:white !important'>";
                    body += " <div>";
                    body += " <table style='background-color: #f2f3f8; max-width:670px;' width='100%' border='0'  cellpadding='0' cellspacing='0'>";
                    body += " <tbody> <tr style='background-color:#333333;'><td style='padding: 0 35px; background-color:#333333;text-align: center;'><a><img src='https://ci6.googleusercontent.com/proxy/Ia8xyYsLq6FtQcWzOyAOvF7XpZC5N9JGdMFlTO2LwH6Q_PSpKXU2LVHg6bmHoSGjTN1EKugOuHt6dFMCU82XXyTadS1p1EfV7a70vjNPbIkMB7z9H6h_9hgZNRA9bAJNWW-fi4jazw=s0-d-e1-ft#https://automatische-gartenberegnung.de/wp-content/uploads/2020/05/logo-1_200x50.png' style='padding-top: 1%;' alt='Alternate Text' />  </a></td> </tr>";
                    body += "<tr style='color:#455056; font-size:15px;line-height:35px;text-align: center;'><td style='padding:6px;text-align: center;'></td></tr><tr style='color:#455056; font-size:15px;line-height:35px;text-align: center;'><td style='padding:6px;text-align: center;'>" + body1 + "</td></tr>";
                    body += "  </tbody></table>";
                    body += "</body>";


                    MailMessage mailMessage = new MailMessage(SenderEmail, Email, "Order Email", body);
                    mailMessage.IsBodyHtml = true;
                    mailMessage.BodyEncoding = System.Text.UTF8Encoding.UTF8;

                    Client.Send(mailMessage);

                    if (isAdmin==true)
                    {
                        body1 = "";
                        body1 += "<div class='d-flex justify-content-center' style='justify-content: center !important; '><table class='card p-3' style='width: 30%; transition: all 0.5s ease-in-out; border-radius: 0.55rem; background-color: #ffffff; border-color: #ffffff; position: relative; box-shadow: 0px 12px 23px 0px rgb(0 0 0 / 4%); margin-bottom: 30px; display: flex; flex-direction: column; min-width: 0; word-wrap: break-word; background-clip: border-box; border: 1px solid rgba(0,0,0,.125); padding: 1rem !important; '>";
                        body1 += "<tbody><tr><td></td><td style='text-align: center;width:100%;'><table class='w-100' style='width: 100% !important;'>";
                        body1 += "<tbody><tr><td style='text-align: center;'><h2 style='font-size: 2rem;font-weight: 500;margin: 0%;'>" + order.TotalPrice + " € Paid</h2></td></tr><tr><td class='pb-3 pt-3 text-center' style='padding-bottom: 1rem !important; padding-top: 1rem !important; text-align: center !important;'><h4 style='font-size: 1.5rem;font-weight: 500;margin: 0%;'>New order recieved.</h4></td></tr>";
                        body1 += "<tr><td class='pb-3 pt-3' style='padding-bottom: 1rem !important; padding-top: 1rem !important; '><table class='w-100' style='width: 100% !important;'><tbody>";
                        body1 += "<tr><td>Attn:Order #:"+Data.tblOrder.OrderNumber+"<br>Name: "+ UserData.FirstName+ "<br>Email: " + UserData.Email + "</td></tr>";
                        body1 += "<tr><td style='padding-top: 40px;'><table class='table table-bordered' style='border: 1px solid #dee2e6; width: 100%; margin-bottom: 1rem; color: #212529; color: #555555; border-collapse: collapse; '><tbody>";
                        body1 += " <tr>";
                        body1 += "<td style='text-align: left; border-color: #ebebeb !important; border: 1px solid #dee2e6; padding: 0.75rem; vertical-align: top; border-top: 1px solid #dee2e6; '>ITEM NAME</td>";
                        body1 += "<td style='text-align: left; border-color: #ebebeb !important; border: 1px solid #dee2e6; padding: 0.75rem; vertical-align: top; border-top: 1px solid #dee2e6; '>ITEM ID</td>";
                        body1 += "<td style='text-align: left; border-color: #ebebeb !important; border: 1px solid #dee2e6; padding: 0.75rem; vertical-align: top; border-top: 1px solid #dee2e6; '>QTY</td>";
                        body1 += "<td style='text-align: left; border-color: #ebebeb !important; border: 1px solid #dee2e6; padding: 0.75rem; vertical-align: top; border-top: 1px solid #dee2e6; '>UNIT PRICE</td>";
                        body1 += "<td style='text-align: right; border-color: #ebebeb !important; border: 1px solid #dee2e6; padding: 0.75rem; vertical-align: top; border-top: 1px solid #dee2e6; '>TOTAL PRICE</td>";
                        body1 += "</tr>";
                        foreach (Sp_GetBOMData_Result item in BomData)
                        {
                            body1 += " <tr>";
                            body1 += "<td style='text-align: left; border-color: #ebebeb !important; border: 1px solid #dee2e6; padding: 0.75rem; vertical-align: top; border-top: 1px solid #dee2e6; '>" + item.subCategoryName + "</td>";
                            //body1 += "<td style='text-align: left; border-color: #ebebeb !important; border: 1px solid #dee2e6; padding: 0.75rem; vertical-align: top; border-top: 1px solid #dee2e6; '>" + item.SubCategoryID + "</td>";
                            body1 += "<td style='text-align: left; border-color: #ebebeb !important; border: 1px solid #dee2e6; padding: 0.75rem; vertical-align: top; border-top: 1px solid #dee2e6; '>" + item.Qty + "</td>";
                            body1 += "<td style='text-align: left; border-color: #ebebeb !important; border: 1px solid #dee2e6; padding: 0.75rem; vertical-align: top; border-top: 1px solid #dee2e6; '>" + item.Price + "</td>";
                            body1 += "<td style='text-align: right; border-color: #ebebeb !important; border: 1px solid #dee2e6; padding: 0.75rem; vertical-align: top; border-top: 1px solid #dee2e6; '>" + item.TotalPrice + "</td>";
                            body1 += "</tr>";
                        }

                        body1 += "<tr><td style='text-align: right; border-color: #ebebeb !important; border: 1px solid #dee2e6; padding: 0.75rem; vertical-align: top; border-top: 1px solid #dee2e6; '><strong>Total</strong> </td>";
                        body1 += "<td style='text-align: right; border-color: #ebebeb !important; border: 1px solid #dee2e6; padding: 0.75rem; vertical-align: top; border-top: 1px solid #dee2e6; ' colspan='4'>" + GT + " €</td></tr>";
                        body1 += "</tbody></table>";
                        body1 += " </td></tr></tbody></table></td></tr>";
                        body1 += "</tbody> </table></td><td></td></tr></tbody></table></div>";

                         body = "";
                        body += "<body  style='background-color:white !important'>";
                        body += " <div>";
                        body += " <table style='background-color: #f2f3f8; max-width:670px;' width='100%' border='0'  cellpadding='0' cellspacing='0'>";
                        body += " <tbody> <tr style='background-color:#333333;'><td style='padding: 0 35px; background-color:#333333;text-align: center;'><a><img src='https://ci6.googleusercontent.com/proxy/Ia8xyYsLq6FtQcWzOyAOvF7XpZC5N9JGdMFlTO2LwH6Q_PSpKXU2LVHg6bmHoSGjTN1EKugOuHt6dFMCU82XXyTadS1p1EfV7a70vjNPbIkMB7z9H6h_9hgZNRA9bAJNWW-fi4jazw=s0-d-e1-ft#https://automatische-gartenberegnung.de/wp-content/uploads/2020/05/logo-1_200x50.png' style='padding-top: 1%;' alt='Alternate Text' />  </a></td> </tr>";
                        body += "<tr style='color:#455056; font-size:15px;line-height:35px;text-align: center;'><td style='padding:6px;text-align: center;'></td></tr><tr style='color:#455056; font-size:15px;line-height:35px;text-align: center;'><td style='padding:6px;text-align: center;'>" + body1 + "</td></tr>";
                        body += "  </tbody></table>";
                        body += "</body>";


                        mailMessage = new MailMessage(SenderEmail, SenderEmail, "New Order recieved", body);
                        mailMessage.IsBodyHtml = true;
                        mailMessage.BodyEncoding = System.Text.UTF8Encoding.UTF8;

                        Client.Send(mailMessage);
                    }

                   



                }
            }
            catch (Exception ex)
            {
                return View("FailureView");
            }
            return RedirectToAction("Transactions", "Customer", new { Success = "Payment Successfull" });
        }
        private PayPal.Api.Payment payment;
        private Payment ExecutePayment(APIContext apiContext, string payerId, string paymentId)
        {



            var paymentExecution = new PaymentExecution()
            {
                payer_id = payerId
            };
            this.payment = new Payment()
            {
                id = paymentId
            };
            return this.payment.Execute(apiContext, paymentExecution);
        }

        public ActionResult Orders(string Success, string Update, string Delete, string Error)
        {
            return RedirectToAction("Orders", "Customer", new { Error = Error });
        }
        private Payment CreatePayment(APIContext apiContext, string redirectUrl)
        {

            string Amount = Request.Params["Amount"];
            var guid = Convert.ToString((new Random()).Next(100000));
            //create itemlist and add item objects to it  
            var itemList = new ItemList()
            {
                items = new List<Item>()
            };
            //Adding Item Details like name, currency, price etc  
            itemList.items.Add(new Item()
            {
                name = "AUTOMATISCHE",
                currency = "USD",
                price = Amount,
                quantity = "1",
                sku = "sku"
            });
            var payer = new Payer()
            {
                payment_method = "paypal"
            };
            // Configure Redirect Urls here with RedirectUrls object  
            var redirUrls = new RedirectUrls()
            {
                cancel_url = redirectUrl + "&Cancel=true",
                return_url = redirectUrl
            };
            // Adding Tax, shipping and Subtotal details  
            var details = new Details()
            {
                tax = "0",
                shipping = "0",
                subtotal = Amount
            };
            //Final amount with details  
            var amount = new Amount()
            {
                currency = "USD",
                total = Amount, // Total must be equal to sum of tax, shipping and subtotal.  
                details = details
            };
            var transactionList = new List<Transaction>();
            // Adding description about the transaction  
            transactionList.Add(new Transaction()
            {
                description = "Transaction description",
                invoice_number = "CF-" + guid, //Generate an Invoice No  
                amount = amount,
                item_list = itemList
            });
            this.payment = new Payment()
            {
                intent = "sale",
                payer = payer,
                transactions = transactionList,
                redirect_urls = redirUrls
            };
            // Create a payment using a APIContext  
            return this.payment.Create(apiContext);
        }


    }
}