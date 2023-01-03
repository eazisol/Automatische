﻿using DrawingTheme.Helper;
using DrawingTheme.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace DrawingTheme.Controllers
{
    public class AccountController : BaseController
    {
        AutomatischeEntities DB = new AutomatischeEntities();
        public ActionResult SetCulture(string culture)
        {
            Session["lan"] = culture;
            if (Request.Cookies["_culture"] != null)
            {
                Response.Cookies["_culture"].Expires = DateTime.Now.AddDays(-1);
            }
            // Validate input
            culture = CultureHelper.GetImplementedCulture(culture);
            // Save culture in a cookie
            HttpCookie cookie = Request.Cookies["_culture"];
            if (cookie != null)
                cookie["Language"] = culture;   // update cookie value
            else
            {
                cookie = new HttpCookie("_culture");
                cookie["Language"] = culture;
                cookie.Expires = DateTime.Now.AddDays(2);
            }
            Response.Cookies.Add(cookie);
           
            return RedirectToAction("Login");
        }
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login()
        {
            FormsAuthentication.SignOut();
            return View();
        }

        [HttpPost]
        public ActionResult Login(string Email, string Password)
        {
            string pass = null;
            tblLog LogData = new tblLog();
            try
            {
                if (Password != null)
                {
                    byte[] EncDataBtye = new byte[Password.Length];
                    EncDataBtye = System.Text.Encoding.UTF8.GetBytes(Password);
                    pass = Convert.ToBase64String(EncDataBtye);
                }
                var User = DB.tblUsers.Select(r => r).Where(x => x.Email == Email && x.Password == pass && x.isActive == true).FirstOrDefault();
                if (User != null)
                {


                    //Session["User"] = DB.tblUsers.Select(r => r).Where(x => x.Email == Email).FirstOrDefault();
                    Session["Access"] = DB.tblAccessLevels.Select(r => r).Where(x => x.RoleId == User.RoleId && x.isActive == true).OrderBy(x=>x.tblMenu.EditBy).ToList();
                    //Session["Settings"] = DB.tblSettings.Select(r => r).FirstOrDefault();
                    HttpCookie cookie = new HttpCookie("User");

                    cookie["Email"] = User.Email;
                    cookie["UserId"] = User.UserId.ToString();
                    cookie["RoleId"] = User.RoleId.ToString();
                    cookie["Role"] = User.tblRole.Role;

                    cookie["OrderId"] = User.RoleId.ToString();

                    cookie["FirstName"] = User.FirstName;

                    cookie.Expires = DateTime.Now.AddMonths(1);
                    Response.Cookies.Add(cookie);


                    FormsAuthentication.SetAuthCookie(Email, false);

                    User.LastLogin = DateTime.Now;
                    DB.Entry(User);
                    DB.SaveChanges();

                    LogData.UserId = User.UserId;
                    LogData.Action = "Login";
                    LogData.CreatedDate = DateTime.Now;
                    DB.tblLogs.Add(LogData);
                    DB.SaveChanges();


                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    var UserCheck = DB.tblUsers.Select(r => r).Where(x => x.Email == Email && x.Password == pass).FirstOrDefault();
                    if (UserCheck != null && (UserCheck.isActive == false || UserCheck.isActive==null))
                    {
                        ViewBag.Error = "Your account is in-active";
                    }
                    else
                    {
                        ViewBag.Error = "Invalid email or password";
                    }

                    return View();
                }
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            return RedirectToAction("Index", "Home");
        }


        public ActionResult ForgetPassword()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CheckEmail(string Email)
        {

            DB.Configuration.ProxyCreationEnabled = false;
            try
            {
                if (DB.tblUsers.Select(r => r).Where(x => x.Email == Email).FirstOrDefault() == null)
                {
                    return Json(0);
                }
                else
                {
                    return Json(1);
                }
            }
            catch (Exception ex)
            {

                ViewBag.ex = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            return Json(0);
        }
        [HttpPost]
        public ActionResult ForgetPassword(string Email)
        {
            try
            {
                if (DB.tblUsers.Where(x => x.Email == Email).FirstOrDefault() != null)
                {


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
                    body1 += "<br />To Change your password, please click on the button below: ";
                    body1 += "<br /> <button style='padding: 10px 28px 11px 28px;color: #fff;background:#333333;'><a style='color:white !important' href = '" + link + "?Email=" + encrypted + "&&Expire=" + encryptedTime + "'>Change Account Password</a></button>";
                    body1 += "<br /><br />Yours,<br />The Automatische Team";

                    string body = "";
                    body += "<body  style='background-color:white !important'>";
                    body += " <div>";
                    //body += "<h3>Hello " + sa.ReceiveName + ",</h3>";
                    body += " <table style='background-color: #f2f3f8; max-width:670px;' width='100%' border='0'  cellpadding='0' cellspacing='0'>";
                    body += " <tbody> <tr style='background-color:#333333;'><td style='padding: 0 35px; background-color:#333333;text-align: center;'><a><img src='https://ci6.googleusercontent.com/proxy/Ia8xyYsLq6FtQcWzOyAOvF7XpZC5N9JGdMFlTO2LwH6Q_PSpKXU2LVHg6bmHoSGjTN1EKugOuHt6dFMCU82XXyTadS1p1EfV7a70vjNPbIkMB7z9H6h_9hgZNRA9bAJNWW-fi4jazw=s0-d-e1-ft#https://automatische-gartenberegnung.de/wp-content/uploads/2020/05/logo-1_200x50.png' style='padding-top: 1%;' alt='Alternate Text' />  </a></td> </tr>";
                    body += "<tr style='color:#455056; font-size:15px;line-height:35px;text-align: center;'><td style='padding:6px;text-align: center;'></td></tr><tr style='color:#455056; font-size:15px;line-height:35px;text-align: center;'><td style='padding:6px;text-align: center;'>" + body1 + "</td></tr>";
                    body += "  </tbody></table>";
                    body += "</body>";


                    MailMessage mailMessage = new MailMessage(SenderEmail, Email, "Forget Password Email", body);
                    mailMessage.IsBodyHtml = true;
                    mailMessage.BodyEncoding = System.Text.UTF8Encoding.UTF8;

                    Client.Send(mailMessage);

                    //mailMessage = new MailMessage(SenderEmail, Email, "Thank You Email", "Thank You for Contacting Us!!!");
                    //mailMessage.IsBodyHtml = true;
                    //mailMessage.BodyEncoding = System.Text.UTF8Encoding.UTF8;

                    //Client.Send(mailMessage);

                    ViewBag.Success = "Email has been sent successfully.";
                    return View();
                }
                else
                {
                    ViewBag.Error = "User not register";
                    return View();
                }

            }
            catch (Exception ex)
            {
                throw ex;
                // View();
            }
        }

        public ActionResult ChangeForgetPassword(string Email)
        {
            try
            {
                byte[] b = Convert.FromBase64String(Email);
                string decrypted = System.Text.ASCIIEncoding.ASCII.GetString(b);

                ViewBag.Email = decrypted;
            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }
            return View();
        }


        [HttpPost]
        public ActionResult ChangeForgetPassword(string NewPassword, string ConfirmPassword, string Email)
        {
            string pass = null;
            try
            {


                byte[] EncDataBtye = null;
                tblUser Data = new tblUser();
                Data = DB.tblUsers.Select(r => r).Where(x => x.Email == Email).FirstOrDefault();
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
                        ViewBag.PError = "New Password and Confirm Password are not matched!!!";
                        return View();
                    }

                    Data.Password = pass;
                    Data.EditDate = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));
                    DB.Entry(Data);
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
                    body1 += "<br />Your password successfully changed";
                    body1 += "<br /><br />Yours,<br />The Automatische Team";

                    string body = "";
                    body += "<body  style='background-color:white !important'>";
                    body += " <div>";
                    //body += "<h3>Hello " + sa.ReceiveName + ",</h3>";
                    body += " <table style='background-color: #f2f3f8; max-width:670px;' width='100%' border='0'  cellpadding='0' cellspacing='0'>";
                    body += " <tbody> <tr style='background-color: #333333;'><td style='padding: 0 35px; background-color:#333333;text-align: center;'><a><img src='https://ci6.googleusercontent.com/proxy/Ia8xyYsLq6FtQcWzOyAOvF7XpZC5N9JGdMFlTO2LwH6Q_PSpKXU2LVHg6bmHoSGjTN1EKugOuHt6dFMCU82XXyTadS1p1EfV7a70vjNPbIkMB7z9H6h_9hgZNRA9bAJNWW-fi4jazw=s0-d-e1-ft#https://automatische-gartenberegnung.de/wp-content/uploads/2020/05/logo-1_200x50.png' style='padding-top: 1%;' alt='Alternate Text' />  </a></td> </tr>";
                    body += "<tr style='color:#455056; font-size:15px;line-height:35px;text-align: center;'><td style='padding:6px;text-align: center;'></td></tr><tr style='color:#455056; font-size:15px;line-height:35px;text-align: center;'><td style='padding:6px;text-align: center;'>" + body1 + "</td></tr>";
                    body += "  </tbody></table>";
                    body += "</body>";


                    MailMessage mailMessage = new MailMessage(SenderEmail, Email, "Password alert", body);
                    mailMessage.IsBodyHtml = true;
                    mailMessage.BodyEncoding = System.Text.UTF8Encoding.UTF8;

                    Client.Send(mailMessage);


                    return RedirectToAction("Login", "Account");
                }
                else
                {
                    ViewBag.Error = "Email is not correct.";
                    return View();
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
        public ActionResult Register(tblUser User)
        {
            tblUser Data = new tblUser();
            try
            {
                if (DB.tblUsers.Select(r => r).Where(x => x.Email == User.Email).FirstOrDefault() == null)
                {
                    Data = User;
                    Data.FirstName = User.username;
                    Data.RoleId = 2;
                    byte[] EncDataBtye = new byte[User.Password.Length];
                    EncDataBtye = System.Text.Encoding.UTF8.GetBytes(User.Password);
                    Data.Password = Convert.ToBase64String(EncDataBtye);

                    Data.CreatedDate = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));
                    Data.EditDate = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));
                    Data.isActive = true;
                    DB.tblUsers.Add(Data);
                    DB.SaveChanges();


                    return RedirectToAction("Login", new { Success = "User has been added successfully." });
                }
                else
                {
                    //ViewBag.Error = "User Already Exsist!!!";
                    return RedirectToAction("Login", new { Error = "User already exsist." });
                }
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            
            return View();
        }




        //public ActionResult Forgetpassword()
        //{
        //    return View();
        //}

        public ActionResult Resetpassword()
        {
            return View();
        }
    }
}