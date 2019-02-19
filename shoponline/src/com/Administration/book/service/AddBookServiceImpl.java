package com.Administration.book.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.Administration.book.dao.AddBookDaoImpl;


@Service
public class AddBookServiceImpl {
	@Resource
	private AddBookDaoImpl addBookDaoImpl;
	
	public void addBook(int id,String name,String auther,String publish,String date,int price,String type) {
		this.addBookDaoImpl.addBook(id, name, auther, publish, date, price, type);
	}
}
