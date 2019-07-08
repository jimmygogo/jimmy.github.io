using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// AdminServ 的摘要说明
/// </summary>
public class AdminServ
{
    public AdminServ()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    public Admin CheckUserPwd(string userId, string userPwd)
    {
        Admin result = null;
        List<Admin> adminList = GetAllAdmins();
        foreach (Admin admin in adminList)
        {
            if (admin.AdminName.Equals(userId) && admin.AdminPwd.Equals(userPwd))
            {
                result = admin;
                break;
            }
        }
        return result;
    }

    public List<Admin> GetAllAdmins()
    {
        return DBHelper.GetAdminsList();
    }
}