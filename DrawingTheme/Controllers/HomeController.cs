using DrawingTheme.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DrawingTheme.Controllers
{
    public class HomeController : Controller
    {
        AutomatischeEntities DB = new AutomatischeEntities();
        public ActionResult Index()
        {
            HttpCookie cookieObj = Request.Cookies["User"];
            int UserId = Int32.Parse(cookieObj["UserId"]);
            ViewBag.RoleId = Int32.Parse(cookieObj["RoleId"]);
            int RoleId = ViewBag.RoleId;
            if(RoleId==1)
            {
                ViewBag.TotalSuccessfull = DB.tblOrders.Where(x => x.Status == 2).ToList().Count();
                ViewBag.TotalPending = DB.tblOrders.Where(x => x.Status == 1 || x.Status == null).ToList().Count();
                ViewBag.TotalCustomer = DB.tblUsers.Where(x => x.RoleId == 2).ToList().Count();
                ViewBag.TotalComponent = DB.tblComponents.Where(x => x.isActive == true).ToList().Count();
                ViewBag.TotalSuccessfullAmount = DB.tblOrders.Where(x => x.Status == 2).Sum(s => s.TotalPrice);
                ViewBag.TotalPendingAmount = DB.tblOrders.Where(x => x.Status == 1).Sum(s => s.TotalPrice);
            }
            else
            {

                ViewBag.TotalSuccessfull = DB.tblOrders.Where(x => x.Status == 2 && x.CreatedBy == UserId).ToList().Count();
                ViewBag.TotalPending = DB.tblOrders.Where(x => (x.Status == 1 || x.Status == null) && x.CreatedBy == UserId).ToList().Count();
                ViewBag.TotalCustomer = DB.tblUsers.Where(x => x.RoleId == 2).ToList().Count();
                ViewBag.TotalComponent = DB.tblComponents.Where(x => x.isActive == true).ToList().Count();
                ViewBag.TotalSuccessfullAmount = DB.tblOrders.Where(x => x.Status == 2 && x.CreatedBy == UserId).Sum(s => s.TotalPrice);
                ViewBag.TotalPendingAmount = DB.tblOrders.Where(x => (x.Status == 1 || x.Status == null) && x.CreatedBy == UserId).Sum(s => s.TotalPrice);

                
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