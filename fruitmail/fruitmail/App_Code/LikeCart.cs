using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
/// <summary>
/// LikeCart 的摘要说明
/// </summary>
 [Serializable]
public class LikeCart
{
    private Hashtable htCartItems;

    public LikeCart()
    {
        htCartItems = new Hashtable();
    }

    public ICollection CartItems
    {
        get
        {
            return htCartItems.Values;
        }
    }

    public int ItemCount
    {
        get
        {
            int count = 0;
            foreach (CartItem item in htCartItems.Values)
            {
                count += item.Quantity;
            }
            return count;
        }
    }

    public void AddItem(CartItem item)
    {
        if (htCartItems.ContainsKey(item.Id))
        {
            CartItem existItem = (CartItem)htCartItems[item.Id];

            existItem.Quantity += item.Quantity;
        }
        else
        {
            htCartItems.Add(item.Id, item);
        }
    }

    public void ChangeItem(CartItem item)
    {
        if (htCartItems.ContainsKey(item.Id))
        {
            CartItem existItem = (CartItem)htCartItems[item.Id];

            existItem.Quantity = item.Quantity;
        }
        else
        {
            htCartItems.Add(item.Id, item);
        }
    }


    public void RemoveItem(int id)
    {
        htCartItems.Remove(id);
    }

    public void ChangeItemQuantity(int id, int quantity)
    {
        if (htCartItems.ContainsKey(id))
        {
            CartItem existItem = (CartItem)htCartItems[id];

            existItem.Quantity += quantity;
        }
    }
}