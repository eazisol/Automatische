using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DrawingTheme.Controllers
{
    public class TransactionsController : BaseController
    {
        // GET: Transactions
        public ActionResult Index()
        {
            return View();
        }
    }
}