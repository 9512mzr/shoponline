package com.cart.dao;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

@Repository
public class UpdataDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	
	public void update(int id,int count) {
		Query q = this.sessionFactory.getCurrentSession().createQuery("update Bookcar set book_count = ? where car_id = ?");
		q.setParameter(0, count);
		q.setParameter(1, id);
		int ret = q.executeUpdate();
	}
}
