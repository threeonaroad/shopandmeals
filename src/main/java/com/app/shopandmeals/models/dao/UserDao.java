package com.app.shopandmeals.models.dao;

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
		
    @SuppressWarnings("unchecked")
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
	public void delete(User user) {
		String username = user.getId();
		mongoTemplate.remove(new Query(Criteria.where("_id").is(username)), "users");
	}

	@Override
	public WriteResult update(User user) {
		 mongoTemplate.updateFirst
    			(new Query(Criteria.where("_id").is(user.getId())), Update.update("password",user.getPassword()),"users");
		 mongoTemplate.updateFirst
			(new Query(Criteria.where("_id").is(user.getId())), Update.update("name",user.getName()),"users");
		 return mongoTemplate.updateFirst
	    			(new Query(Criteria.where("_id").is(user.getId())), Update.update("email",user.getEmail()),"users");
	}


	


	



	
}
