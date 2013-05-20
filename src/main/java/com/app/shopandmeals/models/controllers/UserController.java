package com.app.shopandmeals.models.controllers;


import java.io.PrintWriter;
import java.util.List;

import org.apache.log4j.Logger;
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

import com.app.shopandmeals.models.entity.User;
import com.app.shopandmeals.models.services.IUserService;


@Controller
@RequestMapping(value = "/users")
public class UserController {
	
	 @Autowired
	 private IUserService userService;

	 static Logger logger = Logger.getLogger(UserController.class.getName());
 
	@RequestMapping(value="/users/list", method = RequestMethod.GET, produces = "application/json") 
	@ResponseBody
    public List<User> getUsers() throws Exception {
      return userService.findAll();
     
 	}
	
	@RequestMapping(value="/users/list",method = RequestMethod.POST, consumes = "application/json")  
	@ResponseStatus(HttpStatus.CREATED)
	@ResponseBody
    public User create(@RequestBody User user) {
		if (userService.findById(user.getUsername()) == null)
			return userService.create(user);
		else
			return null;
      
   }
	
	@RequestMapping(value="/users/login",method = RequestMethod.POST, consumes = "application/json")    
	@ResponseStatus(HttpStatus.OK)
	@ResponseBody
    public User existUser(@RequestBody User user) {
		User u = userService.userExists(user);
		if(u == null)
			logger.info("No user");
			//System.out.println("No user");
       return u;
      
   }
	
	@RequestMapping(value = "/users/list/{id}", method = RequestMethod.GET, produces = "application/json") 
	@ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public User getUserList(@PathVariable String id) {  
	   return userService.findById(id);
	}
	
   @RequestMapping(value="/users/list/{id}", method = RequestMethod.PUT) 
   @ResponseStatus(HttpStatus.OK)
   @ResponseBody
     public User update(@RequestBody User user,@PathVariable String id) {
	   userService.update(user);	  
	   return user;
	   
    }
   
   @RequestMapping(value="/users/list/{id}", method = RequestMethod.DELETE) 
   @ResponseStatus(HttpStatus.OK)
   @ResponseBody
   public List<User> remove(@PathVariable String id) {
	   User user = userService.findById(id);
	   userService.delete(user);
	   return userService.findAll();
	   
   }
   @RequestMapping(value = "/user", method = RequestMethod.GET) 
   public String toUser() {
		return "users/user";
     
  }
   

   
   
   @ExceptionHandler
   @ResponseStatus( value=HttpStatus.NOT_ACCEPTABLE )
	public void exception( Throwable t, PrintWriter out )
	{
	   logger.error( "Should be a 406" );
	}
	
  
	
	
}
