package com.cart.service;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cart.dao.CarDaoImpl;
import com.entity.Bookcar;

@Service
@Transactional(readOnly=true)
public class CarServiceImpl {
	@Resource
	private CarDaoImpl carDaoImpl;
	
	public List<Bookcar> cartAll(int id){
		return this.carDaoImpl.carAll(id);
	}
}
