package com.cart.dao;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.entity.Bookcar;

@Repository
public class CarDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	
	public List<Bookcar> carAll(int id){
		Query q = this.sessionFactory.getCurrentSession().createQuery("from Bookcar where cart_user_id = ?");
		q.setParameter(0, id);
		return q.list();
	}
}
