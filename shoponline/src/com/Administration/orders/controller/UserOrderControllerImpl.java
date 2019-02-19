package com.Administration.orders.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Administration.orders.service.UserOrdersServiceImpl;
import com.Administration.users.controller.UsersControllerImpl;
import com.entity.Page;

@Controller
@RequestMapping("userorders")
public class UserOrderControllerImpl {
	@Resource
	@Autowired
	private UserOrdersServiceImpl userOrdersServiceImpl;

	public UserOrderControllerImpl() {}

	protected final transient Log log = LogFactory.getLog(UserOrderControllerImpl.class);

	/* 订单分页查询 */
	@RequestMapping(value = "list")
	public String findAll(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
		String pageNo = request.getParameter("pageNo");
		if (pageNo == null) {
			pageNo = "1";
		}
		Page page = userOrdersServiceImpl.queryForPage(Integer.valueOf(pageNo), 5);
		request.setAttribute("page", page);
		modelMap.put("methodname", "list");
		return "Administration/main";
	}

	/* ID分页查询 */
	@RequestMapping(value = "idlist")
	public String findId(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
		String pageNo = request.getParameter("pageNo");
		String userid = request.getParameter("id");
		if (userid == null || userid.equals("")) {
			if (pageNo == null) {
				pageNo = "1";
			}
			Page page = userOrdersServiceImpl.queryForPage(Integer.valueOf(pageNo), 5);
			request.setAttribute("page", page);
			modelMap.put("methodname", "idlist");
			modelMap.put("idd", "id不能为空");
			return "Administration/main";
		}
		if (pageNo == null) {
			pageNo = "1";
		}
		int id = Integer.parseInt(userid);
		Page page = userOrdersServiceImpl.queryForId(Integer.valueOf(pageNo), 5, id);
		request.setAttribute("page", page);
		modelMap.put("methodname", "idlist");
		modelMap.put("id", id);
		return "Administration/main";
	}
	
	/* 删除的订单分页查询 */
	@RequestMapping(value = "delete")
	public String findDelete(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
		String pageNo = request.getParameter("pageNo");
		if (pageNo == null) {
			pageNo = "1";
		}
		Page page = userOrdersServiceImpl.queryForDelet(Integer.valueOf(pageNo), 5);
		request.setAttribute("page", page);
		modelMap.put("methodname", "delete");
		return "Administration/deleteorder";
	}
}
