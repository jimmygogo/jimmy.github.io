using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage2 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Customer customer = Session["Customer"] as Customer;
        if (customer != null)
            Login.Text = customer.Name;
        else
            Login.Text = "未登录";

        ShoppingCart cart = Session["ShoppingCart"] as ShoppingCart;
        if (cart == null)
        {
            cartNum.Text = "0";
            cart = new ShoppingCart();
        }
        else
            cartNum.Text = cart.ItemCount.ToString();
    }
}
