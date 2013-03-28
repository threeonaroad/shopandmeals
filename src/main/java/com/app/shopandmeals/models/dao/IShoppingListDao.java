/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.shopandmeals.models.dao;

import java.util.List;

import com.app.shopandmeals.models.entity.ShopList;
import com.mongodb.WriteResult;


public interface IShoppingListDao {

    public List<ShopList> findAll();

    public ShopList findById(String shopListId);
    
    public ShopList create(ShopList shopList);

    public void delete(ShopList shopList);

	public WriteResult update(ShopList shopList);

    
}
