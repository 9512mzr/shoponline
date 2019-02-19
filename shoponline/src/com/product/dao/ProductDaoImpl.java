package com.product.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.Book;

@Repository
public class ProductDaoImpl {
	@Resource
	private SessionFactory sessionFactory;

	/**
	 * 分页查询
	 * 
	 * @param hql
	 *            查询的条件
	 * @param offset
	 *            开始记录
	 * @param length
	 *            一次查询几条记录
	 * @return 返回查询记录集合
	 */
	@RequestMapping("select")
	public List<Book> queryForPage(int offset, int length) {
		// 查询所有的记录数
		Query query = (Query) sessionFactory.getCurrentSession().createQuery("from Book");
		query.setFirstResult(offset);
		query.setMaxResults(length);
		return query.list();
	}

	// 查询记录总数
	public int getAllRowCount() {
		int count = ((Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Book").iterate()
				.next()).intValue();
		return count;
	}

	// 满足ID的记录总数
	public int getIdRowCount(int id) {
		Query query = (Query) sessionFactory.getCurrentSession()
				.createQuery("select count(*) from Book where book_type_id = ?");
		query.setParameter(0, id);
		int count = ((Long) query.iterate().next()).intValue();
		return count;
	}

	/* 根据id查询记录*/
	public List<Book> queryForId(int offset, int length, int id) {
		// 查询所有的记录数
		Query query = (Query) sessionFactory.getCurrentSession().createQuery("from Book where book_type_id = ?");
		query.setParameter(0, id);
		query.setFirstResult(offset);
		query.setMaxResults(length);
		return query.list();
	}

	public Book QueryById(int id) {
		Book st = (Book) sessionFactory.getCurrentSession().get(Book.class, id);
		return st;
	}
}
