package com.app.shopandmeals.models.dao;

import java.util.Date;
import java.util.List;
import java.util.Random;

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
    	//System.out.println("buscando listas de usuario:" + username);
    	Query query = new Query(Criteria.where("users").is(username));
    	//System.out.println("query:"+ query);
    	query.sort().on("date",Order.DESCENDING);
    	//System.out.println(mongoTemplate.find(query,ShopList.class,"lists"));
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
    	//System.out.println("id:" + id + " desc:" + description);
    	return mongoTemplate.updateFirst
    			(new Query(Criteria.where("_id").is(id)), Update.update("description", description),"lists");
    	
    }
    
    @Override
    public ShopList create(ShopList shopList, String username) {
    	Random ran = new Random();
    	if(username!= null){
    		String[] users = new String[]{username};
    		shopList.setUsers(users);
    	}
    	shopList.setId(String.valueOf(ran.nextInt(Integer.MAX_VALUE) + 0));
    	shopList.setDate(new Date());
    	
    	mongoTemplate.insert(shopList,"lists");
    	return shopList;
    }
    
    @Override
    public ShopList create(ShopList shopList) {
    	return create(shopList, null);
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

	


	



	
}
