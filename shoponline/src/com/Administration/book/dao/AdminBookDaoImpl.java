package com.Administration.book.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.entity.Book;
import com.entity.Orders;

@Repository
public class AdminBookDaoImpl {
	@Resource
	private SessionFactory sessionFactory;

	/*
	 * 后台订单分页查询
	 * 
	 */
	public List<Book> queryForPage(int offset, int length) {
		// 查询所有的记录数
		Query query = (Query) sessionFactory.getCurrentSession().createQuery("from Book");
		query.setFirstResult(offset);
		query.setMaxResults(length);
		return query.list();
	}

	// 查询订单记录总数
	public int getAllRowCount() {
		int count = ((Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Book").iterate()
				.next()).intValue();
		return count;
	}

	/* 删除图书 */
	public void delete(int id) {
		Query q = this.sessionFactory.getCurrentSession().createQuery("delete from Book where id = ?");
		q.setParameter(0, id);
		int ret = q.executeUpdate();
	}

	/* 根据书名搜索图书 */
	public List<Book> queryForId(int offset, int length, String name) {
		// 查询所有的记录数
		Query query = (Query) sessionFactory.getCurrentSession()
				.createQuery("from Book where book_name like '%" + name + "%'");
		query.setFirstResult(offset);
		query.setMaxResults(length);
		return query.list();
	}

	// 根据相关书名查询的记录总数
	public int getIdRowCount(String name) {
		int count = ((Long) sessionFactory.getCurrentSession()
				.createQuery("select count(*) from Book where book_name like '%" + name + "%'").iterate().next())
						.intValue();
		return count;
	}
	
	/*查询需要修改的图书信息*/
	public List<Book>selectBook(int id){
		Query query = (Query) sessionFactory.getCurrentSession()
				.createQuery("from Book where book_id = ?");
		query.setParameter(0, id);
		return query.list();
	}
	
	/* 修改图书信息 */
	public void updateBook(int id,String book_auther,String book_publish_date,String book_publisher,int book_price) {
		
		Session s=this.sessionFactory.openSession();
		Transaction t=s.beginTransaction();
		Book b = (Book) s.get(Book.class,id);
		b.setBook_auther(book_auther);
		b.setBook_publisher(book_publisher);
		b.setBook_publish_date(book_publish_date);
		b.setBook_price(book_price);
		s.update(b);
		t.commit();
		s.close();
	}
}
