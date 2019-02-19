package com.login.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.entity.Journal;

@Repository
public class JournalDaoImpl  {
	@Resource
	private SessionFactory sessionFactory;
	
	public void insertJournal(int id,String name,String time) {
		Journal nal = new Journal();
		nal.setId(id);
		nal.setName(name);
		nal.setLogin_time(time);
		Session s=this.sessionFactory.openSession();
		Transaction t=s.beginTransaction();
		s.save(nal);
		t.commit();
		s.close();
	}
	public List<String> usrName(int id) {
		Query q = this.sessionFactory.getCurrentSession().createSQLQuery("select user_name from Users where id = ?");
		q.setParameter(0, id);
		return q.list();
	}
}
