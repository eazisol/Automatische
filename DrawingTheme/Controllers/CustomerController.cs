using DrawingTheme.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;

namespace DrawingTheme.Controllers
{
    [FilterConfig.AuthorizeActionFilter]
    public class CustomerController : BaseController
    {
        AutomatischeEntities DB = new AutomatischeEntities();
        // GET: Customer
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult CustomerList(string Success, string Update, string Delete, string Error)
        {
            List<tblUser> UserList = DB.tblUsers.Where(x=>x.RoleId==2).ToList();

            ViewBag.Success = Success;
            ViewBag.Update = Update;
            ViewBag.Delete = Delete;
            ViewBag.Error = Error;
            return View(UserList);
        }
        public ActionResult ChangePassword(int id, string Success, string Error)
        {
          
            ViewBag.Success = Success;
            ViewBag.Error = Error;
            tblUser user = DB.tblUsers.Find(id);
            return View(user);
        }

        [HttpPost]
        public ActionResult ChangePassword(int id, string OldPassword, string NewPassword, string ConfirmPassword, string Email)
        {
            string pass = null;
            try
            {

                HttpCookie cookieObj = Request.Cookies["User"];
                int UserId = Int32.Parse(cookieObj["UserId"]);
                byte[] EncDataBtye = new byte[OldPassword.Length];
                EncDataBtye = System.Text.Encoding.UTF8.GetBytes(OldPassword);
                pass = Convert.ToBase64String(EncDataBtye);
                tblUser Data = new tblUser();
                Data = DB.tblUsers.Select(r => r).Where(x => x.Email == Email && x.Password == pass).FirstOrDefault();
                if (Data != null)
                {

                    if (NewPassword == ConfirmPassword)
                    {
                        EncDataBtye = new byte[NewPassword.Length];
                        EncDataBtye = System.Text.Encoding.UTF8.GetBytes(NewPassword);
                        pass = Convert.ToBase64String(EncDataBtye);
                    }
                    else
                    {
                        ViewBag.PError = "New Password and Confirm Password not Matched!!!";
                        return View();
                    }

                    Data.Password = pass;
                    Data.EditDate = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));
                    Data.EditBy = UserId;
                    DB.Entry(Data);
                    DB.SaveChanges();
                    ViewBag.Success = "Password has been change successfully!!!";

                    tblLog LogData = new tblLog();
                    LogData.UserId = UserId;
                    LogData.Action = "Change Password";
                    LogData.CreatedDate = DateTime.Now;
                    DB.tblLogs.Add(LogData);
                    DB.SaveChanges();


                    tblSetting setting = DB.tblSettings.Find(1);
                    //string SenderEmail = System.Configuration.ConfigurationManager.AppSettings["SenderEmail"].ToString();
                    string SenderEmail = setting.Email;
                    //string SenderPassword = System.Configuration.ConfigurationManager.AppSettings["SenderPassword"].ToString();
                    string SenderPassword = setting.Password;
                    //SmtpClient Client = new SmtpClient("yehtohoga.com", 25);
                    SmtpClient Client = new SmtpClient(setting.SMTP, Convert.ToInt32(setting.Port));
                    //Client.EnableSsl = false;
                    Client.EnableSsl = Convert.ToBoolean(setting.isActive); ;
                    Client.Timeout = 100000;
                    Client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    Client.UseDefaultCredentials = false;
                    Client.Credentials = new System.Net.NetworkCredential(SenderEmail, SenderPassword);

                    string link = Request.Url.ToString();
                    link = link.Replace("ForgetPassword", "ChangeForgetPassword");

                    byte[] b = System.Text.ASCIIEncoding.ASCII.GetBytes(Email);
                    string encrypted = Convert.ToBase64String(b);

                    byte[] t = System.Text.ASCIIEncoding.ASCII.GetBytes(DateTime.Now.ToString());
                    string encryptedTime = Convert.ToBase64String(t);


                    string body1 = "";
                    body1 += "Welcome to Automatische!";
                    body1 += "<br />Your Password successfully changed";
                    body1 += "<br /><br />Yours,<br />The Automatische Team";

                    string body = "";
                    body += "<body  style='background-color:white !important'>";
                    body += " <div>";
                    //body += "<h3>Hello " + sa.ReceiveName + ",</h3>";
                    body += " <table style='background-color: #f2f3f8; max-width:670px;' width='100%' border='0'  cellpadding='0' cellspacing='0'>";
                    body += " <tbody> <tr style='background-color: #333333;'><td style='padding: 0 35px; background-color:#333333;'><a><img src='https://ci6.googleusercontent.com/proxy/Ia8xyYsLq6FtQcWzOyAOvF7XpZC5N9JGdMFlTO2LwH6Q_PSpKXU2LVHg6bmHoSGjTN1EKugOuHt6dFMCU82XXyTadS1p1EfV7a70vjNPbIkMB7z9H6h_9hgZNRA9bAJNWW-fi4jazw=s0-d-e1-ft#https://automatische-gartenberegnung.de/wp-content/uploads/2020/05/logo-1_200x50.png' style='padding-top: 1%;' alt='Alternate Text' />  </a></td> </tr>";
                    body += "<tr style='color:#455056; font-size:15px;line-height:35px;text-align: center;'><td style='padding:6px;text-align: center;'></td></tr><tr style='color:#455056; font-size:15px;line-height:35px;text-align: center;'><td style='padding:6px;text-align: center;'>" + body1 + "</td></tr>";
                    body += "  </tbody></table>";
                    body += "</body>";


                    MailMessage mailMessage = new MailMessage(SenderEmail, Email, "Password alert", body);
                    mailMessage.IsBodyHtml = true;
                    mailMessage.BodyEncoding = System.Text.UTF8Encoding.UTF8;

                    Client.Send(mailMessage);


                    return RedirectToAction("ChangePassword", "Customer",new {id= Data.UserId , Success = "Password has been change successfully!!!" });
                }
                else
                {
                    ViewBag.Error = "Old password is not Correct!!!";
                    return RedirectToAction("ChangePassword", "Customer", new { id = id, Error = "Old password is not Correct!!!" });
                }


            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            return View();
        }

