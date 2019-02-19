package com.Administration.book.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Administration.book.service.AddBookServiceImpl;

@Controller
@RequestMapping("add")
public class AddBookControllerImpl {
	@Resource
	@Autowired
	private AddBookServiceImpl addBookServiceImpl;
	
	@RequestMapping("book")
	public String addBook(HttpServletRequest request, Model model) {
		String bookid = request.getParameter("bookid");
		String name = request.getParameter("bookname");
		String auther= request.getParameter("auther");
		String publish = request.getParameter("publisher");
		String date = request.getParameter("date");
		String bookprice = request.getParameter("price");
		String type = request.getParameter("typeid");
		int id = Integer.parseInt(bookid);
		int price = Integer.parseInt(bookprice);
		
		this.addBookServiceImpl.addBook(id, name, auther, publish, date, price, type);
		return "Administration/p1";
	}
}
