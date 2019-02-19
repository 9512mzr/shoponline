package com.cart.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cart.dao.UpdataDaoImpl;

@Service
public class UpdataServiceImpl {
	@Resource
	private UpdataDaoImpl updataDaoImpl;
	
	public void updatacount(int id,int count) {
		this.updataDaoImpl.update(id,count);
	}
}
