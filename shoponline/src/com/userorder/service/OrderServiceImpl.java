package com.userorder.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.entity.Orders;
import com.entity.Page;
import com.userorder.dao.OrderDaoImpl;

@Service
public class OrderServiceImpl {
	@Resource
	private OrderDaoImpl orderDaoImpl;
	
	/* ID分页查询*/
	public Page queryForId(int currentPage, int pageSize,int id) {
		Page page = new Page();
		// 总记录数
		int allRow = orderDaoImpl.getIdRowCount(id);
		// 当前页开始记录
		int offset = page.countOffset(currentPage, pageSize);
		// 分页查询结果集
		List<Orders> list = orderDaoImpl.queryForId(offset, pageSize,id);
		page.setPageNo(currentPage);
		page.setPageSize(pageSize);
		page.setTotalRecords(allRow);
		page.setOrderList(list);
		return page;
	}
	
	/*删除订单*/
	public void delete(int id) {
		this.orderDaoImpl.deleteorder(id);
	}
	
	/*取消订单*/
	public void clear(int id) {
		this.orderDaoImpl.clearorder(id);
	}
}
