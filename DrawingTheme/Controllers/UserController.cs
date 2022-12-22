using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DrawingTheme.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult Profile()
        {
            return View();
        }

        public ActionResult UserList()
        {
            return View();
        }

        public ActionResult Roles()
        {
            return View();
        }
    }
}