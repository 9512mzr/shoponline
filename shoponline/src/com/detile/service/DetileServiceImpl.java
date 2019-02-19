package com.detile.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.detile.dao.DetileDaoImpl;
import com.entity.Book;

@Service
@Transactional(readOnly=true)
public class DetileServiceImpl {
	@Resource
	private DetileDaoImpl detileDaoImpl;
	
	public List<Book> listAll(int id){
		return this.detileDaoImpl.findAll(id);
	}
}
