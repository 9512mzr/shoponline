package com.product.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.entity.Book;
import com.entity.Page;
import com.product.dao.FindDaoImpl;

@Service
@Transactional(readOnly=true)
public class FindServiceImpl {
	@Resource
	private FindDaoImpl findDaoImpl;
	
	/* 书名分页查询*/
	public Page queryForId(int currentPage, int pageSize,String name) {
		Page page = new Page();
		// 总记录数
		int allRow = findDaoImpl.getIdRowCount(name);
		// 当前页开始记录
		int offset = page.countOffset(currentPage, pageSize);
		// 分页查询结果集
		List<Book> list = findDaoImpl.queryForId(offset, pageSize,name);
		page.setPageNo(currentPage);
		page.setPageSize(pageSize);
		page.setTotalRecords(allRow);
		page.setList(list);
		return page;
	}
	
	//按价格条件查找
	public List<Book> listPrice(int price){
		return this.findDaoImpl.findPrice(price);
	}
	
	//查询图书价格
	public List<Book> Price(){
		return this.findDaoImpl.price();
	}
}
