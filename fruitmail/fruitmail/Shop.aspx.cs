using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Shop : System.Web.UI.Page
{
    int type, page;
    string color = null;
    string tag = null;
    string search = null;
    FruitServ fruitserv = new FruitServ();

    protected void Page_Load(object sender, EventArgs e)
    {
        // get type
        int.TryParse(Request.QueryString["type"], out type);
        // get page num
        int.TryParse(Request.QueryString["page"], out page);
        if (page == 0) page = 1;
        // get color
        color = Request.QueryString["color"];
        // get tag
        tag = Request.QueryString["tag"];
        // get search
        search = Request.QueryString["search"];

        // Render fruitCatgories List
        Category[] categories = fruitserv.GetCategories();
        RptLi.DataSource = categories;
        RptLi.DataBind();

        // Render tag List
        List<Tag> tags = fruitserv.GetAlltags();
        rpttagLi.DataSource = tags;
        rpttagLi.DataBind();

        //By type page
        Fruit[] fruits = fruitserv.GetFruitsByTypeAndPage(type, page);
        rptFruits.DataSource = fruits;
        rptFruits.DataBind();

        //By color
        if (color != null)
        {
            Fruit[] fruits1 = fruitserv.GetFruitsByColor(color);
            rptFruits.DataSource = fruits1;
            rptFruits.DataBind();
        }

        //By tag
        if (tag != null)
        {
            Fruit[] fruits2 = fruitserv.GetFruitsByTag(tag);
            rptFruits.DataSource = fruits2;
            rptFruits.DataBind();
        }

        //By search
        if (search != null)
        {
            Fruit[] fruits3 = fruitserv.GetFruitsBySearch(search);
            rptFruits.DataSource = fruits3;
            rptFruits.DataBind();
        }

        // Render pagination
        List<PageNode> pages = new List<PageNode>();
        for (int i = 1; i <= fruitserv.getPageNum(); i++) pages.Add(new PageNode(i, page));
        rptPages.DataSource = pages;
        rptPages.DataBind();

        //ColorNum
        int rednum = 0;
        int yellownum = 0;
        int bluenum = 0;
        int greennum = 0;
        List<Fruit> allfruits = fruitserv.GetAllFruits();
        foreach (Fruit fruit in allfruits)
        {
            if (fruit.Color == "red")
            {
                rednum++;
            }
            if (fruit.Color == "yellow")
            {
                yellownum++;
            }
            if (fruit.Color == "blue")
            {
                bluenum++;
            }
            if (fruit.Color == "green")
            {
                greennum++;
            }
        }
        RedNum.Text = rednum.ToString();
        YellowNum.Text = yellownum.ToString();
        BlueNum.Text = bluenum.ToString();
        GreenNum.Text = greennum.ToString();
    }
    struct PageNode
    {
        int pageNum;
        string className;
        public int PageNum { get { return pageNum; } }
        public string ClassName { get { return className; } }
        public PageNode(int pageNum, int currentPage)
        {
            this.pageNum = pageNum;
            if (currentPage != pageNum) className = "no-round-btn smooth";
            else className = "no-round-btn smooth active";
        }
    }
}