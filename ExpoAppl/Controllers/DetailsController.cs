using ExpoAppl.DBModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web.Http;

namespace ExpoAppl.Controllers
{   
    public class DetailsController : ApiController
    {
        StringBuilder detailsBuilder = new StringBuilder();
        ExpoApplDBEntities dbContext = new ExpoApplDBEntities();

        public HttpResponseMessage GetDetailsWithIds(int pId, int sId)
        {
            if ((pId!=0) && (sId==0))
            {

                foreach (var item in dbContext.proc_DetailsTablewithProdID(pId))
                {
                    detailsBuilder.Append("<tr><td>" + item.SupplierName + "</td><td>" + item.ProductName + "</td><td>" + item.Price + "</td></tr>");
                }
            }
            else if ((pId==0) && (sId!=0))
            {
                foreach (var item in dbContext.proc_DetailsTablewithSupplierID(sId))
                {
                    detailsBuilder.Append("<tr><td>" + item.SupplierName + "</td><td>" + item.ProductName + "</td><td>" + item.Price + "</td></tr>");
                }
            }
            else if ((pId != 0) && (sId != 0))
            {
                foreach (var item in dbContext.proc_DetailsTablewithSupplierAndProdIDs(pId, sId))
                {
                    detailsBuilder.Append("<tr><td>" + item.SupplierName + "</td><td>" + item.ProductName + "</td><td>" + item.Price + "</td></tr>");
                }
            }
            return new HttpResponseMessage() { Content = new StringContent(detailsBuilder.ToString(), Encoding.UTF8, "text/html") };            
        }
    }
}
