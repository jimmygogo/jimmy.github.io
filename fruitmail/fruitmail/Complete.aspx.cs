using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Complete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Customer customer = Session["Customer"] as Customer;
        ShoppingCart cart = Session["ShoppingCart"] as ShoppingCart;
        if (Session["Customer"] == null)
        {
            //后台跳转
            Response.Redirect("Login.aspx");
        }
    }
}