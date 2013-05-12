package com.app.shopandmeals.models.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import com.app.shopandmeals.models.entity.User;
import com.mongodb.WriteResult;

@Repository("userDao")
public class UserDao implements IUserDao {

	@Autowired
	private MongoTemplate mongoTemplate;
	
	public void setMongoTemplate(MongoTemplate mongoTemplate) {
		this.mongoTemplate = mongoTemplate;
	}
		
    @Override
    public List<User> findAll() {
        return mongoTemplate.findAll(User.class,"users");
    }

    @Override
    public User findById(String username) {
    	return mongoTemplate.findOne(new Query(Criteria.where("_id").is(username)), User.class,"users");
    }
	@Override
	public User create(User user) {
		user.setId(user.getUsername());
    	mongoTemplate.insert(user,"users");
    	return user;
	}
	
	@Override
	public User userExists(User user) {
		User u = mongoTemplate.findOne(new Query(Criteria.where("_id").is(user.getUsername()).andOperator(Criteria.where("password").is(user.getPassword()))), User.class, "users");
    	return u;
	}

	@Override
	public void delete(User user) {
		String username = user.getId();
		mongoTemplate.remove(new Query(Criteria.where("_id").is(username)), "users");
	}

	@Override
	public WriteResult update(User user) {
		Update updateUser = new Update();
		updateUser.set("password",user.getPassword());
		updateUser.set("name",user.getName());
		updateUser.set("email",user.getEmail());
		
		 return mongoTemplate.updateFirst
	    			(new Query(Criteria.where("_id").is(user.getId())),updateUser,"users");
	}

	
	@Override
	public WriteResult updateUserWithMenus(String username, int last_menus, ArrayList<Integer> notVisitedMenus, int newMenuVisited) {
		Update updateUser = new Update();
		updateUser.addToSet("menus", newMenuVisited);
		updateUser.set("last_menus",last_menus);
		updateUser.set("not_visited_menus", notVisitedMenus);
		
		
		 return mongoTemplate.updateFirst
	    			(new Query(Criteria.where("_id").is(username)), updateUser,"users");
	}
	
}
