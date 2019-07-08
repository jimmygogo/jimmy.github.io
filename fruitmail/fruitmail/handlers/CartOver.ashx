<%@ WebHandler Language="C#" Class="CartOver" %>

using System;
using System.Web;
using System.Web.SessionState;
public class CartOver : IHttpHandler,IRequiresSessionState {

    public void ProcessRequest (HttpContext context) {

        context.Session["ShoppingCart"] = null;

        context.Response.ContentType = "text/plain";
        context.Response.Write("Hello World");
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}