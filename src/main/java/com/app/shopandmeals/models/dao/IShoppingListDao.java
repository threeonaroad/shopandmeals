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
    
    public List<ShopList> findAll(String username);

    public ShopList findById(String shopListId);
    
    public ShopList create(ShopList shopList);
    
    public ShopList create(ShopList shopList, String username);

    public void delete(ShopList shopList);

	public WriteResult update(ShopList shopList);

	public WriteResult updateListShared(String id, String username);
	
	public WriteResult updateItems(String id, String[] description);
    
}

