using ExpoAppl.DBModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ExpoAppl.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Title = "Home Page";
            ExpoApplDBEntities dbContext = new ExpoApplDBEntities();

            IEnumerable<SelectListItem> prodItems = dbContext.Products.Select(c => new SelectListItem
            {
                Value = c.ProductID.ToString(),
                Text = c.ProductName

            });
            ViewBag.Products = prodItems;

            IEnumerable<SelectListItem> supplierItems = dbContext.Suppliers.Select(c => new SelectListItem
            {
                Value = c.SupplierID.ToString(),
                Text = c.SupplierName

            });
            ViewBag.Suppliers = supplierItems;

            return View();
        }
    }
}
