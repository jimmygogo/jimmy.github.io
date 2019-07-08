<%@ WebHandler Language="C#" Class="ChangeCart" %>

using System;
using System.Web;
using System.Web.SessionState;

public class ChangeCart : IHttpHandler ,IRequiresSessionState{
    public void ProcessRequest(HttpContext context)
    {
        //接受请求
        string id = context.Request["id"].ToString();
        string quantity = context.Request["quantity"].ToString();
        //处理业务逻辑
        FruitServ fruitServ = new FruitServ();
        Fruit fruit = fruitServ.GetFruitById(int.Parse(id));

        CartItem item = new CartItem();
        item.Id = fruit.Id;
        item.Name = fruit.Title;
        item.Price = fruit.Price;
        item.Quantity = int.Parse(quantity);
        item.Pic =fruit.Photo;

        ShoppingCart cart =(ShoppingCart)context.Session["ShoppingCart"];

        if (cart == null)
         cart = new ShoppingCart();

            cart.ChangeItem(item);
            context.Session["ShoppingCart"] = cart;

            context.Response.ContentType = "text/plain";
        context.Response.Write("Hello World");
        }
    public bool IsReusable
    {
        get {
            return false;
        }
    }
}