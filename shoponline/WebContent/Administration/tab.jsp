<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="generator" content="" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;">
<link href="${ctx }/Administration/css/haiersoft.css" rel="stylesheet" type="text/css"
	media="screen,print" />
<link href="${ctx }/Administration/css/print.css" rel="stylesheet" type="text/css"
	media="print" />
<script src="${ctx }/Administration/js/jquery-1.10.1.min.js"></script>
<script src="${ctx }/Administration/js/side.js" type="text/javascript"></script>
</head>
<body>
	<!-- MainForm -->
	<div id="MainForm">
		<div class="form_boxA">
			<h2>用户列表</h2>
			<table cellpadding="0" cellspacing="0">
				<tr>
					<th>用户ID</th>
					<th>用户名</th>
					<th>电话</th>
					<th>邮箱</th>
					<th>地址</th>
					<th>注册时间</th>
					<th>操作</th>
				</tr>
					<c:forEach items="${page.getUserList() }" var="user">
						<tr>
							<td>${user.id }</td>
							<td>${user.user_name }</td>
							<td>${user.user_telephone }</td>
							<td>${user.user_email }</td>
							<td>${user.user_address }</td>
							<td>${user.user_posttime }</td>
							<td><a href="<%=request.getContextPath()%>/users/delete?id=${user.id }">删除</td>
						</tr>
					</c:forEach>	
			</table>
			<table style="margin-left: 0px;">
				       <tr>
				            <td colspan="6" align="center" bgcolor="">共${page.totalRecords}条记录 共${page.totalPages}页 当前第${page.pageNo}页 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                <a href="<%=request.getContextPath()%>/users/list?pageNo=${page.topPageNo}" class="btn_r">首页</a>
				                <c:choose>
				                  <c:when test="${page.pageNo!=1}">             
				                      <a href="<%=request.getContextPath()%>/users/list?pageNo=${page.previousPageNo }" class="btn_r">上一页</a>                
				                  </c:when>
				                  <c:otherwise>   
				                      <a class="btn_r">上一页</a>       
				                  </c:otherwise>
				                </c:choose>
				                <c:choose>
				                  <c:when test="${page.pageNo != page.totalPages}">
				                    <a href="<%=request.getContextPath()%>/usres/list?pageNo=${page.nextPageNo }" class="btn_r">下一页</a>
				                  </c:when>
				                  <c:otherwise>    
				                      <a class="btn_r">下一页</a>
				                  </c:otherwise>
				                </c:choose>
				                <a href="<%=request.getContextPath()%>/users/list?pageNo=${page.bottomPageNo}&id=${id}" class="btn_r">尾页</a>
				            </td>
				        </tr>
			</table>
		</div>
	</div>
</body>
</html>