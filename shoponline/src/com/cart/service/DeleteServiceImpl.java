package com.cart.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cart.dao.DeleteDaoImpl;

@Service
public class DeleteServiceImpl {
	@Resource
	private DeleteDaoImpl deleteDaoImpl;
	
	public void delete(int id) {
		this.deleteDaoImpl.delete(id);
	}
}
