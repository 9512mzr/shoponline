package com.Administration.users.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Administration.users.service.UserJournalServiceImpl;
import com.entity.Page;

@Controller
@RequestMapping("journal")
public class UserJournalControllerImpl {
	@Resource
	@Autowired
	private UserJournalServiceImpl userJournalServiceImpl;
	
	public UserJournalControllerImpl() {}
	protected final transient Log log = LogFactory.getLog(UserJournalControllerImpl.class);
	
	/*登录日志*/
	@RequestMapping(value = "list")
	// 找到所有的记录并实现了分页
	public String findAll(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
		String pageNo = request.getParameter("pageNo");
		if (pageNo == null) {
			pageNo = "1";
		}
		Page page = userJournalServiceImpl.queryForPage(Integer.valueOf(pageNo), 5);
		request.setAttribute("page", page);
		modelMap.put("methodname", "list");
		return "Administration/user";
	}
}
