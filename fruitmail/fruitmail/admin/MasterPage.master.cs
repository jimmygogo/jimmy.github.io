using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Admin admin = Session["Admin"] as Admin;
        if (admin != null)
            Login.Text = admin.AdminName;
        else
            Login.Text = "未登录";
        //Customer customer = Session["Customer"] as Customer;
        //if (customer != null)
        //    Login.Text = customer.Name;
        //else
        //    Login.Text = "未登录";
    }
}
