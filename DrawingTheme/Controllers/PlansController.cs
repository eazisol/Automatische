using DrawingTheme.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DrawingTheme.Controllers
{
    [FilterConfig.AuthorizeActionFilter]
    public class PlansController : Controller
    {
        AutomatischeEntities DB = new AutomatischeEntities();
        public ActionResult Index(string Success, string Update, string Delete, string Error, string status)
        {
            HttpCookie cookieObj = Request.Cookies["User"];
            int UserId = Int32.Parse(cookieObj["UserId"]);
            int RoleId = Int32.Parse(cookieObj["RoleId"]);
            List<tblOrder> Orders = null;
            if (RoleId != 2)
            {
                if (status == "" || status == null)
                {
                    Orders = DB.tblOrders.ToList();
                }
                if (status == "Pending")
                {
                    Orders = DB.tblOrders.Where(x => x.Status == 0 || x.Status == null).ToList();
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
    }
}