package com.cart.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cart.dao.OrdersDaoImpl;

@Service
public class OrdersServiceImpl {
	@Resource
	private OrdersDaoImpl ordersDaoImpl;
	
	public void orders(String userName,String userTelephone,String bookMassage,String userAddress,int sumPrice,int orderUserId,String time) {
		this.ordersDaoImpl.orders(userName, userTelephone, bookMassage, userAddress, sumPrice, orderUserId, time);
	}
}
