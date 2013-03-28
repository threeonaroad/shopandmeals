package com.app.shopandmeals.models.controllers;


import java.io.PrintWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.app.shopandmeals.models.entity.User;
import com.app.shopandmeals.models.services.IUserService;


@Controller
@RequestMapping(value = "/users")
@SessionAttributes("users")
public class UserController {
	
	 @Autowired
	 private IUserService userService;

 
	@RequestMapping(method = RequestMethod.GET, produces = "application/json") 
	@ResponseBody
    public List<User> getUsers() throws Exception {
      return userService.findAll();
     
 	}
	
	@RequestMapping(method = RequestMethod.POST, consumes = "application/json")  
	@ResponseStatus(HttpStatus.CREATED)
	@ResponseBody
    public User create(@RequestBody User user) {
       return userService.create(user);
      
   }
	
	@RequestMapping(value = "{id}", method = RequestMethod.GET, produces = "application/json") 
	@ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public User getShoppingList(@PathVariable String username) {       
	   return userService.findById(username);
	}
	
   @RequestMapping(value = "{id}", method = RequestMethod.PUT) 
   @ResponseStatus(HttpStatus.OK)
   @ResponseBody
     public User update(@RequestBody User user,@PathVariable String username) {
	   
	   userService.update(user);	  
	   return user;
	   
    }
   
   @RequestMapping(value = "{id}", method = RequestMethod.DELETE) 
   @ResponseStatus(HttpStatus.OK)
   @ResponseBody
   public List<User> remove(@PathVariable String username) {
	   User user = userService.findById(username);
	   userService.delete(user);
	   return userService.findAll();
	   
   }
   
   @ExceptionHandler
   @ResponseStatus( value=HttpStatus.NOT_ACCEPTABLE )
	public void exception( Throwable t, PrintWriter out )
	{
		out.println( "Should be a 406" );
	}
	
	
	
}
