package com.detile.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.detile.service.CartServiceImpl;
import com.detile.service.DetileServiceImpl;
import com.entity.Book;

@Controller
@RequestMapping("img")
public class DetileControllerImpl {
	
	@Resource
	@Autowired
	private DetileServiceImpl detileServiceImpl;
	@Autowired
	private CartServiceImpl cartServiceImpl;
	
	@RequestMapping("list")
	public String list(HttpServletRequest request,Model model) {
		String bookid = request.getParameter("id");
		int id = Integer.parseInt(bookid);
		List<Book> list=this.detileServiceImpl.listAll(id);
		model.addAttribute("list", list);
		return "detile";
	}
	
	@RequestMapping("cart")
	public String insertcart(HttpServletRequest request,Model model) {
		String book_count = request.getParameter("count");
		String userid = request.getParameter("userid");
		String book_id = request.getParameter("book_id");
		String name = request.getParameter("name");
		String img = request.getParameter("img");
		String book_price = request.getParameter("price");
		int count = Integer.parseInt(book_count);
		int id = Integer.parseInt(book_id);
		int price = Integer.parseInt(book_price);
		int user_id = Integer.parseInt(userid);
		this.cartServiceImpl.insertCart(count,id,name,img,price,user_id);
		List<Book> list=this.detileServiceImpl.listAll(id);
		model.addAttribute("list", list);
		return "detile";
	}
}
