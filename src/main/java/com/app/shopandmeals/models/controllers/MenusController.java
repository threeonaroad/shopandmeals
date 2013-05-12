package com.app.shopandmeals.models.controllers;


import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.app.shopandmeals.models.entity.Menus;
import com.app.shopandmeals.models.entity.User;
import com.app.shopandmeals.models.services.IMenusService;
import com.app.shopandmeals.models.services.IUserService;


@Controller
@RequestMapping(value = "/menus")
public class MenusController {
	
	 @Autowired
	 private IMenusService menusService;

	 @Autowired
	 private IUserService userService;
 
	
	@RequestMapping(value="/list/{id}", method = RequestMethod.GET, produces = "application/json")  
	@ResponseBody
    public List<Menus>  getLastMenus(@PathVariable String id) {
		User user = userService.findById(id);
		ArrayList<Integer> notvisitedMenus = user.getNot_visited_menus();
		List<Menus> listMenus = null;
		if(notvisitedMenus == null){
			System.out.println("Llamada GET lastMenus with username" + user.getUsername() + "and first time entering");
		}
		else{
			String lastMenu = String.valueOf(user.getLast_menus());		
			System.out.println("Llamada GET lastMenus with username" + user.getUsername() + "and lastMenus:" + lastMenu);
			listMenus = menusService.findMenusById(lastMenu);
		}
       return listMenus;
	}
	
	@RequestMapping(value="/list/{id}", method = RequestMethod.PUT)  
	@ResponseBody
    public List<Menus>  getNewMenus(@PathVariable String id) {
		User user = userService.findById(id);		
		ArrayList<Integer> notvisitedMenus = user.getNot_visited_menus();
		System.out.println("put with lastmenu");
		List<Menus> listMenus = null;
		try{
			if(notvisitedMenus == null)
				listMenus = menusService.createNewSetMenus(null,user.getUsername());
			else{
				ArrayList<Integer> NotVisitedmenus = user.getNot_visited_menus();
				listMenus = menusService.createNewSetMenus(NotVisitedmenus,user.getUsername());
			}
			
		System.out.println("Llamada PUT lastMenus with username" + user.getUsername());
		}catch(Exception e){
			System.out.println("exception" + e.getMessage());
		}
       return listMenus;
	}
	
	
	@RequestMapping(value = "/menus", method = RequestMethod.GET) 
	   public String toMenus() {
		   System.out.println("Entra en menus.htm?");
			return "menus/menus";
	     
	  }
   
   
   @ExceptionHandler
   @ResponseStatus( value=HttpStatus.NOT_ACCEPTABLE )
	public void exception( Throwable t, PrintWriter out )
	{
	   System.out.println("NA");
		out.println( "Should be a 406" );
	}
	
  
	
	
}
