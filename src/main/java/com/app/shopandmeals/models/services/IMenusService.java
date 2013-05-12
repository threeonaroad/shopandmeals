/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.shopandmeals.models.services;

import java.util.ArrayList;
import java.util.List;

import com.app.shopandmeals.models.entity.Menus;

public interface IMenusService {
    
    public List<Menus> findMenusById(String id);
    
    //public List<Menus> createNewSetMenus();
    
    public List<Menus> createNewSetMenus(ArrayList<Integer> menus, String username);
 
}
