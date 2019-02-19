package com.detile.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.entity.Book;

@Repository
public class DetileDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	
	public List<Book> findAll(int id){
		Query q = this.sessionFactory.getCurrentSession().createQuery("from Book where book_img_id = ?");
		q.setParameter(0, id);
		return q.list();
	}
}
