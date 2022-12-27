using DrawingTheme.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DrawingTheme.Controllers
{
    [FilterConfig.NoDirectAccess]
    [FilterConfig.AuthorizeActionFilter]
    public class UserController : Controller
    {
        AutomatischeEntities DB = new AutomatischeEntities();
        // GET: User
        public ActionResult Profile(string Success,string Error, int id=0)
        {
            HttpCookie cookieObj = Request.Cookies["User"];
            int UserId = Int32.Parse(cookieObj["UserId"]);
            tblUser Data = new tblUser();
            ViewBag.Success = Success;
            ViewBag.Error = Error;

            if (id==0)
            {
                Data = DB.tblUsers.Where(x => x.UserId == UserId).FirstOrDefault();
            }
            else
            {
                Data = DB.tblUsers.Where(x => x.UserId == id).FirstOrDefault();
            }
            int isAdmin = 1;
            if (UserId == Data.UserId)
            {
                isAdmin = 0;
            }
            ViewBag.isAdmin = isAdmin;
            return View(Data);
        }

        public ActionResult UserList(string Success, string Update, string Delete, string Error)
        {
            List<tblUser> UserList = DB.tblUsers.Where(x=>x.RoleId!=2).ToList();
            ViewBag.RoleList = DB.tblRoles.ToList();
           
            ViewBag.Success = Success;
            ViewBag.Update = Update;
            ViewBag.Delete = Delete;
            ViewBag.Error = Error;
            return View(UserList);
        }


        [HttpPost]
        public ActionResult AddUser(tblUser User, HttpPostedFileBase Image)
        {
            tblUser Data = new tblUser();
            try
            {
                HttpCookie cookieObj = Request.Cookies["User"];
                int UserId = Int32.Parse(cookieObj["UserId"]);
                int RoleId = Int32.Parse(cookieObj["RoleId"]);
                //int UserId = 1;
                if (User.UserId == 0)
                {
                    if (DB.tblUsers.Select(r => r).Where(x => x.Email == User.Email).FirstOrDefault() == null)
                    {
                        Data = User;
                        byte[] EncDataBtye = new byte[User.Password.Length];
                        EncDataBtye = System.Text.Encoding.UTF8.GetBytes(User.Password);
                        Data.Password = Convert.ToBase64String(EncDataBtye);
                       

                        string folder = Server.MapPath(string.Format("~/{0}/", "Uploading"));
                        if (!Directory.Exists(folder))
                        {
                            Directory.CreateDirectory(folder);
                        }
                        string path = null;

                        if (Image != null)
                        {
                            path = Path.Combine(Server.MapPath("~/Uploading"), Path.GetFileName(Image.FileName));
                            Image.SaveAs(path);
                            path = Path.Combine("\\Uploading", Path.GetFileName(Image.FileName));
                            Data.ImagePath = path;
                        }

                        Data.Address = User.Address;
                        Data.Phone = User.Phone;
                        Data.CreatedDate = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));
                        Data.CreatedBy = UserId;
                        Data.EditDate = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));
                        Data.EditBy = UserId;
                        Data.isActive = User.isActive;
                        DB.tblUsers.Add(Data);
                        DB.SaveChanges();

                        


                        tblLog LogData = new tblLog();
                        LogData.UserId = UserId;
                        LogData.Action = "Add User";
                        LogData.CreatedDate = DateTime.Now;
                        DB.tblLogs.Add(LogData);
                        DB.SaveChanges();
                        if (Data.RoleId == 2)
                        {
                            return RedirectToAction("CustomerList", "Customer", new { Update = "Customer has been added successfully." });
                        }
                        else
                        {
                            return RedirectToAction("UserList", new { Success = "User has been added successfully." });
                        }
;
                    }
                    else
                    {
                        if (Data.RoleId == 2)
                        {
                            return RedirectToAction("CustomerList", "Customer", new { Update = "Customer Already Exsist!!!" });
                        }
                        else
                        {
                            return RedirectToAction("UserList", new { Success = "User Already Exsist!!!" });
                        }
                    }
                }
                else
                {
                    var check = DB.tblUsers.Select(r => r).Where(x => x.Email == User.Email).FirstOrDefault();
                    if (check == null || check.UserId == User.UserId)
                    {
                        Data = DB.tblUsers.Select(r => r).Where(x => x.UserId == User.UserId).FirstOrDefault();
                   

                        string folder = Server.MapPath(string.Format("~/{0}/", "Uploading"));
                        if (!Directory.Exists(folder))
                        {
                            Directory.CreateDirectory(folder);
                        }
                        string path = null;

                        if (Image != null)
                        {
                            path = Path.Combine(Server.MapPath("~/Uploading"), Path.GetFileName(Image.FileName));
                            Image.SaveAs(path);
                            path = Path.Combine("\\Uploading", Path.GetFileName(Image.FileName));
                            Data.ImagePath = path;
                        }



                        Data.UserId = User.UserId;
                        Data.FirstName = User.FirstName;
                        Data.LastName = User.LastName;
                        Data.Email = User.Email;
                        Data.Address = User.Address;
                        Data.Phone = User.Phone;
                        Data.EditDate = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));
                        Data.EditBy = UserId;
                        Data.isActive = User.isActive;

                        Data.RoleId = User.RoleId;
                        if (User.Password != null)
                        {
                            byte[] EncDataBtye = new byte[User.Password.Length];
                            EncDataBtye = System.Text.Encoding.UTF8.GetBytes(User.Password);
                            Data.Password = Convert.ToBase64String(EncDataBtye);
                        }
                        else
                        {
                            Data.Password = Data.Password;
                        }
                        Data.EditDate = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));
                        Data.EditBy = UserId;
                        DB.Entry(Data);
                        DB.SaveChanges();
                       



                        tblLog LogData = new tblLog();
                        LogData.UserId = UserId;
                        LogData.Action = "Update User";
                        LogData.CreatedDate = DateTime.Now;
                        DB.tblLogs.Add(LogData);
                        DB.SaveChanges();

                        if (Data.RoleId == 2)
                        {
                            if (RoleId != 2)
                            {
                                return RedirectToAction("CustomerList", "Customer", new { Update = "Customer has been updated successfully." });
                            }
                            else
                            {
                                return RedirectToAction("Profile", "User", new {id= Data.UserId, Success = "Customer has been updated successfully." });
                            }
                        }
                        else
                        {
                            return RedirectToAction("UserList", new { Update = "User has been Update successfully." });
                        }

                        //return RedirectToAction("UserList", new { Update = "User has been Update successfully." });
                    }
                    else
                    {
                        ViewBag.Error = "User Already Exsist!!!";
                        if (Data.RoleId == 2)
                        {
                            if (RoleId != 2)
                            {
                                return RedirectToAction("CustomerList", "Customer", new { Delete = "Customer already exsist!!!" });
                            }
                            else
                            {
                                return RedirectToAction("Profile", "User", new { id = Data.UserId, Error = "Customer already exsist!!!" });
                            }
                            
                        }
                        else
                        {
                            return RedirectToAction("UserList", new { Delete = "User already exsist!!!" });
                        }
                        //return RedirectToAction("UserList", new { Error = "User Already Exsist!!!" });
                    }

                }


            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            return RedirectToAction("Users");
        }


        [HttpPost]
        public ActionResult DeleteUser(int UserId)
        {
            tblUser Data = new tblUser();
            HttpCookie cookieObj = Request.Cookies["User"];
            int CUserId = Int32.Parse(cookieObj["UserId"]);
            //int CUserId = 1;
            int? RoleID = 0;
            try
            {
                Data = DB.tblUsers.Select(r => r).Where(x => x.UserId == UserId).FirstOrDefault();
                RoleID = Data.RoleId;
                DB.Entry(Data).State = EntityState.Deleted;
                DB.SaveChanges();

                tblLog LogData = new tblLog();
                LogData.UserId = CUserId;
                LogData.Action = "Delete User";
                LogData.CreatedDate = DateTime.Now;
                DB.tblLogs.Add(LogData);
                DB.SaveChanges();
                if(RoleID==2)
                {
                    return RedirectToAction("CustomerList", "Customer", new { Delete = "Customer has been deleted successfully." });
                }
                else
                {
                    return RedirectToAction("UserList", new { Delete = "User has been deleted successfully." });
                }
            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            return Json(0);
        }

        public ActionResult Roles(int? id, string Success, string Update, string Error)
        {
            List<tblRole> Roles = DB.tblRoles.Where(x => x.isActive == true).ToList();
            ViewBag.MenuList = DB.tblMenus.ToList();

            try
            {
                var check = DB.tblAccessLevels.Where(x => x.RoleId == id).FirstOrDefault();
                if (id != null && id != 0 && check != null)
                {
                    ViewBag.SelectedRole = DB.tblRoles.Where(x => x.RoleId == id).FirstOrDefault();

                    ViewBag.SelectedMenuAccess = (from h in DB.tblMenus
                                                  join t in DB.tblAccessLevels.Where(x => x.RoleId == id) on h.MenuId equals t.MenuId into gj
                                                  from acc in gj.DefaultIfEmpty()
                                                      //where acc.roleid == id
                                                  select new MenuAccess
                                                  {
                                                      menu = h,
                                                      //accesslevelid = acc.accesslevelid,
                                                      accessedit = acc.EditAccess,
                                                      accessdelete = acc.DeleteAccess,
                                                      accesscreate = acc.CreateAccess,
                                                      isactive = acc.isActive,
                                                      roleid = id,
                                                      menuid = h.MenuId,

                                                  }).ToList();
                }
                else
                {
                    if (id != null && id != 0)
                    {
                        ViewBag.SelectedRole = DB.tblRoles.Where(x => x.RoleId == id).FirstOrDefault();
                    }
                    else
                    {
                        ViewBag.SelectedRole = null;
                    }
                    ViewBag.SelectedMenuAccess = null;
                }
            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }


            ViewBag.Update = Update;
            ViewBag.Success = Success;
            ViewBag.Error = Error;
            return View(Roles);
        }



        [HttpPost]
        public ActionResult CreateAccessLevel(List<tblAccessLevel> Items, string Role, int RoleId = 0)
        {
            tblRole Data = new tblRole();
            try
            {
                //HttpCookie cookieObj = Request.Cookies["User"];
                //int UserId = Int32.Parse(cookieObj["UserId"]);
                int UserId = 1;

                if (RoleId != 0)
                {

                    tblRole check = DB.tblRoles.Select(r => r).Where(x => x.Role == Role).FirstOrDefault();
                    if (check == null || check.RoleId == RoleId)
                    {
                        Data = DB.tblRoles.Select(r => r).Where(x => x.RoleId == RoleId).FirstOrDefault();

                        Data.Role = Role;
                        Data.isActive = true;
                        Data.EditDate = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));
                        Data.EditBy = UserId;
                        DB.Entry(Data);
                        DB.SaveChanges();
                        foreach (tblAccessLevel AccessLevel in Items)
                        {
                            var Del = DB.tblAccessLevels.Select(r => r).Where(x => x.RoleId == AccessLevel.RoleId && x.MenuId == AccessLevel.MenuId).FirstOrDefault();
                            if (Del != null)
                            {
                                DB.tblAccessLevels.Remove(Del);
                            }
                        }

                        foreach (tblAccessLevel AccessLevel in Items)
                        {
                            AccessLevel.RoleId = Data.RoleId;
                            AccessLevel.CreatedDate = DateTime.Now;
                            AccessLevel.CreatedBy = UserId;
                            AccessLevel.EditDate = DateTime.Now;
                            AccessLevel.EditBy = UserId;
                            //AccessLevel.tblMenu = DB.tblMenus.Select(r => r).Where(x => x.MenuID == AccessLevel.MenuID).FirstOrDefault();
                            //AccessLevel.tblRole = DB.tblRoles.Select(r => r).Where(x => x.RoleID == AccessLevel.RoleID).FirstOrDefault();
                            DB.tblAccessLevels.Add(AccessLevel);
                            DB.SaveChanges();
                        }
                        DB.SaveChanges();

                        tblLog LogData = new tblLog();
                        LogData.UserId = UserId;
                        LogData.Action = "Update Role";
                        LogData.CreatedDate = DateTime.Now;
                        DB.tblLogs.Add(LogData);
                        DB.SaveChanges();

                        return Json(1);
                    }
                    else
                    {
                        return Json(2);
                    }

                }
                else
                {
                    if (DB.tblRoles.Select(r => r).Where(x => x.Role == Role).FirstOrDefault() == null)
                    {
                        Data.Role = Role;
                        Data.isActive = true;
                        Data.CreatedDate = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));
                        Data.CreatedBy = UserId;
                        Data.EditDate = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));
                        Data.EditBy = UserId;
                        DB.tblRoles.Add(Data);
                        DB.SaveChanges();

                        foreach (tblAccessLevel AccessLevel in Items)
                        {
                            var Del = DB.tblAccessLevels.Select(r => r).Where(x => x.RoleId == Data.RoleId && x.MenuId == AccessLevel.MenuId).FirstOrDefault();
                            if (Del != null)
                            {
                                DB.tblAccessLevels.Remove(Del);
                            }
                        }

                        foreach (tblAccessLevel AccessLevel in Items)
                        {
                            AccessLevel.RoleId = Data.RoleId;
                            AccessLevel.CreatedDate = DateTime.Now;
                            AccessLevel.CreatedBy = UserId;
                            AccessLevel.EditDate = DateTime.Now;
                            AccessLevel.EditBy = UserId;
                            //AccessLevel.tblMenu = DB.tblMenus.Select(r => r).Where(x => x.MenuID == AccessLevel.MenuID).FirstOrDefault();
                            //AccessLevel.tblRole = DB.tblRoles.Select(r => r).Where(x => x.RoleID == AccessLevel.RoleID).FirstOrDefault();
                            DB.tblAccessLevels.Add(AccessLevel);
                            DB.SaveChanges();
                        }
                        DB.SaveChanges();

                        tblLog LogData = new tblLog();
                        LogData.UserId = UserId;
                        LogData.Action = "Create Role";
                        LogData.CreatedDate = DateTime.Now;
                        DB.tblLogs.Add(LogData);
                        DB.SaveChanges();

                        return Json(0);
                    }
                    else
                    {
                        return Json(2);
                    }
                }




            }
            catch (Exception ex)
            {

                ViewBag.Error = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            return Json(0);
        }

        [HttpPost]
        public ActionResult GetAccessLevel(int RoleId = 0)
        {
            List<MenuAccess> MenuAccess = new List<MenuAccess>();
            List<tblMenu> Menu = new List<tblMenu>();
            DB.Configuration.ProxyCreationEnabled = false;
            try
            {
                Menu = DB.tblMenus.ToList();
                MenuAccess = (from h in DB.tblMenus
                              join t in DB.tblAccessLevels.Where(x => x.RoleId == RoleId) on h.MenuId equals t.MenuId into gj
                              from acc in gj.DefaultIfEmpty()
                              select new MenuAccess
                              {
                                  menu = h,
                                  //accesslevelid = acc.accesslevelid,
                                  accessedit = acc.EditAccess,
                                  accessdelete = acc.DeleteAccess,
                                  accesscreate = acc.CreateAccess,
                                  isactive = acc.isActive,
                                  roleid = RoleId,
                                  menuid = h.MenuId,

                              }).ToList();
            }
            catch (Exception ex)
            {

                ViewBag.ex = ex.Message;
                Console.WriteLine("Error" + ex.Message);
            }

            return Json(MenuAccess, JsonRequestBehavior.AllowGet);
        }

       

    }
}