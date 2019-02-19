package com.cart.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.entity.Bookcar;
import com.entity.Orders;

@Repository
public class OrdersDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	
	public void orders(String userName,String userTelephone,String bookMassage,String userAddress,int sumPrice,int orderUserId,String time){
		Orders orders = new Orders();
		orders.setUser_name(userName);
		orders.setUser_telephone(userTelephone);
		orders.setBook_massage(bookMassage);
		orders.setUser_address(userAddress);
		orders.setSum_price(sumPrice);
		orders.setOrder_user_id(orderUserId);
		orders.setOrder_time(time);
		orders.setOrderdelete("no");
		Session s=this.sessionFactory.openSession();
		Transaction t=s.beginTransaction();
		s.save(orders);
		t.commit();
		s.close();
	}
}
