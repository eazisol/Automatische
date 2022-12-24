using DrawingTheme.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
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



        [HttpPost]
        public ActionResult AddComponent(tblComponent Component, HttpPostedFileBase Image)
        {
            tblComponent Data = new tblComponent();
            try
            {
                HttpCookie cookieObj = Request.Cookies["User"];
                int UserId = Int32.Parse(cookieObj["UserId"]);
                int RoleId = Int32.Parse(cookieObj["RoleId"]);
                //int UserId = 1;
                if (Component.ComponentId == 0)
                {
                    if (DB.tblComponents.Select(r => r).Where(x => x.Code == Component.Code).FirstOrDefault() == null)
                    {
                        Data = Component;
                        
                        
                        Data.CreatedDate = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));
                        Data.CreatedBy = UserId;
                        Data.EditDate = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));
                        Data.EditBy = UserId;
                        DB.tblComponents.Add(Data);
                        DB.SaveChanges();




                        tblLog LogData = new tblLog();
                        LogData.UserId = UserId;
                        LogData.Action = "Add Component";
                        LogData.CreatedDate = DateTime.Now;
                        DB.tblLogs.Add(LogData);
                        DB.SaveChanges();
                        
                            return RedirectToAction("Components", new { Success = "Component has been add successfully." });

                        //return RedirectToAction("UserList", new { Success = "User has been add successfully." });
                    }
                    else
                    {
                        
                            return RedirectToAction("Components", new { Success = "Component Already Exsist!!!" });
                        //return RedirectToAction("UserList", new { Error = "User Already Exsist!!!" });
                    }
                }
                else
                {
                    var check = DB.tblComponents.Select(r => r).Where(x => x.Code == Component.Code).FirstOrDefault();
                    if (check == null || check.ComponentId == Component.ComponentId)
                    {
                        Data = DB.tblComponents.Select(r => r).Where(x => x.ComponentId == Component.ComponentId).FirstOrDefault();
                        //Data.username = User.username;

                        Data.ComponentId = Component.ComponentId;
                        Data.Code = Component.Code;
                        Data.Name = Component.Name;
                        Data.Price = Component.Price;
                        Data.EditDate = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));
                        Data.EditBy = UserId;
                        Data.isActive = Component.isActive;
                        Data.EditDate = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));
                        Data.EditBy = UserId;
                        DB.Entry(Data);
                        DB.SaveChanges();

                        tblLog LogData = new tblLog();
                        LogData.UserId = UserId;
                        LogData.Action = "Update Component";
                        LogData.CreatedDate = DateTime.Now;
                        DB.tblLogs.Add(LogData);
                        DB.SaveChanges();

                        
                            return RedirectToAction("Components", new { Update = "Component has been Update successfully." });

                        //return RedirectToAction("UserList", new { Update = "User has been Update successfully." });
                    }
                    else
                    {
                       
                            return RedirectToAction("Components", new { Delete = "Component Already Exsist!!!" });
                        //return RedirectToAction("UserList", new { Error = "User Already Exsist!!!" });
                    }

                }


            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            return RedirectToAction("Components");
        }


        [HttpPost]
        public ActionResult DeleteComponent(int ComponentId)
        {
            tblComponent Data = new tblComponent();
            HttpCookie cookieObj = Request.Cookies["User"];
            int CUserId = Int32.Parse(cookieObj["UserId"]);
            //int CUserId = 1;
            try
            {
                Data = DB.tblComponents.Select(r => r).Where(x => x.ComponentId == ComponentId).FirstOrDefault();
                DB.Entry(Data).State = EntityState.Deleted;
                DB.SaveChanges();

                tblLog LogData = new tblLog();
                LogData.UserId = CUserId;
                LogData.Action = "Delete Component";
                LogData.CreatedDate = DateTime.Now;
                DB.tblLogs.Add(LogData);
                DB.SaveChanges();
                    return RedirectToAction("Components", new { Delete = "Component has been delete successfully." });
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