        [HttpPost]
        public ActionResult CustomerChangePassword(int id, string OldPassword, string NewPassword, string ConfirmPassword, string Email)
        {
            string pass = null;
            try
            {

                HttpCookie cookieObj = Request.Cookies["User"];
                int UserId = Int32.Parse(cookieObj["UserId"]);
                byte[] EncDataBtye = new byte[OldPassword.Length];
                EncDataBtye = System.Text.Encoding.UTF8.GetBytes(OldPassword);
                pass = Convert.ToBase64String(EncDataBtye);
                tblUser Data = new tblUser();
                Data = DB.tblUsers.Select(r => r).Where(x => x.Email == Email && x.Password == pass).FirstOrDefault();
                if (Data != null)
                {

                    if (NewPassword == ConfirmPassword)
                    {
                        EncDataBtye = new byte[NewPassword.Length];
                        EncDataBtye = System.Text.Encoding.UTF8.GetBytes(NewPassword);
                        pass = Convert.ToBase64String(EncDataBtye);
                    }
                    else
                    {
                        ViewBag.PError = "New Password and Confirm Password not Matched!!!";
                        return View();
                    }

                    Data.Password = pass;
                    Data.EditDate = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));
                    Data.EditBy = UserId;
                    DB.Entry(Data);
                    DB.SaveChanges();
                    ViewBag.Success = "Password has been change successfully!!!";

                    tblLog LogData = new tblLog();
                    LogData.UserId = UserId;
                    LogData.Action = "Change Password";
                    LogData.CreatedDate = DateTime.Now;
                    DB.tblLogs.Add(LogData);
                    DB.SaveChanges();


                    tblSetting setting = DB.tblSettings.Find(1);
                    //string SenderEmail = System.Configuration.ConfigurationManager.AppSettings["SenderEmail"].ToString();
                    string SenderEmail = setting.Email;
                    //string SenderPassword = System.Configuration.ConfigurationManager.AppSettings["SenderPassword"].ToString();
                    string SenderPassword = setting.Password;
                    //SmtpClient Client = new SmtpClient("yehtohoga.com", 25);
                    SmtpClient Client = new SmtpClient(setting.SMTP, Convert.ToInt32(setting.Port));
                    //Client.EnableSsl = false;
                    Client.EnableSsl = Convert.ToBoolean(setting.isActive); ;
                    Client.Timeout = 100000;
                    Client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    Client.UseDefaultCredentials = false;
                    Client.Credentials = new System.Net.NetworkCredential(SenderEmail, SenderPassword);

                    string link = Request.Url.ToString();
                    link = link.Replace("ForgetPassword", "ChangeForgetPassword");

                    byte[] b = System.Text.ASCIIEncoding.ASCII.GetBytes(Email);
                    string encrypted = Convert.ToBase64String(b);

                    byte[] t = System.Text.ASCIIEncoding.ASCII.GetBytes(DateTime.Now.ToString());
                    string encryptedTime = Convert.ToBase64String(t);


                    string body1 = "";
                    body1 += "Welcome to Automatische!";
                    body1 += "<br />Your Password successfully changed";
                    body1 += "<br /><br />Yours,<br />The Automatische Team";

                    string body = "";
                    body += "<body  style='background-color:white !important'>";
                    body += " <div>";
                    //body += "<h3>Hello " + sa.ReceiveName + ",</h3>";
                    body += " <table style='background-color: #f2f3f8; max-width:670px;' width='100%' border='0'  cellpadding='0' cellspacing='0'>";
                    body += " <tbody> <tr style='background-color: #333333;'><td style='padding: 0 35px; background-color:#333333;'><a><img src='https://ci6.googleusercontent.com/proxy/Ia8xyYsLq6FtQcWzOyAOvF7XpZC5N9JGdMFlTO2LwH6Q_PSpKXU2LVHg6bmHoSGjTN1EKugOuHt6dFMCU82XXyTadS1p1EfV7a70vjNPbIkMB7z9H6h_9hgZNRA9bAJNWW-fi4jazw=s0-d-e1-ft#https://automatische-gartenberegnung.de/wp-content/uploads/2020/05/logo-1_200x50.png' style='padding-top: 1%;' alt='Alternate Text' />  </a></td> </tr>";
                    body += "<tr style='color:#455056; font-size:15px;line-height:35px;text-align: center;'><td style='padding:6px;text-align: center;'></td></tr><tr style='color:#455056; font-size:15px;line-height:35px;text-align: center;'><td style='padding:6px;text-align: center;'>" + body1 + "</td></tr>";
                    body += "  </tbody></table>";
                    body += "</body>";


                    MailMessage mailMessage = new MailMessage(SenderEmail, Email, "Password alert", body);
                    mailMessage.IsBodyHtml = true;
                    mailMessage.BodyEncoding = System.Text.UTF8Encoding.UTF8;

                    Client.Send(mailMessage);


                    return RedirectToAction("Profile", "User", new { id = Data.UserId, Success = "Password has been change successfully!!!" });
                }
                else
                {
                    ViewBag.Error = "Old password is not Correct!!!";
                    return RedirectToAction("Profile", "User", new { id = id, Error = "Old password is not Correct!!!" });
                }


            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            return View();
        }

        public ActionResult AdminChangePassword(int id, string NewPassword, string Email)
        {
            string pass = null;
            try
            {

                HttpCookie cookieObj = Request.Cookies["User"];
                int UserId = Int32.Parse(cookieObj["UserId"]);
                
                tblUser Data = new tblUser();
                Data = DB.tblUsers.Select(r => r).Where(x => x.Email == Email ).FirstOrDefault();
                if (Data != null)
                {

                    byte[] EncDataBtye = new byte[NewPassword.Length];
                    EncDataBtye = System.Text.Encoding.UTF8.GetBytes(NewPassword);
                    pass = Convert.ToBase64String(EncDataBtye);

                    Data.Password = pass;
                    Data.EditDate = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));
                    Data.EditBy = UserId;
                    DB.Entry(Data);
                    DB.SaveChanges();
                    ViewBag.Success = "Password has been change successfully!!!";

                    tblLog LogData = new tblLog();
                    LogData.UserId = UserId;
                    LogData.Action = "Change Password";
                    LogData.CreatedDate = DateTime.Now;
                    DB.tblLogs.Add(LogData);
                    DB.SaveChanges();



                    tblSetting setting = DB.tblSettings.Find(1);
                    //string SenderEmail = System.Configuration.ConfigurationManager.AppSettings["SenderEmail"].ToString();
                    string SenderEmail = setting.Email;
                    //string SenderPassword = System.Configuration.ConfigurationManager.AppSettings["SenderPassword"].ToString();
                    string SenderPassword = setting.Password;
                    //SmtpClient Client = new SmtpClient("yehtohoga.com", 25);
                    SmtpClient Client = new SmtpClient(setting.SMTP, Convert.ToInt32(setting.Port));
                    //Client.EnableSsl = false;
                    Client.EnableSsl = Convert.ToBoolean(setting.isActive); ;
                    Client.Timeout = 100000;
                    Client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    Client.UseDefaultCredentials = false;
                    Client.Credentials = new System.Net.NetworkCredential(SenderEmail, SenderPassword);

                    string link = Request.Url.ToString();
                    link = link.Replace("ForgetPassword", "ChangeForgetPassword");

                    byte[] b = System.Text.ASCIIEncoding.ASCII.GetBytes(Email);
                    string encrypted = Convert.ToBase64String(b);

                    byte[] t = System.Text.ASCIIEncoding.ASCII.GetBytes(DateTime.Now.ToString());
                    string encryptedTime = Convert.ToBase64String(t);


                    string body1 = "";
                    body1 += "Welcome to Automatische!";
                    body1 += "<br />Your Password successfully changed";
                    body1 += "<br /><br />Yours,<br />The Automatische Team";

                    string body = "";
                    body += "<body  style='background-color:white !important'>";
                    body += " <div>";
                    //body += "<h3>Hello " + sa.ReceiveName + ",</h3>";
                    body += " <table style='background-color: #f2f3f8; max-width:670px;' width='100%' border='0'  cellpadding='0' cellspacing='0'>";
                    body += " <tbody> <tr style='background-color: #333333;'><td style='padding: 0 35px; background-color:#333333;'><a><img src='https://ci6.googleusercontent.com/proxy/Ia8xyYsLq6FtQcWzOyAOvF7XpZC5N9JGdMFlTO2LwH6Q_PSpKXU2LVHg6bmHoSGjTN1EKugOuHt6dFMCU82XXyTadS1p1EfV7a70vjNPbIkMB7z9H6h_9hgZNRA9bAJNWW-fi4jazw=s0-d-e1-ft#https://automatische-gartenberegnung.de/wp-content/uploads/2020/05/logo-1_200x50.png' style='padding-top: 1%;' alt='Alternate Text' />  </a></td> </tr>";
                    body += "<tr style='color:#455056; font-size:15px;line-height:35px;text-align: center;'><td style='padding:6px;text-align: center;'></td></tr><tr style='color:#455056; font-size:15px;line-height:35px;text-align: center;'><td style='padding:6px;text-align: center;'>" + body1 + "</td></tr>";
                    body += "  </tbody></table>";
                    body += "</body>";


                    MailMessage mailMessage = new MailMessage(SenderEmail, Email, "Password alert", body);
                    mailMessage.IsBodyHtml = true;
                    mailMessage.BodyEncoding = System.Text.UTF8Encoding.UTF8;

                    Client.Send(mailMessage);


                    return RedirectToAction("CustomerList", "Customer", new {  Success = "Password has been change successfully!!!" });
                }
                else
                {
                    ViewBag.Error = "Old password is not Correct!!!";
                    return RedirectToAction("CustomerList", "Customer", new { Error = "Old password is not Correct!!!" });
                }


            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            return View();
        }

        public ActionResult Orders(string Success, string Update, string Delete, string Error,string status)
        {
            HttpCookie cookieObj = Request.Cookies["User"];
            int UserId = Int32.Parse(cookieObj["UserId"]);
            int RoleId = Int32.Parse(cookieObj["RoleId"]);
            List<tblOrder> Orders = null;
            if (RoleId !=2)
            {
                if (status == "" || status == null)
                {
                    Orders = DB.tblOrders.Where(x => x.Status == 1).ToList();
                }
                if (status == "Pending" )
                {
                    Orders = DB.tblOrders.Where(x=>x.Status==0 || x.Status==null).ToList();
                }
                if (status == "Completed")
                {
                    Orders = DB.tblOrders.Where(x => x.Status == 1).ToList();
                }
            }
            else
            {
                if (status == "" || status == null)
                {
                    Orders = DB.tblOrders.Where(x => x.CreatedBy == UserId && x.Status == 1).ToList();
                }
                if (status == "Pending")
                {
                    Orders = DB.tblOrders.Where(x => x.CreatedBy == UserId && x.Status == 0 || x.Status == null).ToList();
                }
                if (status == "Completed")
                {
                    Orders = DB.tblOrders.Where(x => x.CreatedBy == UserId && x.Status == 1).ToList();
                }
               
            }
            

            ViewBag.Success = Success;
            ViewBag.Update = Update;
            ViewBag.Delete = Delete;
            ViewBag.Error = Error;
            return View(Orders);
        }


        [HttpPost]
        public ActionResult AddOrder(tblOrder Order)
        {
            tblOrder Data = new tblOrder();
            try
            {
                HttpCookie cookieObj = Request.Cookies["User"];
                int UserId = Int32.Parse(cookieObj["UserId"]);
                int RoleId = Int32.Parse(cookieObj["RoleId"]);
                //int UserId = 1;
                if (Order.OrderId == 0)
                {
                    Order.OrderNumber = DB.SpOrderNumber().FirstOrDefault();
                    if (DB.tblOrders.Select(r => r).Where(x => x.OrderNumber == Order.OrderNumber).FirstOrDefault() == null)
                    {
                        
                        Data = Order;


                        Data.CreatedDate = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));
                        Data.CreatedBy = UserId;
                        Data.EditDate = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));
                        Data.EditBy = UserId;
                        DB.tblOrders.Add(Data);
                        DB.SaveChanges();




                        tblLog LogData = new tblLog();
                        LogData.UserId = UserId;
                        LogData.Action = "Add Order";
                        LogData.CreatedDate = DateTime.Now;
                        DB.tblLogs.Add(LogData);
                        DB.SaveChanges();

                        return RedirectToAction("Orders", new { Success = "Order has been add successfully." });

                        //return RedirectToAction("UserList", new { Success = "User has been add successfully." });
                    }
                    else
                    {

                        return RedirectToAction("Orders", new { Error = "Order Already Exsist!!!" });
                        //return RedirectToAction("UserList", new { Error = "User Already Exsist!!!" });
                    }
                }
                else
                {
                    var check = DB.tblOrders.Select(r => r).Where(x => x.OrderNumber == Order.OrderNumber).FirstOrDefault();
                    if (check == null || check.OrderId == Order.OrderId)
                    {
                        Data = DB.tblOrders.Select(r => r).Where(x => x.OrderId == Order.OrderId).FirstOrDefault();
                        //Data.username = User.username;

                        Data.OrderId = Order.OrderId;
                        Data.OrderNumber = Order.OrderNumber;
                        Data.Name = Order.Name;
                        Data.TotalPrice = Order.TotalPrice;
                        Data.Status = Order.Status;
                        Data.EditDate = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));
                        Data.EditBy = UserId;
                        Data.isActive = Order.isActive;
                        DB.Entry(Data);
                        DB.SaveChanges();

                        tblLog LogData = new tblLog();
                        LogData.UserId = UserId;
                        LogData.Action = "Update Order";
                        LogData.CreatedDate = DateTime.Now;
                        DB.tblLogs.Add(LogData);
                        DB.SaveChanges();


                        return RedirectToAction("Orders", new { Update = "Order has been Update successfully." });

                        //return RedirectToAction("UserList", new { Update = "User has been Update successfully." });
                    }
                    else
                    {

                        return RedirectToAction("Orders", new { Error = "Order Already Exsist!!!" });
                        //return RedirectToAction("UserList", new { Error = "User Already Exsist!!!" });
                    }

                }


            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            return RedirectToAction("Orders");
        }


        [HttpPost]
        public ActionResult DeleteOrder(int OrderId)
        {
            tblOrder Data = new tblOrder();
            List<tblOrderDetail> DataDetails = new List<tblOrderDetail>();
            HttpCookie cookieObj = Request.Cookies["User"];
            int CUserId = Int32.Parse(cookieObj["UserId"]);
            //int CUserId = 1;
            try
            {
                DataDetails = DB.tblOrderDetails.Where(x => x.OrderId == OrderId).ToList();

                foreach (var item in DataDetails)
                {
                    if (item != null)
                    {
                        DB.Entry(item).State = EntityState.Deleted;
                        DB.SaveChanges();
                    }
                }

                Data = DB.tblOrders.Select(r => r).Where(x => x.OrderId == OrderId).FirstOrDefault();
                DB.Entry(Data).State = EntityState.Deleted;
                DB.SaveChanges();

                tblLog LogData = new tblLog();
                LogData.UserId = CUserId;
                LogData.Action = "Delete Order";
                LogData.CreatedDate = DateTime.Now;
                DB.tblLogs.Add(LogData);
                DB.SaveChanges();
                return RedirectToAction("Index","Plans", new { Delete = "Plan has been deleted successfully." });
            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            return Json(0);
        }

        public ActionResult BOMView(int OrderId = 0)
        {
            HttpCookie cookieObj = Request.Cookies["User"];
            int UserId = Int32.Parse(cookieObj["UserId"]);
            int RoleId = Int32.Parse(cookieObj["RoleId"]);
            List<Sp_GetAccesoires_Result> Data = new List<Sp_GetAccesoires_Result>();
            tblTransaction transaction = new tblTransaction();
            try
            {
                ViewBag.UserId = UserId;
                ViewBag.OrderId = OrderId;
                transaction = DB.tblTransactions.Where(x => x.OrderId == OrderId).FirstOrDefault();
                ViewBag.BomData = DB.Sp_GetBOMData(OrderId).ToList();
            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            return View(transaction);
        }



        [HttpPost]
        public JsonResult AjaxAddOrder(tblOrder Order)
        {
            tblOrder Data = new tblOrder();
            try
            {
                HttpCookie cookieObj = Request.Cookies["User"];
                int UserId = Int32.Parse(cookieObj["UserId"]);
                int RoleId = Int32.Parse(cookieObj["RoleId"]);
                //int UserId = 1;
                if (Order.OrderId == 0)
                {
                    Order.OrderNumber = DB.SpOrderNumber().FirstOrDefault();
                    if (DB.tblOrders.Select(r => r).Where(x => x.OrderNumber == Order.OrderNumber).FirstOrDefault() == null)
                    {

                        Data = Order;


                        Data.CreatedDate = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));
                        Data.CreatedBy = UserId;
                        Data.EditDate = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));
                        Data.EditBy = UserId;
                        DB.tblOrders.Add(Data);
                        DB.SaveChanges();




                        tblLog LogData = new tblLog();
                        LogData.UserId = UserId;
                        LogData.Action = "Add Order";
                        LogData.CreatedDate = DateTime.Now;
                        DB.tblLogs.Add(LogData);
                        DB.SaveChanges();
                        //HttpCookie cookie = new HttpCookie("User");
                        //cookie["OrderId"] = Data.OrderId.ToString();
                        //HttpCookie cookieObj = Request.Cookies["User"];
                        cookieObj.Values["OrderId"] = Data.OrderId.ToString();
                        cookieObj.Expires = DateTime.Now.AddMonths(1);

                        // Add it to the current web response.
                        Response.Cookies.Add(cookieObj);
                        //int OrderId = Int32.Parse(cookieObj["OrderId"]);
                        return Json(new {ID= Data.OrderId ,Name=Data.Name});

                        //return RedirectToAction("UserList", new { Success = "User has been add successfully." });
                    }
                }
                


            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            return Json(0);
        }


        [HttpPost]
        public JsonResult CheckSpriDis(int OrderId,string UniqueId, double? Distance, double? MinAngle, double? CoverAngle)
        {
            tblSubCategory SubCategory = new tblSubCategory();
            tblOrderDetail Data = new tblOrderDetail();
            string SubCatName = "";
            try
            {
                HttpCookie cookieObj = Request.Cookies["User"];
                int UserId = Int32.Parse(cookieObj["UserId"]);
                int RoleId = Int32.Parse(cookieObj["RoleId"]);
                //int UserId = 1;
                

                SubCategory = DB.tblSubCategories.Where(x => x.ThrowDistanceMax>=Distance && x.MaxAngle >= CoverAngle && x.MinAngle <= CoverAngle).FirstOrDefault();
                SubCatName = SubCategory.SubcategoryName;

                Data = DB.tblOrderDetails.Where(x => x.OrderId == OrderId && x.UniqueId == UniqueId).FirstOrDefault();
                if (Data != null)
                {
                    Data.SubcategoryName = SubCategory.SubcategoryName;
                    Data.MaxAngle = SubCategory.MaxAngle;
                    Data.MinAngle = SubCategory.MinAngle;
                    Data.ThrowDistanceMax = SubCategory.ThrowDistanceMax;
                    Data.ThrowDistanceMin = SubCategory.ThrowDistanceMin;
                    Data.CoverAngle = CoverAngle;
                    Data.CoverDistance = Distance;
                    DB.Entry(Data);
                    DB.SaveChanges();
                }


            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            return Json(SubCatName);
        }


        [HttpPost]
        public JsonResult CheckSpriMH(int OrderId, string UniqueId, string SubName, double? CoverAngle)
        {
            tblSubCategory SubCategory = new tblSubCategory();
            tblOrderDetail Data = new tblOrderDetail();
            double? SubCatMH = 0.00;
            try
            {
                HttpCookie cookieObj = Request.Cookies["User"];
                int UserId = Int32.Parse(cookieObj["UserId"]);
                int RoleId = Int32.Parse(cookieObj["RoleId"]);
                //int UserId = 1;
                SubCategory = DB.tblSubCategories.Where(x => x.SubcategoryName == SubName).FirstOrDefault();
                if(CoverAngle<=45 && SubCategory.mh45!=null)
                {
                    SubCatMH = SubCategory.mh45;
                }
                else if(CoverAngle <= 90 && SubCategory.mh90 != null)
                {
                    SubCatMH = SubCategory.mh90;
                }
                else if(CoverAngle <= 105 && SubCategory.mh105 != null)
                {
                    SubCatMH = SubCategory.mh105;
                }
                else if(CoverAngle <= 180 && SubCategory.mh180 != null)
                {
                    SubCatMH = SubCategory.mh180;
                }
                else if(CoverAngle <= 210 && SubCategory.mh210 != null)
                {
                    SubCatMH = SubCategory.mh210;
                }
                else if(CoverAngle <= 270 && SubCategory.mh270 != null)
                {
                    SubCatMH = SubCategory.mh270;
                }
                else if(CoverAngle <= 360 && SubCategory.mh360 != null)
                {
                    SubCatMH = SubCategory.mh360;
                }
                Data = DB.tblOrderDetails.Where(x => x.OrderId == OrderId && x.UniqueId == UniqueId).FirstOrDefault();
                if(Data!=null)
                {
                    Data.mh = SubCatMH;
                    DB.Entry(Data);
                    DB.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            return Json(SubCatMH);
        }

        [HttpPost]
        public JsonResult AddOrderDetails(tblOrderDetail OrderDetail)
        {
            HttpCookie cookieObj = Request.Cookies["User"];
            int UserId = Int32.Parse(cookieObj["UserId"]);
            tblOrderDetail Data = new tblOrderDetail();
            tblOrderDetail check = new tblOrderDetail();
            List<tblOrderDetail> OrderDetailData = new List<tblOrderDetail>();
            tblSubCategory SubCategory = new tblSubCategory();

            try
            {
                double? TotalPrice = 0;
                double? TotalMH = 0;

                SubCategory = DB.tblSubCategories.Where(x => x.SubcategoryID == OrderDetail.SubCategoryID).FirstOrDefault();
                if (SubCategory != null)
                {

                    check = DB.tblOrderDetails.Where(x => x.UniqueId == OrderDetail.UniqueId && x.OrderId == OrderDetail.OrderId).FirstOrDefault();
                    if(check==null)
                    {
                        Data = OrderDetail;
                        Data.SubcategoryName = SubCategory.SubcategoryName;
                        if(OrderDetail.IWLength!=null&& OrderDetail.IWLength != 0)
                        {
                            Data.Price = SubCategory.Price*(OrderDetail.IWLength+3);
                        }
                        else if(OrderDetail.PELength != null && OrderDetail.PELength != 0)
                        {
                            double? Length = OrderDetail.PELength+3;
                            int H = 0;
                            int F = 0;
                            int T = 0;
                            int D = 0;
                            int M = 0;
                            while (Length>0)
                            {
                                if (Length>50)
                                {
                                    D = Convert.ToInt32(Decimal.Truncate(Convert.ToDecimal(Length) / 100));
                                    if(D>0)
                                    {
                                        H = H + D;
                                    }
                                    else
                                    {
                                        H = H + 1;
                                        break;
                                    }
                                    Length = Length % 100;
                                }
                                else if(Length > 25)
                                {
                                    D = Convert.ToInt32(Decimal.Truncate(Convert.ToDecimal(Length) / 50));
                                    if (D > 0)
                                    {
                                        F = F + D;
                                    }
                                    else
                                    {
                                        F = F + 1;
                                        break;
                                    }
                                    Length = Length % 50;
                                }
                                else if(Length > 0)
                                {
                                    D = Convert.ToInt32(Decimal.Truncate(Convert.ToDecimal(Length) / 25));
                                    if (D > 0)
                                    {
                                        T = T + D;
                                    }
                                    else
                                    {
                                        T = T + 1;
                                        break;
                                    }
                                    Length = Length % 25;
                                }
                            }

                            Data.PEHPipe = H;
                            Data.PEFPipe = F;
                            Data.PETPipe = T;

                            Data.Price = (H * 99) + (F * 59) + (T * 39);
                        }
                        else
                        {
                            Data.Price = SubCategory.Price;
                        }
                        Data.Qty = 1;
                        DB.tblOrderDetails.Add(Data);
                        DB.SaveChanges();
                        tblLog LogData = new tblLog();
                        LogData.UserId = UserId;
                        LogData.Action = "Add Order Details";
                        LogData.CreatedDate = DateTime.Now;
                        DB.tblLogs.Add(LogData);
                        DB.SaveChanges();
                    }
                    else
                    {
                        Data = OrderDetail;
                        Data.OrderId = OrderDetail.OrderId;
                        Data.SubCategoryID = OrderDetail.SubCategoryID;
                        Data.MinAngle = OrderDetail.MinAngle;
                        Data.MaxAngle = OrderDetail.MaxAngle;
                        Data.ThrowDistanceMax = OrderDetail.ThrowDistanceMax;
                        Data.ThrowDistanceMin = OrderDetail.ThrowDistanceMin;
                        Data.UniqueId = OrderDetail.UniqueId;
                        Data.SubcategoryName = SubCategory.SubcategoryName;
                        Data.mh = OrderDetail.mh;
                        Data.CoverDistance = OrderDetail.CoverDistance;
                        Data.CoverAngle = OrderDetail.CoverAngle;
                        if (OrderDetail.IWLength != null && OrderDetail.IWLength != 0)
                        {
                            Data.Price = SubCategory.Price * (OrderDetail.IWLength + 3);
                        }
                        else
                        {
                            Data.Price = SubCategory.Price;
                        }
                        Data.IWLength = OrderDetail.IWLength+3;
                        Data.PELength = OrderDetail.PELength+3;
                        Data.Qty = 1;
                        DB.Entry(Data);
                        DB.SaveChanges();

                        tblLog LogData = new tblLog();
                        LogData.UserId = UserId;
                        LogData.Action = "Update Order Details";
                        LogData.CreatedDate = DateTime.Now;
                        DB.tblLogs.Add(LogData);
                        DB.SaveChanges();
                    }
                    




                    
                }
                OrderDetailData = DB.tblOrderDetails.Where(x => x.OrderId == OrderDetail.OrderId).ToList();

                TotalPrice=OrderDetailData.Sum(S => S.Price);
                TotalMH = OrderDetailData.Sum(S => S.mh);

                tblOrder OrderData= DB.tblOrders.Where(x => x.OrderId == OrderDetail.OrderId).FirstOrDefault();
                OrderData.TotalPrice = TotalPrice;
                DB.Entry(OrderData);
                DB.SaveChanges();

                return Json(new { TotalPrice=TotalPrice.Value.ToString("0.00"),TotalMH= TotalMH });


            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            return Json(0);
        }

        [HttpPost]
        public JsonResult DeleteOrderDetails(tblOrderDetail OrderDetail)
        {
            HttpCookie cookieObj = Request.Cookies["User"];
            int UserId = Int32.Parse(cookieObj["UserId"]);
            tblOrderDetail Data = new tblOrderDetail();
            List<tblOrderDetail> OrderDetailData = new List<tblOrderDetail>();
            tblSubCategory SubCategory = new tblSubCategory();

            try
            {
                double? TotalPrice = 0;
                string STotalPrice = "";
                double? TotalMH = 0;

                Data = DB.tblOrderDetails.Where(x => x.UniqueId == OrderDetail.UniqueId && x.OrderId == OrderDetail.OrderId).FirstOrDefault();
                DB.Entry(Data).State = EntityState.Deleted;
                DB.SaveChanges();

                tblLog LogData = new tblLog();
                LogData.UserId = UserId;
                LogData.Action = "Delete Order Details";
                LogData.CreatedDate = DateTime.Now;
                DB.tblLogs.Add(LogData);
                DB.SaveChanges();

                OrderDetailData = DB.tblOrderDetails.Where(x => x.OrderId == OrderDetail.OrderId).ToList();

                TotalPrice = OrderDetailData.Sum(S => S.Price);
                TotalMH = OrderDetailData.Sum(S => S.mh);

                tblOrder OrderData = DB.tblOrders.Where(x => x.OrderId == OrderDetail.OrderId).FirstOrDefault();
                OrderData.TotalPrice = TotalPrice;
                DB.Entry(OrderData);
                DB.SaveChanges();

                return Json(new { TotalPrice = TotalPrice.Value.ToString("0.00"), TotalMH = TotalMH });


            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            return Json(0);
        }

        [HttpPost]
        public JsonResult SprinklerCount(tblOrderDetail OrderDetail)
        {
            HttpCookie cookieObj = Request.Cookies["User"];
            int UserId = Int32.Parse(cookieObj["UserId"]);
            int Data = 0;

            try
            {
                Data = DB.tblOrderDetails.Where(x => x.SubCategoryID <17 &&x.OrderId==OrderDetail.OrderId).Count();
               

                return Json(Data);


            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            return Json(0);
        }

        [HttpPost]
        public JsonResult GetObjOrderDetails(tblOrderDetail OrderDetail)
        {
            HttpCookie cookieObj = Request.Cookies["User"];
            int UserId = Int32.Parse(cookieObj["UserId"]);
            

            try
            {
                DB.Configuration.ProxyCreationEnabled = false;
                if((OrderDetail.UniqueId[0]=='S'&& OrderDetail.UniqueId[1] == 'p')|| OrderDetail.UniqueId[0] == 'L')
                {
                    tblOrderDetail Data = new tblOrderDetail();
                    Data = DB.tblOrderDetails.Where(x => x.UniqueId == OrderDetail.UniqueId && x.OrderId == OrderDetail.OrderId).FirstOrDefault();
                    return Json(new { Data = Data,Ret=1, UniqueId = OrderDetail.UniqueId }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    tblSubCategory Data = new tblSubCategory();
                    int? SubCatId= DB.tblOrderDetails.Where(x => x.UniqueId == OrderDetail.UniqueId && x.OrderId == OrderDetail.OrderId).Select(s=>s.SubCategoryID).FirstOrDefault();
                    Data = DB.tblSubCategories.Where(x => x.SubcategoryID == SubCatId).FirstOrDefault();
                    return Json(new { Data = Data, Ret = 2, UniqueId = OrderDetail.UniqueId }, JsonRequestBehavior.AllowGet);
                }
               

                
            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            return Json(0);
        }

        public ActionResult Transactions(string Success, string Update, string Delete, string Error)
        {
            HttpCookie cookieObj = Request.Cookies["User"];
            int UserId = Int32.Parse(cookieObj["UserId"]);
            int RoleId = Int32.Parse(cookieObj["RoleId"]);
            List<tblTransaction> Transactions = null;
            if (RoleId != 2)
            {
                Transactions = DB.tblTransactions.ToList();
            }
            else
            {
                Transactions = DB.tblTransactions.Where(x => x.UserId == UserId).ToList();
            }


            ViewBag.Success = Success;
            ViewBag.Update = Update;
            ViewBag.Delete = Delete;
            ViewBag.Error = Error;
            return View(Transactions);
        }
        

    }
}