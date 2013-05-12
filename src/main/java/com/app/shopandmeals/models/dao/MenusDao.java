package com.app.shopandmeals.models.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.app.shopandmeals.models.entity.Menus;

@Repository("menusDao")
public class MenusDao implements IMenusDao {

	@Autowired
	private MongoTemplate mongoTemplate;
	
	public void setMongoTemplate(MongoTemplate mongoTemplate) {
		this.mongoTemplate = mongoTemplate;
	}

	@Override	
	public List<Menus> findMenusById(String id) {
		List<Menus> listLastMenus = new ArrayList<Menus>();
		int idMenu = Integer.parseInt(id);
		for(int i = idMenu; i<=idMenu+6 ; i++){
			Menus menus = mongoTemplate.findOne(new Query(Criteria.where("_id").is(i)), Menus.class, "menus");
			if(menus != null){
				switch (i%7){
					case 0:menus.setId("Lunes");
					break;
					case 1:menus.setId("Martes");
					break;
					case 2:menus.setId("Miercoles");
					break;
					case 3:menus.setId("Jueves");
					break;
					case 4:menus.setId("Viernes");
					break;
					case 5:menus.setId("Sabado");
					break;
					case 6:menus.setId("Domingo");
					break;
				}
				listLastMenus.add(menus);
			}
		}			
		return listLastMenus;
	}

	@Override
	public int getTotalMenus(){
		return  (int) mongoTemplate.count(new Query(), "menus");
	}
	
}
