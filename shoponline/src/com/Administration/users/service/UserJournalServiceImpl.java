package com.Administration.users.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.Administration.users.dao.UserJournalDaoImpl;
import com.entity.Journal;
import com.entity.Page;

@Service
public class UserJournalServiceImpl {
	@Resource
	private UserJournalDaoImpl userJournalDaoImpl;
	
	/*登录日志*/
	public Page queryForPage(int currentPage, int pageSize) {
		Page page = new Page();
		// 总记录数
		int allRow = userJournalDaoImpl.getAllRowCount();
		// 当前页开始记录
		int offset = page.countOffset(currentPage, pageSize);
		// 分页查询结果集
		List<Journal> list = userJournalDaoImpl.queryForPage(offset, pageSize);
		page.setPageNo(currentPage);
		page.setPageSize(pageSize);
		page.setTotalRecords(allRow);
		page.setJournallist(list);
		return page;
	}
}
