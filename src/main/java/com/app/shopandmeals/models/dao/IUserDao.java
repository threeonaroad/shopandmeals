/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.shopandmeals.models.dao;

import java.util.ArrayList;
import java.util.List;

import com.app.shopandmeals.models.entity.User;
import com.mongodb.WriteResult;


public interface IUserDao {

    public List<User> findAll();

    public User findById(String username);
    
    public User create(User user);
    
    public User userExists(User user);

    public void delete(User user);

	public WriteResult update(User User);
	
	public WriteResult updateUserWithMenus(String username, int last_menus, ArrayList<Integer> notVisitedMenus, int newMenuVisited);
	//public WriteResult updateLastMenus(String username, int last_menus);
	
	//public WriteResult updateMenus(String username, int newMenuVisited);
	
	//public WriteResult updateMenus(String username, ArrayList<Integer> notVisitedMenus);
    
}
