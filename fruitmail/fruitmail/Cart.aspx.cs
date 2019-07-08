using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Customer cus = Session["Customer"] as Customer;
        if (cus == null)
        {
            Response.Redirect("Login.aspx");
        }
        ShoppingCart cart = Session["ShoppingCart"] as ShoppingCart;
        if (cart == null)
        {
            cart = new ShoppingCart();
        }
        rptShoppingCart.DataSource = cart.CartItems;
        rptShoppingCart.DataBind();

    }
}