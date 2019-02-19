package com.cart.dao;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

@Repository
public class DeleteDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	
	public void delete(int id) {
		Query q = this.sessionFactory.getCurrentSession().createQuery("delete from Bookcar where car_id = ?");
		q.setParameter(0, id);
		int ret = q.executeUpdate();
	}
}
