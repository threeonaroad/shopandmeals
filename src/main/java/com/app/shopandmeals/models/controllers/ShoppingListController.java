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

import com.app.shopandmeals.models.entity.ShopList;
import com.app.shopandmeals.models.services.IShoppingListService;


@Controller
@RequestMapping(value = "/shopping")
@SessionAttributes("shoppingList")
public class ShoppingListController {
	
	 @Autowired
	 private IShoppingListService shoppingListService;

 
	@RequestMapping(method = RequestMethod.GET, produces = "application/json") 
	@ResponseBody
    public List<ShopList> getShoppingLists() throws Exception {
      return shoppingListService.findAll();
     
 	}
	
	@RequestMapping(method = RequestMethod.POST, consumes = "application/json")  
	@ResponseStatus(HttpStatus.CREATED)
	@ResponseBody
    public ShopList create(@RequestBody ShopList shopList) {
       return shoppingListService.create(shopList);
      
   }
	
	@RequestMapping(value = "{id}", method = RequestMethod.GET, produces = "application/json") 
	@ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public ShopList getShoppingList(@PathVariable String id) {       
	   return shoppingListService.findById(id);
	}
	
   @RequestMapping(value = "{id}", method = RequestMethod.PUT) 
   @ResponseStatus(HttpStatus.OK)
   @ResponseBody
     public ShopList update(@RequestBody ShopList shopList,@PathVariable String id) {
	   
	   shoppingListService.update(shopList);	  
	   return shoppingListService.findById(id);
	   
    }
   
   @RequestMapping(value = "/items/{id}", method = RequestMethod.PUT) 
   @ResponseStatus(HttpStatus.OK)
   @ResponseBody
     public ShopList updateItems(@RequestBody ShopList shopList, @PathVariable String id) {
	   String[] description = shopList.getItems();
	   shoppingListService.updateItems(id,description);	  
	   return shoppingListService.findById(id);
	   
    }
   
   @RequestMapping(value = "{id}", method = RequestMethod.DELETE) 
   @ResponseStatus(HttpStatus.OK)
   @ResponseBody
   public List<ShopList> remove(@PathVariable String id) {
	   ShopList shopList = shoppingListService.findById(id);
	   shoppingListService.delete(shopList);
	   return shoppingListService.findAll();
   }
   
   @ExceptionHandler
   @ResponseStatus( value=HttpStatus.NOT_ACCEPTABLE )
	public void exception( Throwable t, PrintWriter out )
	{
		out.println( "Should be a 406" );
	}
	
	public class Items{
		private String id;
		private String[] items;
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String[] getItems() {
			return items;
		}
		public void setItems(String[] items) {
			this.items = items;
		}
		
	}
	
}
