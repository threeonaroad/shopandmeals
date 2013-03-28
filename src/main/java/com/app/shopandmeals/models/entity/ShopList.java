package com.app.shopandmeals.models.entity;


import javax.persistence.Id;

import org.springframework.data.mongodb.core.mapping.Document;


@Document
public class ShopList  {

	/**
	 * 
	 */

	@Id
    private String id;
	
	private String description;
	
	private String [] items;
	
	private String [] users;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String[] getItems() {
		return items;
	}

	public void setItems(String[] items) {
		this.items = items;
	}

	public String[] getUsers() {
		return users;
	}

	public void setUsers(String[] users) {
		this.users = users;
	}
	
	
	
}