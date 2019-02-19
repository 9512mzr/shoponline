package com.Administration.login.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.entity.Login;

@Repository
public class AdministrationLoginDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	
	public List<Object[]> findAll(){
		Query q=this.sessionFactory.getCurrentSession().createSQLQuery("select admin_id,admin_password from Admin");
		List<Object[]> list = q.list();
		return list;
	}
}