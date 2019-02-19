package com.Administration.users.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.Administration.users.dao.UsersDaoImpl;

import com.entity.Page;
import com.entity.Users;

@Service
public class UsersServiceImpl {
	@Resource
	private UsersDaoImpl usersDaoImpl;
	
	/* 用户分页查询*/
	public Page queryForPage(int currentPage, int pageSize) {
		Page page = new Page();
		// 总记录数
		int allRow = usersDaoImpl.getAllRowCount();
		// 当前页开始记录
		int offset = page.countOffset(currentPage, pageSize);
		// 分页查询结果集
		List<Users> list = usersDaoImpl.queryForPage(offset, pageSize);
		page.setPageNo(currentPage);
		page.setPageSize(pageSize);
		page.setTotalRecords(allRow);
		page.setUserList(list);
		return page;
	}
	
	/*删除用户*/
	public void delete(int id) {
		this.usersDaoImpl.delete(id);
	}
}
