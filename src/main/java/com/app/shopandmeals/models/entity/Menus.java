package com.app.shopandmeals.models.entity;


import org.springframework.data.mongodb.core.mapping.Document;


@Document
public class Menus  {

	
    private String id;
	
	private String breakfast;
	private String lunch;
	private String dinner;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBreakfast() {
		return breakfast;
	}
	public void setBreakfast(String breakfast) {
		this.breakfast = breakfast;
	}
	public String getLunch() {
		return lunch;
	}
	public void setLunch(String lunch) {
		this.lunch = lunch;
	}
	public String getDinner() {
		return dinner;
	}
	public void setDinner(String dinner) {
		this.dinner = dinner;
	}
	
	
}