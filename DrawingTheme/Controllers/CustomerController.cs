﻿using DrawingTheme.Models;
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
                    Orders = DB.tblOrders.ToList();
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
                    Orders = DB.tblOrders.Where(x => x.CreatedBy == UserId).ToList();
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
            HttpCookie cookieObj = Request.Cookies["User"];
            int CUserId = Int32.Parse(cookieObj["UserId"]);
            //int CUserId = 1;
            try
            {
                Data = DB.tblOrders.Select(r => r).Where(x => x.OrderId == OrderId).FirstOrDefault();
                DB.Entry(Data).State = EntityState.Deleted;
                DB.SaveChanges();

                tblLog LogData = new tblLog();
                LogData.UserId = CUserId;
                LogData.Action = "Delete Order";
                LogData.CreatedDate = DateTime.Now;
                DB.tblLogs.Add(LogData);
                DB.SaveChanges();
                return RedirectToAction("Orders", new { Delete = "Order has been delete successfully." });
            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            return Json(0);
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
                        return Json(Data.OrderId);

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

                SubCategory = DB.tblSubCategories.Where(x => x.SubcategoryID == OrderDetail.SubCategoryID).FirstOrDefault();
                if (SubCategory != null)
                {

                    check = DB.tblOrderDetails.Where(x => x.UniqueId == OrderDetail.UniqueId && x.OrderId == OrderDetail.OrderId).FirstOrDefault();
                    if(check==null)
                    {
                        Data = OrderDetail;
                        Data.SubcategoryName = SubCategory.SubcategoryName;
                        Data.Price = SubCategory.Price;
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
                        Data.Price = SubCategory.Price;
                        Data.IWLength = OrderDetail.IWLength;
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

                return Json(TotalPrice);


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

                return Json(TotalPrice);


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