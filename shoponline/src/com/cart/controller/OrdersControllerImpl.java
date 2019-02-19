package com.cart.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cart.service.AddressServiceImpl;
import com.cart.service.CarServiceImpl;
import com.cart.service.OrdersServiceImpl;
import com.entity.Bookcar;
import com.entity.Users;

@Controller
@RequestMapping("order")
public class OrdersControllerImpl {
	@Resource
	@Autowired
	private OrdersServiceImpl ordersServiceImpl;
	@Autowired
	private CarServiceImpl carServiceImpl;
	@Autowired
	private AddressServiceImpl addressServiceImpl;
	
	/*由购物车提交到订单*/
	@RequestMapping("submit")
	public String submitOrder(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Number sumprice = (Number)session.getAttribute("sumprice");
		int sumPrice = sumprice.intValue();
		List<Bookcar> list = (List)session.getAttribute("carlist");
		List<Users> list1 = (List)session.getAttribute("addresslist");
		model.addAttribute("sumPrice",sumPrice);
		model.addAttribute("list", list);
 		model.addAttribute("list1", list1);
		return "shopcar";
	}
	
	/*确认订单信息*/
	@RequestMapping("list")
	public String setOrder(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Number sumprice = (Number)session.getAttribute("sumprice");
		int sumPrice = sumprice.intValue();
		List<Bookcar> list = (List)session.getAttribute("carlist");
		List<Users> list1 = (List)session.getAttribute("addresslist");
		String bookMassage = " ";
		for(int i = 0;i < list.size();i++) {
			String bookName = list.get(i).getBook_name();
			int bookPrice = list.get(i).getBook_price();
			int bookCount = list.get(i).getBook_count();
			String bookprice  = String.valueOf(bookPrice);
			String bookcount = String.valueOf(bookCount);
			bookMassage = bookMassage + "书名：" + bookName + "  " + "价格：￥" + bookprice + "  " + "数量：" + bookcount + "  ";
		}
		String userName = list1.get(0).getUser_name();
		String userTelephone = list1.get(0).getUser_telephone();
		String userAddress = list1.get(0).getUser_address();
		String orderuserId = (String)session.getAttribute("userid");
		int orderUserId = Integer.parseInt(orderuserId);
		Date time = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("E yyyy.MM.dd  hh:mm:ss a ");
		String time1 = ft.format(time);
		this.ordersServiceImpl.orders(userName, userTelephone, bookMassage, userAddress, sumPrice, orderUserId, time1);
		model.addAttribute("sumPrice",sumPrice);
		model.addAttribute("list", list);
 		model.addAttribute("list1", list1);
		return "product";
	}
}
