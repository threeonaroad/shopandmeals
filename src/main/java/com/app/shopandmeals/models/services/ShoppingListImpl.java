package com.app.shopandmeals.models.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.shopandmeals.models.dao.IShoppingListDao;
import com.app.shopandmeals.models.entity.ShopList;
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
	public List<ShopList> findAll(String username) {
		return shoppingListDao.findAll(username);
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
	public ShopList create(ShopList shopList, String username) {
		return shoppingListDao.create(shopList,username);
		
	}

	@Override
	public void delete(ShopList shopList) {
		shoppingListDao.delete(shopList);
		
	}

	@Override
	public WriteResult update(ShopList shopList) {
		return shoppingListDao.update(shopList);
	}
	
	@Override
	public WriteResult updateItems(String id, String[] description) {
		return shoppingListDao.updateItems(id, description);
	}

	@Override
	public WriteResult updateListShared(String id, String username) {
		return shoppingListDao.updateListShared(id, username);
	}
	
}
