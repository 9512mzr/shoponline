package com.product.controller;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Request;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cart.service.CarServiceImpl;
import com.cart.service.DeleteServiceImpl;
import com.cart.service.UpdataServiceImpl;
import com.entity.Book;
import com.entity.Bookcar;
import com.entity.Page;
import com.product.service.FindServiceImpl;
import com.product.service.ProductServiceImpl;

@Controller
@RequestMapping("product")
public class ProductControllerImpl {
	@Resource
	@Autowired
	private ProductServiceImpl productServiceImpl;
	@Autowired
	private FindServiceImpl findServiceImpl;

	public ProductControllerImpl() {
	}

	protected final transient Log log = LogFactory.getLog(ProductControllerImpl.class);

	@RequestMapping(value = "list")
	// 找到所有的记录并实现了分页
	public String findAll(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
		String pageNo = request.getParameter("pageNo");
		if (pageNo == null) {
			pageNo = "1";
		}
		Page page = productServiceImpl.queryForPage(Integer.valueOf(pageNo), 5);
		request.setAttribute("page", page);
		modelMap.put("methodname", "list");
		return "product";
	}

	// 根据类型ID进行查询
	@RequestMapping(value = "id")
	public String findId(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
		String pageNo = request.getParameter("pageNo");
		String id = request.getParameter("id");
		if (pageNo == null) {
			pageNo = "1";
		}
		Page page = productServiceImpl.queryForId(Integer.valueOf(pageNo), 5, Integer.valueOf(id));
		request.setAttribute("page", page);
		modelMap.put("methodname", "id");
		modelMap.put("id", id);
		return "product";
	}
	
	/*查找图书*/
	@RequestMapping(value = "select")
	public String findByName(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
		String pageNo = request.getParameter("pageNo");
		String bookname = request.getParameter("massage");
		
		if (bookname == null || bookname.equals("")) {
			if (pageNo == null) {
				pageNo = "1";
			}
			Page page = productServiceImpl.queryForPage(Integer.valueOf(pageNo), 5);
			request.setAttribute("page", page);
			modelMap.put("methodname", "select");
			modelMap.put("massage", "输入为空");
			return "product";
		}
		if (pageNo == null) {
			pageNo = "1";
		}
		Page page = findServiceImpl.queryForId(Integer.valueOf(pageNo), 5, bookname);
		request.setAttribute("page", page);
		modelMap.put("methodname", "select");
		modelMap.put("name", bookname);
		return "product";
	}

	// 按价格条件查找
	@SuppressWarnings("null")
	@RequestMapping("findprice")
	public String findprice(HttpServletRequest request, Model model) {
		String first = request.getParameter("first");
		String second = request.getParameter("second");
		int firstprice = Integer.parseInt(first);
		int secondprice = Integer.parseInt(second);

		List listprice = this.findServiceImpl.Price();
		List<Book> list = null;
		System.out.println(listprice);
		for (int i = 0; i < listprice.size(); i++) {
			String p = listprice.get(i).toString();
			int price = Integer.parseInt(p);
			if (price >= firstprice || price <= secondprice) {
				System.out.println(price);
				list.addAll(this.findServiceImpl.listPrice(price));
			}
		}
		model.addAttribute("list", list);
		model.addAttribute("first", firstprice);
		model.addAttribute("second", secondprice);
		return "product";
	}

}
