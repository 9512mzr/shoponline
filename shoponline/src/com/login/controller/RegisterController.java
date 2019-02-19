package com.login.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.login.service.RegisterServiceImpl;


@Controller
public class RegisterController {
	@Resource
	@Autowired
	private RegisterServiceImpl registerServiceImpl;
	
	@RequestMapping("/user")
	public String savee(HttpServletRequest request) {
		String id = request.getParameter("userid");
		String name = request.getParameter("name");
		String password = request.getParameter("pwd");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		Date time = new Date( );
		SimpleDateFormat ft = new SimpleDateFormat ("E yyyy.MM.dd 'at' hh:mm:ss a zzz");
		String time1 = ft.format(time);
		int user_id = Integer.parseInt(id);
		this.registerServiceImpl.save(user_id, name, password, email, tel, address, time1);
		return "login";
	}
	
}
