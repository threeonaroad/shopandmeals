package com.app.shopandmeals.models.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Order;
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
		
    @Override
    public List<ShopList> findAll() {
    	
    	Query query = new Query();
    	query.sort().on("date",Order.DESCENDING);
        return mongoTemplate.find(query,ShopList.class,"lists");
    }
    
    @Override
    public List<ShopList> findAll(String username) {
    	Query query = new Query(Criteria.where("users").is(username));
    	query.sort().on("date",Order.DESCENDING);
    	return mongoTemplate.find(query,ShopList.class,"lists");
    }

    @Override
    public ShopList findById(String shopListId) {
    	return mongoTemplate.findOne(new Query(Criteria.where("_id").is(shopListId)), ShopList.class,"lists");
    }
 
    @Override
    public WriteResult update(ShopList shopList ) {
    	String id = shopList.getId();
    	String description = shopList.getDescription();
    	return mongoTemplate.updateFirst
    			(new Query(Criteria.where("_id").is(id)), Update.update("description", description),"lists");
    	
    }
    
    @Override
    public ShopList create(ShopList shopList) {  	
    	mongoTemplate.insert(shopList,"lists");
    	return shopList;
    }
    


    @Override
    public void delete(ShopList shopList) {
    	String id = shopList.getId();
    	mongoTemplate.remove(new Query(Criteria.where("_id").is(id)), "lists");
    	
    }

    @Override
    public WriteResult updateItems(String id, String[] description){
    	return mongoTemplate.upsert(new Query(Criteria.where("_id").is(id)),Update.update("items", description), "lists");
    			
    }

	@Override
	public WriteResult updateListShared(String id, String username) {
		return mongoTemplate.upsert(new Query(Criteria.where("_id").is(id)),new Update().addToSet("users", username),"lists");
	}

	


	



	
}
