using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PlaceOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Customer customer = Session["Customer"] as Customer;
        CustomerServ serv = new CustomerServ();
        ShoppingCart cart = Session["ShoppingCart"] as ShoppingCart;
        if (Session["Customer"] == null)
        {
            //后台跳转
            Response.Redirect("Login.aspx");
        }
        else
        {
            //绑定购物车

            rptCartList.DataSource = cart.CartItems;
            rptCartList.DataBind();

            //绑定地址栏  
            List<Address> addressList = serv.GetAddressListByCustomerId( int.Parse( customer.UserId));
            rptAddress.DataSource = addressList;
            rptAddress.DataBind();
            //CustomerServ customerserv = new CustomerServ();
            //List<Address> address = customerserv.GetAddressListByCustomerId(customer.Id);

            //rptAddress.DataSource = customer.Address;
            //rptAddress.DataBind();

            //余额
            money.Text = customer.Balance.ToString();
            //手机号
            rptPhone.DataSource = addressList;
            rptPhone.DataBind();
            
           
        }
    }
}