package com.product.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.entity.Book;
import com.entity.Page;
import com.product.dao.ProductDaoImpl;

@Service
@Transactional(readOnly = true)
public class ProductServiceImpl {
	@Resource
	private ProductDaoImpl productDaoImpl;

	/**
	 * 分页查询
	 * 
	 * @param currentPage
	 *            当前页号：现在显示的页数
	 * @param pageSize
	 *            每页显示的记录条数
	 * @return 封闭了分页信息(包括记录集list)的Bean
	 */
	public Page queryForPage(int currentPage, int pageSize) {
		Page page = new Page();
		// 总记录数
		int allRow = productDaoImpl.getAllRowCount();
		// 当前页开始记录
		int offset = page.countOffset(currentPage, pageSize);
		// 分页查询结果集
		List<Book> list = productDaoImpl.queryForPage(offset, pageSize);
		page.setPageNo(currentPage);
		page.setPageSize(pageSize);
		page.setTotalRecords(allRow);
		page.setList(list);
		return page;
	}
	
	//根据图书类型查询
	public Page queryForId(int currentPage, int pageSize,int id) {
		Page page = new Page();
		// 总记录数
		int allRow = productDaoImpl.getIdRowCount(id);
		// 当前页开始记录
		int offset = page.countOffset(currentPage, pageSize);
		// 分页查询结果集
		List<Book> list = productDaoImpl.queryForId(offset, pageSize,id);
		page.setPageNo(currentPage);
		page.setPageSize(pageSize);
		page.setTotalRecords(allRow);
		page.setList(list);
		return page;
	}

	public int ServicegetCount() {
		return productDaoImpl.getAllRowCount();
	}

	public Book QueryById(int id) {
		return productDaoImpl.QueryById(id);
	}

}
