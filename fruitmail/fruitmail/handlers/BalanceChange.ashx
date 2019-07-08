<%@ WebHandler Language="C#" Class="BalanceChange" %>

using System;
using System.Web;
using System.Web.SessionState;
public class BalanceChange : IHttpHandler, IRequiresSessionState  {

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";

        try
        {
            decimal recharge = Convert.ToDecimal(context.Request.Form["recharge"]);
            decimal totalPrice = Convert.ToDecimal(context.Request.Form["totalPrice"]);
            string type = context.Request.Form["type"];

            Customer customer = (Customer)context.Session["customer"];

            switch (type)
            {
                case "recharge":
                    if (customer != null)
                    {
                        customer.Balance += recharge;
                        context.Session["customer"] = customer;
                        //context.Response.Write(customer.Balance);
                        //将余额存储于表
                        if(DBHelper.SaveBalanceByCustomerId(int.Parse(customer.UserId), customer.Balance) != -1)
                        {
                            context.Response.Write(customer.Balance);
                        }
                        else
                        {
                            context.Response.Write("SwitchError");
                        }
                    }
                    else
                        context.Response.Redirect("/Login.aspx");
                    break;
                //case "placeAnOrder":
                //    if (customer != null)
                //    {
                //        ShoppingCart cart = (ShoppingCart)context.Session["ShoppingCart"];
                //        if(DBHelper.createOrder(customer.UserId,cart)==0)
                //        {
                //            context.Session["ShoppingCart"]=null;
                //        }
                //        //if (customer.Balance >= totalPrice)
                //        //{
                //        //    customer.Balance -= totalPrice;
                //        //    ShoppingCart cart = (ShoppingCart)context.Session["ShoppingCart"];
                //        //    cart.EmptyItem();  //清空购物车
                //        //    context.Response.Write(customer.Balance);
                //        //}
                //        //else
                //        //    context.Response.Write("PlaceAnOrderError");
                //    }
                //    else
                //        context.Response.Redirect("/Login.aspx");
                //    break;
                default:
                    context.Response.Write("SwitchError");
                    break;
            }

        }
        catch (Exception)
        {
            context.Response.Write("Error");
        }
    }


    public bool IsReusable {
        get {
            return false;
        }
    }

}