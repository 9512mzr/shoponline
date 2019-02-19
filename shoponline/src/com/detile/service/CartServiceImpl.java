package com.detile.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.detile.dao.CartDaoImpl;


@Service
@Transactional(readOnly=true)
public class CartServiceImpl {

	@Resource
	private CartDaoImpl cartDaoImpl;
	
	public void insertCart(int count,int id,String name,String img,int price,int user_id) {
		this.cartDaoImpl.insertCart(count,id,name,img,price,user_id);
	}
}
