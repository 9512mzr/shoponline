package com.Administration.users.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.Users;


@Repository
public class UsersDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	
	/*
	 * 后台用户分页查询
	 * 
	 * */
	public List<Users> queryForPage(int offset, int length) {
		// 查询所有的记录数
		Query query = (Query) sessionFactory.getCurrentSession().createQuery("from Users");
		query.setFirstResult(offset);
		query.setMaxResults(length);
		return query.list();
	}



	// 查询记录总数
	public int getAllRowCount() {
		int count = ((Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Users").iterate()
				.next()).intValue();
		return count;
	}
	
	/* 删除用户*/
	public void delete(int id) {
		Query q = this.sessionFactory.getCurrentSession().createQuery("delete from Users where id = ?");
		q.setParameter(0, id);
		int ret = q.executeUpdate();
	}
}
