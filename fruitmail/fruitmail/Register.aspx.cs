using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        String insertcmd = "insert into Customer(UserId,UserName,UserPwd,Balance,TelNo,Address) values(@UserId,@UserName,@UserPwd,@Balance,@TelNo,@Address)";
        SqlCommand mycmd = new SqlCommand(insertcmd, connection);
        //可¨¦在¨²此ä?判D断?参?数ºy是º?否¤?正y确¨¡¤，ê?密¨¹码?是º?否¤?相¨¤同ª?
        mycmd.Parameters.AddWithValue("@UserId", txtUserid.Text.Trim());
        mycmd.Parameters.AddWithValue("@UserName", txtUserName.Text.Trim());
        mycmd.Parameters.AddWithValue("@UserPwd", txtUserPwd.Text.Trim());
        mycmd.Parameters.AddWithValue("@Balance", 0);
        mycmd.Parameters.AddWithValue("@TelNo", txtTelNo.Text.Trim());
        mycmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
        //如¨?果?要°a密¨¹码?的Ì?密¨¹文?，ê?使º1用®?以°?下?两¢?句?代ä¨²替¬?上¦?面?一°?句?
        //string md5Pwd = FormsAuthentication.HashPasswordForStoringInConfigFile(txtUserPwd.Text.Trim(), "MD5");//"MD5","SHA1","SHA2","SHA3"
        //mycmd.Parameters.AddWithValue("@UserPwd", md5Pwd);        
        mycmd.Connection.Open();
        int iResult = 0;
        try
        {
            iResult = mycmd.ExecuteNonQuery();
        }
        catch (Exception ee)
        {
            Label1.Text = ee.Message;
            return;
        }
        finally
        {
            mycmd.Connection.Close();
        }
        if (iResult == 1)
        {
            Label1.Text = "OK";
        }
        else
        {
            Label1.Text = "ERROR";
        }
    }
}