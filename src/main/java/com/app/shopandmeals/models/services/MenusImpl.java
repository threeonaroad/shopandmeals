package com.app.shopandmeals.models.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.shopandmeals.models.dao.IMenusDao;
import com.app.shopandmeals.models.dao.IUserDao;
import com.app.shopandmeals.models.entity.Menus;


@Service("menusService")
public class MenusImpl implements IMenusService {

	
	@Autowired
	private IMenusDao menusDao;
	
	@Autowired
	private IUserDao userDao;


	@Override
	public List<Menus> findMenusById(String id) {
		return menusDao.findMenusById(id);
	}
	
	@Override
	public List<Menus> createNewSetMenus(ArrayList<Integer> menus, String username) {
		menus = getNotVisitedMenus(menus);
		if(menus != null && menus.size() > 0){
			if(menus.size()-1 == 0){
				System.out.println("No more new menus, restarting it");
				menus = getNotVisitedMenus(null);
			}
			int indexSelected = getRandomMenu(menus.size()-1);
			int selectedMenu = menus.get(indexSelected);
			
			List<Menus> menusReturned = menusDao.findMenusById(String.valueOf(selectedMenu));
			
			menus.remove(indexSelected);
			//Update user
			updateUser(menus,selectedMenu,username);		
			
			return menusReturned;
		}
		else 
			return null;
	}

	private void updateUser(ArrayList<Integer> menus, int selectedMenu, String username){
		userDao.updateUserWithMenus(username, selectedMenu, menus, selectedMenu);
		
	}
	
	
	public ArrayList<Integer> getNotVisitedMenus(ArrayList<Integer> notVisitedMenus){
		int total = menusDao.getTotalMenus();
		if(total == 0){
			System.out.println("No menus available");
			return null;
		}
		
		if(notVisitedMenus != null && notVisitedMenus.size() > 0){
			int finalIndex = notVisitedMenus.get(notVisitedMenus.size()-1);
			System.out.println("final index" + finalIndex);
			if(finalIndex < total){
				System.out.println("we need to update notVisited as new menus have appeared");

					System.out.println("more than one: "+ (total-finalIndex)/7);
					for(int i=0;i<((total-finalIndex)/7);i++)
						notVisitedMenus.add(notVisitedMenus.get(notVisitedMenus.size()-1)+7);
					
			}
			else
				System.out.println("notvisitedMenus is updated");
		}
		else{
			//First time user coming
			System.out.println("First time user asking for menus");
			notVisitedMenus = new ArrayList<Integer>();
			for(int i=0; i<=total; i=i+7){
				notVisitedMenus.add(i);
			}
		}
		return notVisitedMenus;

	}
	
	public int getRandomMenu(int total){
		int Low = 0;
		if(total == 0)
			return total;
		Random r = new Random();
		int R = r.nextInt(total-Low) + Low;
		return R;
	}

}
