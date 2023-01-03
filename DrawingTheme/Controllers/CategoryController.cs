using DrawingTheme.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DrawingTheme.Controllers
{
    [FilterConfig.NoDirectAccess]
    [FilterConfig.AuthorizeActionFilter]
    public class CategoryController : Controller
    {
        AutomatischeEntities DB = new AutomatischeEntities();
        public ActionResult Index(string Success, string Update, string Delete, string Error)
        {
            List<tblCategory> CategoryList = DB.tblCategories.ToList();

            ViewBag.Success = Success;
            ViewBag.Update = Update;
            ViewBag.Delete = Delete;
            ViewBag.Error = Error;
            return View(CategoryList);
        }
        [HttpPost]
        public ActionResult AddCategory(tblCategory category)
        {
            tblCategory Data = new tblCategory();
            try
            {
                HttpCookie cookieObj = Request.Cookies["User"];
                int UserId = Int32.Parse(cookieObj["UserId"]);
                int RoleId = Int32.Parse(cookieObj["RoleId"]);
                //int UserId = 1;
                if (DB.tblCategories.Select(r => r).Where(x => x.CategoryName == category.CategoryName).FirstOrDefault() == null)
                {
                    if (category.CategoryID == 0)
                    {

                        Data = category;
                        DB.tblCategories.Add(Data);
                        DB.SaveChanges();
                        return RedirectToAction("Index", new { Success = "Category has been add successfully." });
                    }
                    else
                    {

                        Data = DB.tblCategories.Select(r => r).Where(x => x.CategoryID == category.CategoryID).FirstOrDefault();
                        Data.CategoryID = category.CategoryID;
                        Data.CategoryName = category.CategoryName;
                        DB.Entry(Data);
                        DB.SaveChanges();
                        return RedirectToAction("Index", new { Update = "Category has been Update successfully." });
                    } 
                }
                else
                {
                    return RedirectToAction("Index", new { Delete = "Category Already Exsist!!!" });
                 
                }
            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult DeleteCategory(int CategoryID)
        {
            tblCategory Data = new tblCategory();
            try
            {
                Data = DB.tblCategories.Select(r => r).Where(x => x.CategoryID == CategoryID).FirstOrDefault();
                DB.Entry(Data).State = EntityState.Deleted;
                DB.SaveChanges();
                return RedirectToAction("Index", new { Delete = "Category has been delete successfully." });
            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            return Json(0);
        }

    }
}