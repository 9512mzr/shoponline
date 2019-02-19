package com.cart.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cart.dao.AddressDaoImpl;
import com.entity.Users;

@Service
public class AddressServiceImpl {
	@Resource
	private AddressDaoImpl addressDaoImpl;
	
	public List<Users> Address(int id){
		return this.addressDaoImpl.Address(id);
	}
}
