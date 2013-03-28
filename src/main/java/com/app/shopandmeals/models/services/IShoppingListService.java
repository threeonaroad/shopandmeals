/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.shopandmeals.models.services;

import java.util.List;

import com.app.shopandmeals.models.entity.ShopList;
import com.mongodb.WriteResult;
/**
 *
 * @author Andres Guzman F
 */
public interface IShoppingListService {

	  public List<ShopList> findAll();

	    public ShopList findById(String shopListId);
	    
	    public void create(ShopList shopList);

	    public void delete(ShopList shopList);

		public WriteResult update(ShopList shopList);
}
