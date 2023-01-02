using DrawingTheme.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DrawingTheme.Controllers
{
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
                ViewBag.Category = DB.tblCategories.ToList();
                if (id != 0 )
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
        public ActionResult AddSubCategory(tblSubCategory SubCategory)
        {
            tblSubCategory Data = new tblSubCategory();
            try
            {
                HttpCookie cookieObj = Request.Cookies["User"];
                int UserId = Int32.Parse(cookieObj["UserId"]);
                int RoleId = Int32.Parse(cookieObj["RoleId"]);
                //int UserId = 1;
                
                    if (SubCategory.SubcategoryID == 0)
                    {
                        if (DB.tblSubCategories.Select(r => r).Where(x => x.SubcategoryName == SubCategory.SubcategoryName).FirstOrDefault() == null)
                        {
                            Data = SubCategory;
                            DB.tblSubCategories.Add(Data);
                            DB.SaveChanges();
                            return RedirectToAction("Index", new { Success = "Sub Category has been add successfully." });
                        }
                        else
                        {
                            return RedirectToAction("Index", new { Delete = "Sub Category Already Exsist!!!" });

                        }
                    }
                    else
                    {

                    var Check = DB.tblSubCategories.Select(r => r).Where(x => x.SubcategoryName == SubCategory.SubcategoryName).FirstOrDefault();
                        if (Check == null|| Check.SubcategoryID== SubCategory.SubcategoryID )
                        {
                            Data = DB.tblSubCategories.Select(r => r).Where(x => x.SubcategoryID == SubCategory.SubcategoryID).FirstOrDefault();
                            Data.SubcategoryID = SubCategory.SubcategoryID;
                            Data.CategoryID = SubCategory.CategoryID;
                            Data.SubcategoryName = SubCategory.SubcategoryName;
                            Data.ComponentPiktogramm = SubCategory.ComponentPiktogramm;
                            Data.Unit = SubCategory.Unit;
                            Data.Price = SubCategory.Price;
                            Data.SprinklerType = SubCategory.SprinklerType;
                            Data.MinAngle = SubCategory.MinAngle;
                            Data.MaxAngle = SubCategory.MaxAngle;
                            Data.ThrowDistanceMax = SubCategory.ThrowDistanceMax;
                            Data.ThrowDistanceMin = SubCategory.ThrowDistanceMin;
                            Data.ThrowWidth = SubCategory.ThrowWidth;
                            Data.ThrowHeight = SubCategory.ThrowHeight;
                            Data.mhgeneral = SubCategory.mhgeneral;
                            Data.PipelineMaxLength = SubCategory.PipelineMaxLength;
                            Data.IrrigationWiringMaxStation = SubCategory.IrrigationWiringMaxStation;
                            Data.IrrigationComputermaxstation = SubCategory.IrrigationComputermaxstation;
                            Data.IrrigationComputerindoor = SubCategory.IrrigationComputerindoor;
                            Data.IrrigationComputeroutdoor = SubCategory.IrrigationComputeroutdoor;
                            Data.IrrigationComputersmarphone = SubCategory.IrrigationComputersmarphone;
                            Data.valveboxcircle = SubCategory.valveboxcircle;
                            Data.valveboxFilter = SubCategory.valveboxFilter;
                            Data.drinkingwatersource = SubCategory.drinkingwatersource;
                            Data.wellwatersource = SubCategory.wellwatersource;
                            Data.rainwatersource = SubCategory.rainwatersource;
                            Data.mh45 = SubCategory.mh45;
                            Data.mh90 = SubCategory.mh90;
                            Data.mh105 = SubCategory.mh105;
                            Data.mh180 = SubCategory.mh180;
                            Data.mh210 = SubCategory.mh210;
                            Data.mh270 = SubCategory.mh270;
                            Data.mh360 = SubCategory.mh360;
                            Data.Plannercomponent = SubCategory.Plannercomponent;
                            Data.BOMRelevant = SubCategory.BOMRelevant;
                            DB.Entry(Data) ;
                            DB.SaveChanges();
                            return RedirectToAction("Index", new { Update = "Sub Category has been Update successfully." });
                        }
                        else
                        {
                            return RedirectToAction("Index", new { Delete = "Sub Category Already Exsist!!!" });

                        }
                   
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
                return RedirectToAction("Index", new { Delete = "Sub Category has been delete successfully." });
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