package com.login.controller;

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

import com.entity.Book;
import com.entity.Login;
import com.login.service.JournalServiceImpl;
import com.login.service.LoginServiceImpl;

@Controller
public class LoginController {
	@Resource
	private LoginServiceImpl loginServiceImpl;
	@Autowired
	private JournalServiceImpl journalServiceImpl;

	@RequestMapping("/login")
	public String login(HttpServletRequest request, Model model) {
		String id = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		List<Object[]> list = this.loginServiceImpl.listAll();
		int user_id = Integer.parseInt(id);
		Date time = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("E yyyy.MM.dd 'at' hh:mm:ss a zzz");
		String time1 = ft.format(time);
		for (Object[] objs : list) {
			if (objs[0].equals(id) || objs[1].equals(pwd)) {
				HttpSession session = request.getSession();
				String name = journalServiceImpl.userName(user_id).get(0);
				journalServiceImpl.insert(user_id, name, time1);
				session.setAttribute("userid", id);
				return "product";
			}
		}
		model.addAttribute("error", "用户名或密码不正确");
		return "login";
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
