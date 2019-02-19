package com.Administration.login.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Administration.login.dao.AdministrationLoginDaoImpl;

@Service
@Transactional(readOnly=true)
public class AdministrationLoginServiceImpl {
	@Resource
	private AdministrationLoginDaoImpl administrationloginDaoImpl;
	
	public List<Object[]>  listAll(){
		return this.administrationloginDaoImpl.findAll();
	}
}
