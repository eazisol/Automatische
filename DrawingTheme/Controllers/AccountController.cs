using DrawingTheme.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace DrawingTheme.Controllers
{
    public class AccountController : Controller
    {
        AutomatischeEntities DB = new AutomatischeEntities();
        // GET: Account
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
                var User = DB.tblUsers.Select(r => r).Where(x => x.Email == Email && x.Password == pass && x.isActive != false).FirstOrDefault();
                if (User != null)
                {


                    //Session["User"] = DB.tblUsers.Select(r => r).Where(x => x.Email == Email).FirstOrDefault();
                    Session["Access"] = DB.tblAccessLevels.Select(r => r).Where(x => x.RoleId == User.RoleId && x.isActive == true).ToList();
                    //Session["Settings"] = DB.tblSettings.Select(r => r).FirstOrDefault();
                    HttpCookie cookie = new HttpCookie("User");

                    cookie["Email"] = User.Email;
                    cookie["UserId"] = User.UserId.ToString();
                    cookie["Role"] = User.tblRole.Role;
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
                    if (UserCheck != null && UserCheck.isActive == false)
                    {
                        ViewBag.Error = "User is in-active";
                    }
                    else
                    {
                        ViewBag.Error = "Invalid Email or Password";
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

        public ActionResult Register()
        {
            return View();
        }
        public ActionResult Forgetpassword()
        {
            return View();
        }

        public ActionResult Resetpassword()
        {
            return View();
        }
    }
}