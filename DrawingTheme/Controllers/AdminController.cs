using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DrawingTheme.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Setting()
        {
            return View();
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
            return View();
        }
    }
}