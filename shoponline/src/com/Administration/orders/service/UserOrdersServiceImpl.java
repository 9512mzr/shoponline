package com.Administration.orders.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.Administration.orders.dao.UserOrdersDaoImpl;
import com.entity.Orders;
import com.entity.Page;

@Service
public class UserOrdersServiceImpl {
	@Resource
	private UserOrdersDaoImpl userOrdersDaoImpl;
	
	/* 订单分页查询*/
	public Page queryForPage(int currentPage, int pageSize) {
		Page page = new Page();
		// 总记录数
		int allRow = userOrdersDaoImpl.getAllRowCount();
		// 当前页开始记录
		int offset = page.countOffset(currentPage, pageSize);
		// 分页查询结果集
		List<Orders> list = userOrdersDaoImpl.queryForPage(offset, pageSize);
		page.setPageNo(currentPage);
		page.setPageSize(pageSize);
		page.setTotalRecords(allRow);
		page.setOrderList(list);
		return page;
	}
	/* ID分页查询*/
	public Page queryForId(int currentPage, int pageSize,int id) {
		Page page = new Page();
		// 总记录数
		int allRow = userOrdersDaoImpl.getIdRowCount(id);
		// 当前页开始记录
		int offset = page.countOffset(currentPage, pageSize);
		// 分页查询结果集
		List<Orders> list = userOrdersDaoImpl.queryForId(offset, pageSize,id);
		page.setPageNo(currentPage);
		page.setPageSize(pageSize);
		page.setTotalRecords(allRow);
		page.setOrderList(list);
		return page;
	}
	
	/*删除订单分页查询*/
	public Page queryForDelet(int currentPage, int pageSize) {
		Page page = new Page();
		// 总记录数
		int allRow = userOrdersDaoImpl.getDeleteRowCount();
		// 当前页开始记录
		int offset = page.countOffset(currentPage, pageSize);
		// 分页查询结果集
		List<Orders> list = userOrdersDaoImpl.queryForDelete(offset, pageSize);
		page.setPageNo(currentPage);
		page.setPageSize(pageSize);
		page.setTotalRecords(allRow);
		page.setOrderList(list);
		return page;
	}
}
