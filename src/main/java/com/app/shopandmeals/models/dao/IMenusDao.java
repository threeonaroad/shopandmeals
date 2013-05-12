/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.shopandmeals.models.dao;

import java.util.List;

import com.app.shopandmeals.models.entity.Menus;


public interface IMenusDao {
	    public List<Menus> findMenusById(String id);
	    
	    //public List<Menus> createNewSetMenus();	    
	    
	    public int getTotalMenus();
	 
}

