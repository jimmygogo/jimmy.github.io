<%@ WebHandler Language="C#" Class="AddToLikeCart" %>

using System;
using System.Web;
using System.Web.SessionState;

public class AddToLikeCart : IHttpHandler ,IRequiresSessionState {

    public void ProcessRequest (HttpContext context) {
        //接受请求
        string id = context.Request["id"].ToString();
        //string quantity = context.Request["quantity"].ToString();

        //处理业务逻辑
        FruitServ fruitServ = new FruitServ();
        Fruit fruit = fruitServ.GetFruitById(int.Parse(id));

        CartItem item = new CartItem();
        item.Id = fruit.Id;
        item.Name = fruit.Title;
        item.Price = fruit.Price;
        //item.Quantity = int.Parse(quantity);
        item.Pic =fruit.Photo;
        item.Place = fruit.Place;
        item.Tag1 = fruit.Tag1;
        item.Tag2 = fruit.Tag2;
        item.Stock = fruit.Stock;
        item.Family = fruit.Family;
        item.Color = fruit.Color;

        LikeCart cart =(LikeCart)context.Session["LikeCart"];

        if (cart == null)
            cart = new LikeCart();

        cart.AddItem(item);
        context.Session["LikeCart"] = cart;

        context.Response.ContentType = "text/plain";
        context.Response.Write("Hello World");
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}