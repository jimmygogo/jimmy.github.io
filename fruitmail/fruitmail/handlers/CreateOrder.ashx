<%@ WebHandler Language="C#" Class="CreateOrder" %>

using System;
using System.Web;
using System.Web.SessionState;
public class CreateOrder : IHttpHandler, IRequiresSessionState {

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        Customer customer = (Customer)context.Session["Customer"];
        if (customer != null)
        {
            ShoppingCart cart = (ShoppingCart)context.Session["ShoppingCart"];
            string ordersid = "";
            if (DBHelper.createOrder(customer.UserId.ToString(), cart) == 0)
            {
                context.Response.Write(ordersid);            
            }
            else
            {
                context.Response.Write("error-2");
            }
        }
        else
        {
            context.Response.Write("error-2");
        }
    }


    public bool IsReusable {
        get {
            return false;
        }
    }

}