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
    public class SubCategoryController : Controller
    {
        AutomatischeEntities DB = new AutomatischeEntities();
        public ActionResult Index(string Success, string Update, string Delete, string Error)
        {
            List<tblSubCategory> subcategoryList = DB.tblSubCategories.ToList();

            ViewBag.Success = Success;
            ViewBag.Update = Update;
            ViewBag.Delete = Delete;
            ViewBag.Error = Error;
            return View(subcategoryList);
        }
       
        public ActionResult AddSubCategory(int id=0)
        {
           
            try
            {
                tblSubCategory tblSubCategory = new tblSubCategory();
                if(id != 0 )
                {
                    tblSubCategory = DB.tblSubCategories.Find(id);
                }

                return View(tblSubCategory);
            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult AddSubCategory(tblCategory category)
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
                        return RedirectToAction("Index", new { Success = "Sub category has been add successfully." });
                    }
                    else
                    {

                        Data = DB.tblCategories.Select(r => r).Where(x => x.CategoryID == category.CategoryID).FirstOrDefault();
                        Data.CategoryID = category.CategoryID;
                        Data.CategoryName = category.CategoryName;
                        DB.Entry(Data);
                        DB.SaveChanges();
                        return RedirectToAction("Index", new { Update = "Sub category has been updated successfully." });
                    }
                }
                else
                {
                    return RedirectToAction("Index", new { Delete = "Sub category already exsist!!!" });

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
        public ActionResult DeleteSubCategory(int SubcategoryID)
        {
            tblSubCategory Data = new tblSubCategory();
            try
            {
                Data = DB.tblSubCategories.Select(r => r).Where(x => x.SubcategoryID == SubcategoryID).FirstOrDefault();
                DB.Entry(Data).State = EntityState.Deleted;
                DB.SaveChanges();
                return RedirectToAction("Index", new { Delete = "Sub category has been deleted successfully." });
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