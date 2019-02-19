package com.login.dao;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.entity.Login;
import com.entity.Users;

@Repository
public class RegisterDaoImpl {
	@Resource
	private SessionFactory sessionFactory;
	
	public void registuser(int id,String name,String password,String email,String tel,String address,String time) {
		Users user = new Users();
		user.setId(id);
		user.setUser_name(name);
		user.setUser_email(email);
		user.setUser_telephone(tel);
		user.setUser_address(address);
		user.setUser_posttime(time);
		
		Login login = new Login();
		login.setUser_password(password);
		
		user.setLogin(login);
		login.setUsers(user);
		Session s=this.sessionFactory.openSession();
		Transaction t=s.beginTransaction();
		s.save(user);
		t.commit();
		s.close();
	}
}
