using DrawingTheme.Models;
using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Linq;
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
                OrderID = Convert.ToInt32(Request.QueryString["OrderId"]);

         
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
                    order.TotalPrice = Convert.ToInt32(executedPayment.transactions[0].amount.total);
                    order.Status = 1;
                    DB.Entry(order);
                    DB.SaveChanges();
                    DB.SaveChanges();
              
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