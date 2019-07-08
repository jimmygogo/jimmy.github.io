<%@ WebHandler Language="C#" Class="adduserhandler" %>

using System;
using System.Web;

public class adduserhandler : IHttpHandler {

    //public void ProcessRequest (HttpContext context) {
    //    context.Response.ContentType = "text/plain";
    //    context.Response.Write("Hello World");
    //}

    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        //context.Response.ContentType = "text/plain";

        Customer c = new Customer();

        c.UserId = context.Request["UserId"];
        c.Name = context.Request["UserName"];
        //alert(UserName);
        c.UserPwd = context.Request["UserPwd"];
        var ReUserPwd = context.Request["ReUserPwd"];
        c.Balance = 0;
            c.TelNo = context.Request["TelNo"];
        c.Address = context.Request["Address"];


        if (DBHelper.AddCustomer(c) != 0 /*&& ReUserPwd !=c.UserPwd*/)
        {
            context.Response.Write("error");
        }
        else
        {
            context.Response.Write("ok");
        }

    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}