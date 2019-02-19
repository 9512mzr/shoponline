package com.Administration.users.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.entity.Journal;

@Repository
public class UserJournalDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	
	/*登录日志*/
	public List<Journal> queryForPage(int offset, int length) {
		// 查询所有的记录数
		Query query = (Query) sessionFactory.getCurrentSession().createQuery("from Journal");
		query.setFirstResult(offset);
		query.setMaxResults(length);
		return query.list();
	}



	// 查询记录总数
	public int getAllRowCount() {
		int count = ((Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Journal").iterate()
				.next()).intValue();
		return count;
	}
}
