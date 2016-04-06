using ExpoAppl.DBModel;
using ExpoAppl.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ExpoAppl.Controllers
{
    public class PopulateDDLController : Controller
    {
        // GET: PopulateDDL
        public ActionResult Index()
        {
            var pModel = new ProductsViewModel();

            //ExpoApplDBEntities dbContext = new ExpoApplDBEntities();

            //pModel = dbContext.Products.ToList().Select(x => new SelectListItem
            //{
            //    Value = x.ProductID.ToString(),
            //    Text = x.ProductName
            //});
            
            return View();
        }
    }
}