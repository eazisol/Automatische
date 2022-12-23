using DrawingTheme.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DrawingTheme.Controllers
{
    public class ComponentController : Controller
    {
        AutomatischeEntities DB = new AutomatischeEntities();
        // GET: Component
        public ActionResult Components(string Success, string Update, string Delete, string Error)
        {
            List<tblComponent> ComponentList = DB.tblComponents.Where(x => x.isActive == true).ToList();

            ViewBag.Success = Success;
            ViewBag.Update = Update;
            ViewBag.Delete = Delete;
            ViewBag.Error = Error;
            return View(ComponentList);
        }
    }
}