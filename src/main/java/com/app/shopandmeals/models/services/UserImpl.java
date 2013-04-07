package com.app.shopandmeals.models.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.shopandmeals.models.dao.IUserDao;
import com.app.shopandmeals.models.entity.User;
import com.mongodb.WriteResult;


@Service("userService")
public class UserImpl implements IUserService {

	
	@Autowired
	private IUserDao userDao;

	@Override
	public List<User> findAll() {
		return userDao.findAll();
	}

	@Override
	public User findById(String username) {
		return userDao.findById(username);
	}

	@Override
	public User create(User user) {
		return userDao.create(user);
	}
	
	@Override
	public User userExists(User user) {
		return userDao.userExists(user);
	}

	@Override
	public void delete(User user) {
		userDao.delete(user);
		
	}

	@Override
	public WriteResult update(User User) {
		return userDao.update(User);
	}
}
