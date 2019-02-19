package com.cart.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.entity.Bookcar;
import com.entity.Users;

@Repository
public class AddressDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	
	public List<Users> Address(int id){
		Query q = this.sessionFactory.getCurrentSession().createQuery("from Users where id = ?");
		q.setParameter(0, id);
		return q.list();
	}
}
