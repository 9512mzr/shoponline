package com.cart.controller;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cart.service.AddressServiceImpl;
import com.cart.service.CarServiceImpl;
import com.cart.service.DeleteServiceImpl;
import com.cart.service.UpdataServiceImpl;
import com.entity.Bookcar;
import com.entity.Users;

@Controller
@RequestMapping("cart")
public class CarControllerImpl {
	@Resource
	private CarServiceImpl carServiceImpl;
	@Autowired
	private DeleteServiceImpl deleteServiceImpl;
	@Autowired
	private UpdataServiceImpl updataServiceImpl;
	@Autowired
	private AddressServiceImpl addressServiceImpl;

	// 购物车
	@RequestMapping("list")
	public String cartList(HttpServletRequest request, Model model) {
		String userid = request.getParameter("userid");
		int user_id = Integer.parseInt(userid);
		List<Bookcar> list = this.carServiceImpl.cartAll(user_id);
		List<Users> list1 = this.addressServiceImpl.Address(user_id);
 		model.addAttribute("list", list);
 		model.addAttribute("list1", list1);
		return "cart";
	}

	// 删除购物车的商品
	@RequestMapping("delete")
	private String delete(HttpServletRequest request, Model model) {
		String carid = request.getParameter("carid");
		String userid = request.getParameter("userid");
		int user_id = Integer.parseInt(userid);
		int id = Integer.parseInt(carid);
		System.out.println(id);
		this.deleteServiceImpl.delete(id);
		List<Bookcar> list = this.carServiceImpl.cartAll(user_id);
		model.addAttribute("list", list);
		return "cart";
	}

	// 更改图书数量
	@RequestMapping("update")
	private String update(HttpServletRequest request, Model model) {
		String carid = request.getParameter("carid");
		String bookcount = request.getParameter("count");
		String userid = request.getParameter("userid");
		int user_id = Integer.parseInt(userid);
		int id = Integer.parseInt(carid);
		int count = Integer.parseInt(bookcount);
		this.updataServiceImpl.updatacount(id, count);
		List<Bookcar> list = this.carServiceImpl.cartAll(user_id);
		model.addAttribute("list", list);
		return "cart";
	}
}
