using DrawingTheme.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DrawingTheme.Controllers
{
    [FilterConfig.NoDirectAccess]
    [FilterConfig.AuthorizeActionFilter]
    public class AdminController : BaseController
    {
        
        AutomatischeEntities DB = new AutomatischeEntities();
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Setting(int? isSuccess)
        {
            
            var Data = DB.tblSettings.FirstOrDefault();
            if (isSuccess == 1)
            {
                ViewBag.Error = "Record Successfully Updated!!!";
            }

            return View(Data);
        }

        [HttpPost]
        public ActionResult SavePdf(string pdfFile,int OrderID=0)
        {
            string Data = null;
            try
            {
                //pdfFile = "data:image/(png|jpeg|jpg);base64," + pdfFile;
                byte[] bytes = Convert.FromBase64String(pdfFile);

                Image image;
                using (MemoryStream ms = new MemoryStream(bytes))
                {
                    image = Image.FromStream(ms);
                }
                //HttpPostedFileBase file ;
                //var OrderID = Request.QueryString["pdfData"];   
                //var file1 = Request.Files;
                string folder = Server.MapPath(string.Format("~/{0}/", "Uploading"));
                if (!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                }

                //string path = Path.Combine(Server.MapPath("~/Uploading"), Path.GetFileName(OrderID));
                string path = Path.Combine(Server.MapPath("~/Uploading"), OrderID+".png");
                string DBpath = Path.Combine("/Uploading", OrderID+".png");
                //string path = Path.Combine(Server.MapPath("~/Uploading"));
                    image.Save(path);

                tblOrder OrderData= DB.tblOrders.Where(x => x.OrderId == OrderID).FirstOrDefault();
                OrderData.ImgPath = DBpath;
                OrderData.isProceed = true;
                DB.Entry(OrderData);
                DB.SaveChanges();

                //file.SaveAs(path);
                //path = Path.Combine("\\Uploading", Path.GetFileName(file.FileName));
                //Data = file.FileName;

            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }



            return Json(Data);
        }


        [HttpPost]
        public JsonResult UploadDesignImg(HttpPostedFileBase file)
        {
            string Data = null;
            try
            {
                var file1 = Request.Files[0];
                string folder = Server.MapPath(string.Format("~/{0}/", "Uploading"));
                if (!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                }

                string path = Path.Combine(Server.MapPath("~/Uploading"), Path.GetFileName(file.FileName));

                file.SaveAs(path);
                path = Path.Combine("\\Uploading", Path.GetFileName(file.FileName));
                Data = file.FileName;

            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }



            return Json(Data);
        }
        [HttpPost]
        public ActionResult CreateSetting(tblSetting Setting)
        {
            tblSetting Data = new tblSetting();
            try
            {
                
                Data = DB.tblSettings.Select(r => r).Where(x => x.SettingId == Setting.SettingId).FirstOrDefault();
                Data.SettingId = Setting.SettingId;
                Data.SecretKey = Setting.SecretKey;
                Data.Email = Setting.Email;
                Data.Password = Setting.Password;
                Data.ClientID = Setting.ClientID;
                Data.Port = Setting.Port;
                Data.SMTP = Setting.SMTP;
                Data.Mode = Setting.Mode;
                Data.Editby = Setting.Editby;
                Data.EditDate = Setting.EditDate;
                Data.isActive = Setting.isActive;
                Data.IsAdminReceived = Setting.IsAdminReceived;
                DB.Entry(Data);
                DB.SaveChanges();

         

            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            return RedirectToAction("Setting", new { isSuccess = 1 });
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
            List<tblComponent> Data = new List<tblComponent>();
            try
            {
                ViewBag.Category = DB.tblCategories.Where(x=>x.IsPlanner==true).ToList();
                ViewBag.SubCategory = DB.tblSubCategories.Where(x=>x.Plannercomponent==true).ToList();
                ViewBag.Sprinkler = DB.tblSubCategories.Where(x=>x.Plannercomponent==true &&x.CategoryID==1).ToList();
                Data = DB.tblComponents.Select(r => r).Where(x => x.isActive == true).ToList();
                

            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }



            return View(Data);
        }

        public ActionResult AddAccesoires(string pdfData,int OrderId=0)
        {
            HttpCookie cookieObj = Request.Cookies["User"];
            int UserId = Int32.Parse(cookieObj["UserId"]);
            int RoleId = Int32.Parse(cookieObj["RoleId"]);
            List<Sp_GetAccesoires_Result> Data = new List<Sp_GetAccesoires_Result>();
            try
            {
                ViewBag.UserId = UserId;
                ViewBag.OrderId = OrderId;
                Data = DB.Sp_GetAccesoires(OrderId).ToList();
                ViewBag.BomData = DB.Sp_GetBOMData(OrderId).ToList();
            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            return View(Data);
        }


        [HttpPost]
        public JsonResult AddAccesoires(List<Sp_GetAccesoires_Result> Datas)
        {
            HttpCookie cookieObj = Request.Cookies["User"];
            int UserId = Int32.Parse(cookieObj["UserId"]);
            int RoleId = Int32.Parse(cookieObj["RoleId"]);
            //List<Sp_GetAccesoires_Result> Data = new List<Sp_GetAccesoires_Result>();
            tblOrderDetail Check = new tblOrderDetail();
            try
            {

                foreach (var item in Datas)
                {
                    Check = DB.tblOrderDetails.Where(x => x.OrderId == item.OrderId && x.SubCategoryID == item.SCId).FirstOrDefault();
                    if(Check!=null)
                    {
                        DB.Entry(Check).State = EntityState.Deleted;
                        DB.SaveChanges();
                    }
                    

                    tblOrderDetail Data = new tblOrderDetail();
                    Data.OrderId = item.OrderId;
                    Data.SubCategoryID = item.SCId;
                    Data.SubcategoryName = item.SCName;
                    Data.Price = item.SCPrice*item.Qty;
                    Data.Qty = item.Qty;
                    DB.tblOrderDetails.Add(Data);
                    DB.SaveChanges();
                }
               
                tblLog LogData = new tblLog();
                LogData.UserId = UserId;
                LogData.Action = "Add Accesoires Order Details";
                LogData.CreatedDate = DateTime.Now;
                DB.tblLogs.Add(LogData);
                DB.SaveChanges();
            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            return Json(1);
        }


        public ActionResult BOMView(int OrderId = 0)
        {
            HttpCookie cookieObj = Request.Cookies["User"];
            int UserId = Int32.Parse(cookieObj["UserId"]);
            int RoleId = Int32.Parse(cookieObj["RoleId"]);
            List<Sp_GetAccesoires_Result> Data = new List<Sp_GetAccesoires_Result>();
            try
            {
                ViewBag.OrderId = OrderId;
                Data = DB.Sp_GetAccesoires(OrderId).ToList();
            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            return View(Data);
        }

    }
}