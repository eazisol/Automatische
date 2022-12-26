using DrawingTheme.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DrawingTheme.Controllers
{
    [FilterConfig.NoDirectAccess]
    [FilterConfig.AuthorizeActionFilter]
    public class AdminController : Controller
    {
        AutomatischeEntities DB = new AutomatischeEntities();
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Setting(int? isSuccess)
        {
            
            var Data = DB.tblSettings.FirstOrDefault();
            if (isSuccess == 1)
            {
                ViewBag.Error = "Record Successfully Updated!!!";
            }

            return View(Data);
        }

        [HttpPost]
        public ActionResult CreateSetting(tblSetting Setting)
        {
            tblSetting Data = new tblSetting();
            try
            {
                //if (Setting.isActive == null)
                //{
                //    Setting.isActive = false;
                //}
                //Foreign = DB.tblRoles.Where(x => x.RoleId == Setting.RoleId).FirstOrDefault();
                //Data.tblRole = Foreign;
                Data = DB.tblSettings.Select(r => r).Where(x => x.SettingId == Setting.SettingId).FirstOrDefault();
                Data.SettingId = Setting.SettingId;
                Data.SecretKey = Setting.SecretKey;
                Data.Email = Setting.Email;
                Data.Password = Setting.Password;
                Data.ClientID = Setting.ClientID;
                Data.Port = Setting.Port;
                Data.SMTP = Setting.SMTP;
                Data.Mode = Setting.Mode;
                Data.Editby = Setting.Editby;
                Data.EditDate = Setting.EditDate;
                Data.isActive = Setting.isActive;
               
                DB.Entry(Data);
                DB.SaveChanges();

                //HttpCookie cookie = new HttpCookie("Settings");

                //cookie["DateFormat"] = DB.tblSettings.Select(r => r.DateFormat).FirstOrDefault();
                //cookie["ReportsDateFormat"] = DB.tblSettings.Select(r => r.ReportsDateFormat).FirstOrDefault();
                //cookie["WSA"] = DB.tblSettings.Select(r => r.NextWSA).FirstOrDefault();
                //cookie["Retrieves"] = DB.tblSettings.Select(r => r.NumberOfRetrieves).FirstOrDefault();
                //cookie["FontStyle"] = DB.tblSettings.Select(r => r.FontStyle).FirstOrDefault();
                //cookie["FontSize"] = DB.tblSettings.Select(r => r.FontSize).FirstOrDefault();
                //// This cookie will remain  for one month.
                //cookie.Expires = DateTime.Now.AddMonths(1);

                //// Add it to the current web response.
                //Response.Cookies.Add(cookie);

            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            return RedirectToAction("Setting", new { isSuccess = 1 });
        }


        public ActionResult Transaction()
        {
            return View();
        }

        public ActionResult Packages()
        {
            return View();
        }

        public ActionResult DrawShape()
        {
            List<tblComponent> Data = new List<tblComponent>();
            try
            {
                
                Data = DB.tblComponents.Select(r => r).Where(x => x.isActive == true).ToList();
                

            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }



            return View(Data);
        }
    }
}