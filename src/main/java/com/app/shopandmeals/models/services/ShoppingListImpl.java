package com.app.shopandmeals.models.services;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.app.shopandmeals.models.dao.IShoppingListDao;
import com.app.shopandmeals.models.entity.ShopList;
import com.app.shopandmeals.models.entity.ShoppingList;
import com.mongodb.WriteResult;


@Service("shoppingListService")
public class ShoppingListImpl implements IShoppingListService {

	
	@Autowired
	private IShoppingListDao shoppingListDao;

	@Override
	public List<ShopList> findAll() {
		return shoppingListDao.findAll();
	}

	@Override
	public ShopList findById(String shopListId) {
		return shoppingListDao.findById(shopListId);
	}

	@Override
	public ShopList create(ShopList shopList) {
		return shoppingListDao.create(shopList);
		
	}

	@Override
	public void delete(ShopList shopList) {
		shoppingListDao.delete(shopList);
		
	}

	@Override
	public WriteResult update(ShopList shopList) {
		return shoppingListDao.update(shopList);
	}
	
	;
}
