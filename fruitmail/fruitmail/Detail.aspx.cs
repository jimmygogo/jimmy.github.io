using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Detail : System.Web.UI.Page
{
    int id = 1;
    int type, page;
    FruitServ fruitserv = new FruitServ();
    protected void Page_Load(object sender, EventArgs e)
    {
        int.TryParse(Request.QueryString["id"], out id);
        if (id == 0) { id = 1; }
        FruitServ fruitServ = new FruitServ();
        Fruit fruit = fruitServ.GetFruitById(id);
        imgFruit1.ImageUrl = string.Format("{0}", fruit.Photo);
        imgFruit2.ImageUrl = string.Format("{0}", fruit.Photo);
        name.Text = string.Format(fruit.Title);
        description.Text = string.Format(fruit.Description);
        price.Text = fruit.Price.ToString();

        Category[] categories = fruitserv.GetCategories();
        RptLi.DataSource = categories;
        RptLi.DataBind();

        //ColorNum
        int rednum = 0;
        int yellownum = 0;
        int bluenum = 0;
        int greennum = 0;
        List<Fruit> allfruits = fruitserv.GetAllFruits();
        foreach (Fruit f in allfruits)
        {
            if (f.Color == "red")
            {
                rednum++;
            }
            if (f.Color == "yellow")
            {
                yellownum++;
            }
            if (f.Color == "blue")
            {
                bluenum++;
            }
            if (f.Color == "green")
            {
                greennum++;
            }
        }
        RedNum.Text = rednum.ToString();
        YellowNum.Text = yellownum.ToString();
        BlueNum.Text = bluenum.ToString();
        GreenNum.Text = greennum.ToString();
    }
    public int Id
    {
        get
        {
            return id;
        }
    }
}