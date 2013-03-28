package com.app.shopandmeals.models.dao;

import java.util.List;
import java.util.Random;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.config.MongoNamespaceHandler;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import com.app.shopandmeals.models.entity.ShopList;
import com.mongodb.WriteResult;

@Repository("shoppingListDao")
public class ShoppingListDao implements IShoppingListDao {

	@Autowired
	private MongoTemplate mongoTemplate;
	
	public void setMongoTemplate(MongoTemplate mongoTemplate) {
		this.mongoTemplate = mongoTemplate;
	}
		
    @SuppressWarnings("unchecked")
	@Override
    public List<ShopList> findAll() {
        return mongoTemplate.findAll(ShopList.class,"lists");
    }

    @Override
    public ShopList findById(String shopListId) {
    	return mongoTemplate.findOne(new Query(Criteria.where("_id").is(shopListId)), ShopList.class,"lists");
    }
 
    @Override
    public WriteResult update(ShopList shopList ) {
    	String id = shopList.getId();
    	String description = shopList.getDescription();
    	System.out.println("id:" + id + " desc:" + description);
    	return mongoTemplate.updateFirst
    			(new Query(Criteria.where("_id").is(id)), Update.update("description", description),"lists");
    	
    }
    
    @Override
    public void create(ShopList shopList) {
    	Random r = new  Random();
    	shopList.setId(String.valueOf(r.nextInt()));
    	mongoTemplate.insert(shopList,"lists");
    }

    @Override
    public void delete(ShopList shopList) {
    	String id = shopList.getId();
    	mongoTemplate.remove(new Query(Criteria.where("_id").is(id)), "lists");
    	
    }


	


	



	
}
