package com.Administration.book.dao;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.entity.Book;
import com.entity.Booktype;

@Repository
public class AddBookDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	
	public void addBook(int id,String name,String auther,String publish,String date,int price,String type) {
		Book book = new Book();
		book.setBook_id(id);
		book.setBook_name(name);
		book.setBook_auther(auther);
		book.setBook_publisher(publish);
		book.setBook_publish_date(date);
		book.setBook_price(price);
		
		Booktype booktype = new Booktype();
		booktype.setType_name(type);
		
		Session s=this.sessionFactory.openSession();
		Transaction t=s.beginTransaction();
		s.save(book);
		t.commit();
		s.close();
	}
}
