package com.product.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.entity.Book;

@Repository
public class FindDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	
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
	
	//按价格条件查找
	public List<Book> findPrice(int price){
		Query q = this.sessionFactory.getCurrentSession().createQuery("from Book where book_price = ?");
		q.setParameter(0, price);
		return q.list();
	}
	
	//查询图书价格
	public List<Book> price() {
		Query q = this.sessionFactory.getCurrentSession().createQuery("select book_price from Book");
		return q.list();
	} 
}
