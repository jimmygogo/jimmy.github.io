<%@ WebHandler Language="C#" Class="RemoveCart" %>

using System;
using System.Web;
using System.Web.SessionState;

public class RemoveCart : IHttpHandler,IRequiresSessionState
{
    public void ProcessRequest(HttpContext context)
    {
        //接受请求参数
        string id = context.Request["id"].ToString();
        //处理业务逻
            
        ShoppingCart cart = context.Session["ShoppingCart"] as ShoppingCart;
        cart.RemoveItem(int.Parse(id));
        context.Session["ShoppingCart"] = cart;
        context.Response.ContentType = "text/plain";
        context.Response.Write("Hello World");
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}