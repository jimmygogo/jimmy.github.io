using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Like : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LikeCart cart = Session["LikeCart"] as LikeCart;
        if (cart == null)
        {
            cart = new LikeCart();
        }
        rptproduct.DataSource = cart.CartItems;
        rptproduct.DataBind();

        rptprice.DataSource = cart.CartItems;
        rptprice.DataBind();

        rptstock.DataSource = cart.CartItems;
        rptstock.DataBind();

        

    }
}