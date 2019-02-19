package com.userorder.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.entity.Orders;

@Repository
public class OrderDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	
	/*用户查看订单*/
	public List<Orders> queryForId(int offset, int length, int id) {
		// 查询所有的记录数
		Query query = (Query) sessionFactory.getCurrentSession().createQuery("from Orders where order_user_id = ? and orderdelete = ?");
		query.setParameter(0, id);
		String n = "no";
		query.setParameter(1, n);
		query.setFirstResult(offset);
		query.setMaxResults(length);
		return query.list();
	}

	// 根据用户ID查询的记录总数
	public int getIdRowCount(int id) {
		String userid = String.valueOf(id);
		int count = ((Long) sessionFactory.getCurrentSession()
				.createQuery("select count(*) from Orders where order_user_id =" + userid +"and orderdelete = 'no'").iterate().next()).intValue();
		return count;
	}
	
	/*删除订单*/
	
	public void deleteorder(int id) {
		Query q = this.sessionFactory.getCurrentSession().createQuery("update Orders set orderdelete = ? where order_id = ?");
		q.setParameter(0, "yesdelete");
		q.setParameter(1, id);
		int ret = q.executeUpdate();
	}
	
	/*取消订单*/
	public void clearorder(int id) {
		Query q = this.sessionFactory.getCurrentSession().createQuery("delete Orders where order_id = ?");
		q.setParameter(0, id);
		int ret = q.executeUpdate();
	}
}
