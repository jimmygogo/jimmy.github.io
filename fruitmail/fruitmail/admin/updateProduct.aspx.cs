using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_updateProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //绑定数据到下拉框 
        if (!IsPostBack)
        {
            bindData();
            bindRecord();
        }
    }

    //根据传递过来的id查找记录，将记录的各列值绑定到页面控件中
    protected void bindRecord()
    {
        string id = Request["Id"];
        if (id == null)
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('参数错误！');</script>");
            return;
        }
        //查找记录
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        string queryString = "SELECT * FROM fruits where fId=@fId";
        SqlCommand command = new SqlCommand(queryString, connection);
        command.Parameters.AddWithValue("@fId", id);
        connection.Open();
        SqlDataReader reader = command.ExecuteReader();
        if (reader.Read())
        {
            txtID.Text = reader["fid"].ToString();
            txtName.Text = reader["fName"].ToString();
            txtDesc.Text = reader["fDescr"].ToString();
            txtPrice.Text = reader["fPrice"].ToString();
            ddlImgpath.SelectedValue = reader["fImage"].ToString();
            Image1.ImageUrl = ddlImgpath.SelectedValue;
            ddlTypeid.SelectedValue = reader["fClassId"].ToString();
        }
        connection.Close();
    }

    //选择框内容改变后
    protected void ddlImgpath_SelectedIndexChanged(object sender, EventArgs e)
    {
        Image1.ImageUrl = ddlImgpath.SelectedValue;
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
    //修改
    protected void Button1_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        String insertcmd = "update fruits set fName=@fName,fPrice=@fPrice,fDescr=@fDescr,fImage=@fImage,fClassId=@fClassId where fId=@fId";
        SqlCommand mycmd = new SqlCommand(insertcmd, connection);
        //
        mycmd.Parameters.AddWithValue("@fName", txtName.Text.Trim());
        mycmd.Parameters.AddWithValue("@fPrice", txtPrice.Text.Trim());
        mycmd.Parameters.AddWithValue("@fDescr", txtDesc.Text.Trim());
        mycmd.Parameters.AddWithValue("@fImage", ddlImgpath.SelectedValue);
        mycmd.Parameters.AddWithValue("@fClassId", ddlTypeid.SelectedValue);
        mycmd.Parameters.AddWithValue("@fId", txtID.Text.Trim());
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
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('修改记录成功！');window.location.href='productsEdit.aspx';</script>");
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('命令执行完成，但没有记录被修改！');window.location.href='productsEdit.aspx';</script>");
        }
    }

}