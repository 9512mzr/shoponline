package com.login.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.login.dao.RegisterDaoImpl;


@Service
@Transactional(readOnly=true)
public class RegisterServiceImpl {
	@Resource
	private RegisterDaoImpl registerDaoImpl;
	
	public void save(int id,String name,String password,String email,String tel,String address,String time) {
		this.registerDaoImpl.registuser(id, name, password, email, tel, address, time);
	}
}
