package com.Administration.orders.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.entity.Orders;

@Repository
public class UserOrdersDaoImpl {
	@Resource
	private SessionFactory sessionFactory;

	/*
	 * 后台订单分页查询
	 * 
	 */
	public List<Orders> queryForPage(int offset, int length) {
		// 查询所有的记录数
		Query query = (Query) sessionFactory.getCurrentSession().createQuery("from Orders");
		query.setFirstResult(offset);
		query.setMaxResults(length);
		return query.list();
	}

	// 查询订单记录总数
	public int getAllRowCount() {
		int count = ((Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Orders").iterate()
				.next()).intValue();
		return count;
	}

	/*
	 * 根据用户ID搜索订单
	 */

	public List<Orders> queryForId(int offset, int length, int id) {
		// 查询所有的记录数
		Query query = (Query) sessionFactory.getCurrentSession().createQuery("from Orders where order_user_id = ?");
		query.setParameter(0, id);
		query.setFirstResult(offset);
		query.setMaxResults(length);
		return query.list();
	}

	// 根据用户ID查询的记录总数
	public int getIdRowCount(int id) {
		String userid = String.valueOf(id);
		int count = ((Long) sessionFactory.getCurrentSession()
				.createQuery("select count(*) from Orders where order_user_id =" + userid).iterate().next()).intValue();
		return count;
	}
	
	/*删除订单分页查询*/
	
	public List<Orders> queryForDelete(int offset, int length) {
		// 查询所有的记录数
		Query query = (Query) sessionFactory.getCurrentSession().createQuery("from Orders where orderdelete = " + "'yesdelete'");
		query.setFirstResult(offset);
		query.setMaxResults(length);
		return query.list();
	}

	public int getDeleteRowCount() {
		String name = "yesdelete";
		int count = ((Long) sessionFactory.getCurrentSession()
				.createQuery("select count(*) from Orders where orderdelete = " + "'yesdelete'").iterate().next()).intValue();
		return count;
	}
}
