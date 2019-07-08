using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_productsAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //绑定数据到下拉框 
        if (!IsPostBack)
        {
            bindData();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        String insertcmd = "insert into fruits(fName,fPrice,fDescr,fImage,fStock,fClassId) values(@fName,@fPrice,@fDescr,@fImage,@fStock,@fClassId)";

        SqlCommand mycmd = new SqlCommand(insertcmd, connection);
        //可在此判断参数是否正确，密码是否相同
        mycmd.Parameters.AddWithValue("@fName", txtName.Text.Trim());
        mycmd.Parameters.AddWithValue("@fPrice", txtPrice.Text.Trim());
        mycmd.Parameters.AddWithValue("@fDescr", txtDesc.Text.Trim());
        mycmd.Parameters.AddWithValue("@fImage", ddlImgpath.SelectedValue);
        //mycmd.Parameters.AddWithValue("@classid", ddlTypeid.SelectedValue);
        mycmd.Parameters.AddWithValue("@fStock", txtStock.Text.Trim());
        mycmd.Parameters.AddWithValue("@fClassId", ddlTypeid.SelectedValue);

        mycmd.Connection.Open();
        int iResult = 0;
        try
        {
            iResult = mycmd.ExecuteNonQuery();
        }
        catch (Exception ee)
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('错误！');</script>");
            return;
        }
        finally
        {
            mycmd.Connection.Close();
        }
        if (iResult == 1)
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('增加记录成功！');</script>");
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('命令执行完成，但没有增加记录！');</script>");
        }
    }
    //选择框内容改变后
    protected void ddlImgpath_SelectedIndexChanged(object sender, EventArgs e)
    {
        Image1.ImageUrl =/* "~\\assets\\images\\product\\" + */ddlImgpath.SelectedValue;
    }
    //将服务器images\\uploads文件夹下的图片文件路径绑定到下拉框
    protected void bindData()
    {
        //获取images文件夹的物理路径
        string str = Server.MapPath(Request.ApplicationPath) + "\\assets\\images\\product";
        //
        string[] strFiles = System.IO.Directory.GetFiles(str);

        ddlImgpath.Items.Clear();

        for (int i = 0; i < strFiles.Length; i++)
        {
            ListItem item = new ListItem(System.IO.Path.GetFileNameWithoutExtension(strFiles[i]), "~\\assets\\images\\product\\" + System.IO.Path.GetFileName(strFiles[i]));
            ddlImgpath.Items.Add(item);

        }
        Image1.ImageUrl = ddlImgpath.SelectedValue;
    }


}