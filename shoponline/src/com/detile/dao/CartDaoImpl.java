package com.detile.dao;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.entity.Bookcar;

@Repository
public class CartDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	
	public void insertCart(int count,int id,String name,String img,int price,int user_id) {
		Bookcar cart = new Bookcar();
		cart.setBook_img(img);
		cart.setCar_book_id(id);
		cart.setBook_name(name);
		cart.setBook_count(count);
		cart.setBook_price(price);
		cart.setCart_user_id(user_id);
		
		Session s=this.sessionFactory.openSession();
		Transaction t=s.beginTransaction();
		s.save(cart);
		t.commit();
		s.close();
	}
}
