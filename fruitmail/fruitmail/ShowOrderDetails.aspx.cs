using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShowOrderDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Customer"] == null)
        {
            Response.Redirect("Login.aspx");
            return;
        }
        string oid = Request.QueryString["id"];
        SqlDataSource1.SelectCommand = "select * from orderDetails where orderId= " + oid;



        //By type page
        //FruitServ fruitserv = new FruitServ();
        //Fruit[] fruits = fruitserv.GetFruitById(oid);
        

        //rptproduct.DataSource = fruits;
        //rptproduct.DataBind();

        //rptprice.DataSource = fruits;
        //rptprice.DataBind();

        //rptstock.DataSource = fruits;
        //rptstock.DataBind();

    }
}