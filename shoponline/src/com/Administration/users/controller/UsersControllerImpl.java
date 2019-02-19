package com.Administration.users.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Administration.users.service.UsersServiceImpl;
import com.entity.Bookcar;
import com.entity.Page;

@Controller
@RequestMapping("users")
public class UsersControllerImpl {
	@Resource
	@Autowired
	private UsersServiceImpl usersServiceImpl;
	
	public UsersControllerImpl(){}
	protected final transient Log log = LogFactory.getLog(UsersControllerImpl.class);
	
	@RequestMapping(value = "list")
	// 找到所有的记录并实现了分页
	public String findAll(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
		String pageNo = request.getParameter("pageNo");
		if (pageNo == null) {
			pageNo = "1";
		}
		Page page = usersServiceImpl.queryForPage(Integer.valueOf(pageNo), 5);
		request.setAttribute("page", page);
		modelMap.put("methodname", "list");
		return "Administration/tab";
	}
	/*删除用户*/
	@RequestMapping(value = "delete")
	private String delete(HttpServletRequest request, Model model) {
		String userid = request.getParameter("id");
		int id = Integer.parseInt(userid);
		this.usersServiceImpl.delete(id);
		String pageNo = request.getParameter("pageNo");
		if (pageNo == null) {
			pageNo = "1";
		}
		Page page = usersServiceImpl.queryForPage(Integer.valueOf(pageNo), 5);
		request.setAttribute("page", page);
		return "Administration/tab";
	}
}
