package com.Administration.book.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.Administration.book.dao.AdminBookDaoImpl;
import com.entity.Book;
import com.entity.Orders;
import com.entity.Page;

@Service
public class AdminBookServiceImpl {
	@Resource
	private AdminBookDaoImpl adminBookDaoImpl;
	
	/* 后台图书分页查询*/
	public Page queryForPage(int currentPage, int pageSize) {
		Page page = new Page();
		// 总记录数
		int allRow = adminBookDaoImpl.getAllRowCount();
		// 当前页开始记录
		int offset = page.countOffset(currentPage, pageSize);
		// 分页查询结果集
		List<Book> list = adminBookDaoImpl.queryForPage(offset, pageSize);
		page.setPageNo(currentPage);
		page.setPageSize(pageSize);
		page.setTotalRecords(allRow);
		page.setList(list);
		return page;
	}
	
	/*删除图书*/
	public void delete(int id) {
		this.adminBookDaoImpl.delete(id);
	}
	
	/* 书名分页查询*/
	public Page queryForId(int currentPage, int pageSize,String name) {
		Page page = new Page();
		// 总记录数
		int allRow = adminBookDaoImpl.getIdRowCount(name);
		// 当前页开始记录
		int offset = page.countOffset(currentPage, pageSize);
		// 分页查询结果集
		List<Book> list = adminBookDaoImpl.queryForId(offset, pageSize,name);
		page.setPageNo(currentPage);
		page.setPageSize(pageSize);
		page.setTotalRecords(allRow);
		page.setList(list);
		return page;
	}
	
	/*查询需要修改的图书信息*/
	public List<Book> selectBook(int id){
		return this.adminBookDaoImpl.selectBook(id);
	}
	
	/* 修改图书信息 */
	public void updatebook(int id,String book_auther,String book_publish_date,String book_publisher,int book_price) {
		this.adminBookDaoImpl.updateBook(id, book_auther, book_publish_date, book_publisher, book_price);
	}
}
