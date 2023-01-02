using DrawingTheme.Helper;
using DrawingTheme.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DrawingTheme.Controllers
{
    public class HomeController : BaseController
    {
        AutomatischeEntities DB = new AutomatischeEntities();

        public ActionResult SetCulture(string culture)
        {
            
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

            return RedirectToAction("Index");
        }
        public ActionResult Index()
        {
            HttpCookie cookieObj = Request.Cookies["User"];
            int UserId = Int32.Parse(cookieObj["UserId"]);
            ViewBag.RoleId = Int32.Parse(cookieObj["RoleId"]);
            int RoleId = ViewBag.RoleId;
            if(RoleId != 2)
            {
                ViewBag.TotalSuccessfull = DB.tblOrders.Where(x => x.Status == 1).ToList().Count();
                ViewBag.TotalPending = DB.tblOrders.Where(x => x.Status == 0  || x.Status == null).ToList().Count();
                ViewBag.TotalCustomer = DB.tblUsers.Where(x => x.RoleId == 2).ToList().Count();
                ViewBag.TotalComponent = DB.tblComponents.Where(x => x.isActive == true).ToList().Count();
                ViewBag.TotalSuccessfullAmount = DB.tblOrders.Where(x => x.Status == 1).Sum(s => s.TotalPrice) ?? 0;
                ViewBag.TotalPendingAmount = DB.tblOrders.Where(x => x.Status == 1 || x.Status == null).Sum(s => s.TotalPrice) ?? 0;
            }
            else
            {

                ViewBag.TotalSuccessfull = DB.tblOrders.Where(x => x.Status == 1 && x.CreatedBy == UserId).ToList().Count();
                ViewBag.TotalPending = DB.tblOrders.Where(x => (x.Status == 0 || x.Status == null) && x.CreatedBy == UserId).ToList().Count();
                ViewBag.TotalCustomer = DB.tblUsers.Where(x => x.RoleId == 2).ToList().Count();
                ViewBag.TotalComponent = DB.tblComponents.Where(x => x.isActive == true).ToList().Count();
                ViewBag.TotalSuccessfullAmount = DB.tblOrders.Where(x => x.Status == 1 && x.CreatedBy == UserId).Sum(s => s.TotalPrice) ?? 0;
                ViewBag.TotalPendingAmount = DB.tblOrders.Where(x => (x.Status == 0 || x.Status == null) && x.CreatedBy == UserId).Sum(s => s.TotalPrice) ?? 0;

                
            }
            
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}