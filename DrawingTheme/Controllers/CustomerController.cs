using DrawingTheme.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;

namespace DrawingTheme.Controllers
{
    public class CustomerController : Controller
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


                    return RedirectToAction("Profile","User",new {id= Data.UserId , Success = "Password has been change successfully!!!" });
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

        public ActionResult Orders(string Success, string Update, string Delete, string Error)
        {
            List<tblOrder> Orders = DB.tblOrders.ToList();

            ViewBag.Success = Success;
            ViewBag.Update = Update;
            ViewBag.Delete = Delete;
            ViewBag.Error = Error;
            return View(Orders);
        }



    }
}