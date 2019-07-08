using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// CustomerServ 的摘要说明
/// </summary>
public class CustomerServ
{
    public CustomerServ()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    public Customer CheckUserPwd(string userId, string userPwd)
    {
        Customer result = null;
        List<Customer> customerList = GetAllCustomers();
        foreach (Customer customer in customerList)
        {
            if (customer.UserId.Equals(userId) && customer.UserPwd.Equals(userPwd))
            {
                result = customer;
                break;
            }
        }
        return result;
    }

    public Admin CheckAdminUserPwd(string userId, string userPwd)
    {
        Admin result = null;
        List<Admin> adminList = GetAllAdmin();
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

    public List<Admin> GetAllAdmin()
    {
        return DBHelper.GetAdminsList();
    }

    public Customer GetCustomerById(int id)
    {
        Customer result = new Customer();
        List<Customer> customerList = GetAllCustomers();
        result = customerList.FirstOrDefault(p => p.Id == id);

        return result;
    }

    public List<Address> GetAddressListByCustomerId(int id)
    {
        List<Address> result = new List<Address>();
        List<Address> addressList = GetAllAddress();
        //result = addressList.FirstOrDefault(a => a.CustomerId == id);
        foreach (Address address in addressList)
        {
            if (address.CustomerId == id)
            {
                result.Add(address);
            }
        }
        return result;
    }

    public List<Customer> GetAllCustomers()
    {
        //Customer customer;
        //List<Customer> customerList = new List<Customer>();

        //customer = new Customer();
        //customer.Id = 1;
        //customer.Name = "张三丰";
        //customer.UserId = "zsf@qq.com";
        //customer.UserPwd = "123";
        //customer.Balance = 100000;
        //customerList.Add(customer);

        //customer = new Customer();
        //customer.Id = 2;
        //customer.Name = "野蜂";
        //customer.UserId = "yf@qq.com";
        //customer.UserPwd = "123";
        //customer.Balance = 100000;
        //customerList.Add(customer);

        //customer = new Customer();
        //customer.Id = 3;
        //customer.Name = "狗鱼";
        //customer.UserId = "hy@qq.com";
        //customer.UserPwd = "123";
        //customer.Balance = 100000;
        //customerList.Add(customer);

        //customer = new Customer();
        //customer.Id = 4;
        //customer.Name = "林津民";
        //customer.UserId = "ljm@qq.com";
        //customer.UserPwd = "123";
        //customer.Balance = 100000;
        //customerList.Add(customer);

        //return customerList;
        return DBHelper.GetCustomersList();
    }

    public List<Address> GetAllAddress()
    {
        Address address;
        List<Address> addressList = new List<Address>();

        address = new Address();
        address.Id = 1;
        address.Name = "张三丰";
        address.CustomerId = 1;
        address.IsDefault = false;
        address.Phone = "18857515451";
        address.Addr = "浙江省绍兴市绍兴文理学院河西校区";
        addressList.Add(address);

        address = new Address();
        address.Id = 1;
        address.Name = "张三丰";
        address.CustomerId = 1;
        address.IsDefault = true;
        address.Phone = "18857515451";
        address.Addr = "浙江省绍兴市绍兴文理学院南山校区";
        addressList.Add(address);

        address = new Address();
        address.Id = 1;
        address.Name = "张三丰";
        address.CustomerId = 1;
        address.IsDefault = false;
        address.Phone = "18857515451";
        address.Addr = "浙江省绍兴市绍兴文理学院";
        addressList.Add(address);

        address = new Address();
        address.Id = 2;
        address.Name = "野蜂";
        address.CustomerId = 2;
        address.Phone = "18857515451";
        address.Addr = "浙江省绍兴市绍兴文理学院河西校区";
        addressList.Add(address);

        address = new Address();
        address.Id = 3;
        address.Name = "狗鱼";
        address.CustomerId = 2;
        address.Phone = "18857515451";
        address.Addr = "浙江省绍兴市绍兴文理学院河西校区";
        addressList.Add(address);

        address = new Address();
        address.Id = 4;
        address.Name = "林津民";
        address.CustomerId = 2;
        address.IsDefault = false;
        address.Phone = "17857051451";
        address.Addr = "浙江省绍兴市绍兴文理学院河西校区";
        addressList.Add(address);

        address = new Address();
        address.Id = 4;
        address.Name = "林津民";
        address.CustomerId = 2;
        address.IsDefault = true;
        address.Phone = "17857051451";
        address.Addr = "浙江省绍兴市绍兴文理学院南山校区";
        addressList.Add(address);

        address = new Address();
        address.Id = 4;
        address.Name = "林津民";
        address.CustomerId = 3;
        address.IsDefault = true;
        address.Phone = "17857051451";
        address.Addr = "浙江省绍兴市绍兴文理学院理工楼";
        addressList.Add(address);

        return addressList;
    }
}