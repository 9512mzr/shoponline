package com.Administration.login.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Remove;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Administration.login.service.AdministrationLoginServiceImpl;

@Controller
@RequestMapping("Administration")
public class AdministrationloginDaoImplLoginController {
	@Resource
	private AdministrationLoginServiceImpl administrationloginServiceImpl;

	@RequestMapping("/login")
	public String login(HttpServletRequest request, Model model) {
		String id = request.getParameter("name");
		String pwd = request.getParameter("password");
		List<Object[]> list = this.administrationloginServiceImpl.listAll();
		int user_id = Integer.parseInt(id);
		for (Object[] objs : list) {
			if (objs[0].equals(id) || objs[1].equals(pwd)) {
				HttpSession session = request.getSession();
				session.setAttribute("adminid", id);
				return "Administration/index";
			}
		}
		return "Administration/login";
	}

	/*
	 * 退出登录
	 */
	@RequestMapping("/exist")
	public String exist(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("userid");
		return "login";
	}
}
