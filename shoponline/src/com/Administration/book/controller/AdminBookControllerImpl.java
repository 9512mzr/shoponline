package com.Administration.book.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Administration.book.service.AdminBookServiceImpl;
import com.entity.Book;
import com.entity.Page;

@Controller
@RequestMapping("book")
public class AdminBookControllerImpl {
	@Resource
	@Autowired
	private AdminBookServiceImpl adminBookServiceImpl;

	
	private AdminBookControllerImpl() {}
	protected final transient Log log = LogFactory.getLog(AdminBookControllerImpl.class);
	
	/* 图书后台分页查询 */
	@RequestMapping(value = "list")
	public String findAll(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
		String pageNo = request.getParameter("pageNo");
		if (pageNo == null) {
			pageNo = "1";
		}
		Page page = adminBookServiceImpl.queryForPage(Integer.valueOf(pageNo), 5);
		request.setAttribute("page", page);
		modelMap.put("methodname", "list");
		return "Administration/mainproduct";
	}
	
	/*删除图书*/
	@RequestMapping(value = "delete")
	private String delete(HttpServletRequest request, ModelMap modelMap) {
		String bookid = request.getParameter("id");
		int id = Integer.parseInt(bookid);
		this.adminBookServiceImpl.delete(id);
		String pageNo = request.getParameter("pageNo");
		if (pageNo == null) {
			pageNo = "1";
		}
		Page page = adminBookServiceImpl.queryForPage(Integer.valueOf(pageNo), 5);
		request.setAttribute("page", page);
		modelMap.put("methodname", "list");
		return "Administration/mainproduct";
	}
	
	/*查找图书*/
	@RequestMapping(value = "select")
	public String findId(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
		String pageNo = request.getParameter("pageNo");
		String bookname = request.getParameter("name");
		if (bookname == null || bookname.equals("")) {
			if (pageNo == null) {
				pageNo = "1";
			}
			Page page = adminBookServiceImpl.queryForPage(Integer.valueOf(pageNo), 5);
			request.setAttribute("page", page);
			modelMap.put("methodname", "select");
			modelMap.put("idd", "不能为空");
			return "Administration/mainproduct";
		}
		if (pageNo == null) {
			pageNo = "1";
		}
		Page page = adminBookServiceImpl.queryForId(Integer.valueOf(pageNo), 5, bookname);
		request.setAttribute("page", page);
		modelMap.put("methodname", "select");
		modelMap.put("name", bookname);
		return "Administration/mainproduct";
	}
	
	/*查询需要修改的图书信息*/
	@RequestMapping(value = "selectById")
	public String selectId(HttpServletRequest request,Model model) {
		String bookid = request.getParameter("bookid");
		int id = Integer.parseInt(bookid);
		List<Book> list = this.adminBookServiceImpl.selectBook(id);
		model.addAttribute("list",list);
		model.addAttribute("bookid",id);
		return "Administration/p4";
	}
	
	/* 修改图书信息 */
	@RequestMapping(value = "update")
	public String update(HttpServletRequest request,Model model) {
		String bookid = request.getParameter("bookid");
		String auther= request.getParameter("auther");
		String publish = request.getParameter("publisher");
		String date = request.getParameter("date");
		String bookprice = request.getParameter("price");
		int id = Integer.parseInt(bookid);
		int price = Integer.parseInt(bookprice);
		this.adminBookServiceImpl.updatebook(id, auther, date, publish, price);
		List<Book> list = this.adminBookServiceImpl.selectBook(id);
		model.addAttribute("list",list);
		return "Administration/p4";
	}
}
