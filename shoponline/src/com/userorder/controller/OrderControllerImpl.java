package com.userorder.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.entity.Page;
import com.userorder.service.OrderServiceImpl;


@Controller
@RequestMapping("self")
public class OrderControllerImpl {
	@Resource
	@Autowired
	private OrderServiceImpl orderServiceImpl;
	
	public OrderControllerImpl() {}

	protected final transient Log log = LogFactory.getLog(OrderControllerImpl.class);	
	
	
	/* ID分页查询 */
	@RequestMapping("order")
	public String findId(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
		String pageNo = request.getParameter("pageNo");
		String userid = request.getParameter("id");
		if (pageNo == null) {
			pageNo = "1";
		}
		int id = Integer.parseInt(userid);
		Page page = orderServiceImpl.queryForId(Integer.valueOf(pageNo), 5, id);
		request.setAttribute("page", page);
		modelMap.put("methodname", "order");
		modelMap.put("id", id);
		return "orders";
	}
	
	/*删除订单*/
	@RequestMapping("delete")
	public String delete(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
		String pageNo = request.getParameter("pageNo");
		String userid = request.getParameter("id");
		String orderId = request.getParameter("orderid");
		int order_id = Integer.parseInt(orderId);
		this.orderServiceImpl.delete(order_id);
		if (pageNo == null) {
			pageNo = "1";
		}
		int id = Integer.parseInt(userid);
		Page page = orderServiceImpl.queryForId(Integer.valueOf(pageNo), 5, id);
		request.setAttribute("page", page);
		modelMap.put("methodname", "order");
		modelMap.put("id", id);
		return "orders";
	}
	
	/*取消订单*/
	@RequestMapping("clear")
	public String clear(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
		String pageNo = request.getParameter("pageNo");
		String userid = request.getParameter("id");
		String orderId = request.getParameter("orderid");
		int order_id = Integer.parseInt(orderId);
		this.orderServiceImpl.clear(order_id);
		if (pageNo == null) {
			pageNo = "1";
		}
		int id = Integer.parseInt(userid);
		Page page = orderServiceImpl.queryForId(Integer.valueOf(pageNo), 5, id);
		request.setAttribute("page", page);
		modelMap.put("methodname", "order");
		modelMap.put("id", id);
		return "orders";
	}
}
