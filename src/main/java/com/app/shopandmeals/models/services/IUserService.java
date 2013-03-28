/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.app.shopandmeals.models.services;

import java.util.List;

import com.app.shopandmeals.models.entity.User;
import com.mongodb.WriteResult;

public interface IUserService {

    public List<User> findAll();

    public User findById(String username);
    
    public User create(User user);

    public void delete(User user);

	public WriteResult update(User User);
}
