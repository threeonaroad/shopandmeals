package com.app.shopandmeals.models.entity;


import java.util.ArrayList;

import org.springframework.data.mongodb.core.mapping.Document;


@Document
public class User  {

	
    private String id;
	
	private String name;
	private String surname;
	private String email;
	private String password;
	private String language;
	private String username;
	private int[] menus;
	private int last_menus;
	private int[] favourite_menus;
	private ArrayList<Integer> not_visited_menus;
	
	
	public int getLast_menus() {
		return last_menus;
	}

	public void setLast_menus(int last_menus) {
		this.last_menus = last_menus;
	}	

	public int[] getMenus() {
		return menus;
	}

	public void setMenus(int[] menus) {
		this.menus = menus;
	}

	public int[] getFavourite_menus() {
		return favourite_menus;
	}

	public void setFavourite_menus(int[] favourite_menus) {
		this.favourite_menus = favourite_menus;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public ArrayList<Integer> getNot_visited_menus() {
		return not_visited_menus;
	}

	public void setNot_visited_menus(ArrayList<Integer> not_visited_menus) {
		this.not_visited_menus = not_visited_menus;
	}
	
	
}