package com.login.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.entity.Login;
import com.login.dao.LoginDaoImpl;

@Service
@Transactional(readOnly=true)
public class LoginServiceImpl {
	@Resource
	private LoginDaoImpl loginDaoImpl;
	
	public List<Object[]>  listAll(){
		return this.loginDaoImpl.findAll();
	}
}
