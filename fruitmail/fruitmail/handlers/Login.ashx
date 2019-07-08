<%@ WebHandler Language="C#" Class="Login" %>

using System;
using System.Web;
using System.Web.SessionState;


public class Login : IHttpHandler, IRequiresSessionState
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";

        string userId = context.Request["userId"].ToString();
        string userPwd = context.Request["userPwd"].ToString();
        string checkcode = context.Request.Form["checkcode"];


        CustomerServ customerServ = new CustomerServ();

        //Customer customer = customerServ.CheckUserPwd(userId, userPwd);
        Admin admin = customerServ.CheckAdminUserPwd(userId, userPwd);

        if(context.Session["checkcode"].ToString()=="")
        {
                 context.Response.Write("请输入验证码！");
        }
        if (checkcode.ToUpper() != context.Session["checkcode"].ToString())
        {
            context.Response.Write("验证码错误！");

        }
        else
        {
            if (admin != null)
            {
                context.Session["Admin"] = admin;
                context.Response.Write("0" + admin.AdminName);
            }
            else
            {
                Customer cus = customerServ.CheckUserPwd(userId, userPwd);
                if (cus == null)
                {
                    context.Response.Write("用户名或密码不正确！");
                }
                else
                {
                    context.Session["Customer"] = cus;
                    context.Session["ShoppingCart"] = null;
                    context.Response.Write(cus.Name);
                }
            }
        }

    }


    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}