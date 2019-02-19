<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单</title>
<link rel="stylesheet" type="text/css" href="${ctx }/static/css/style.css">
<link href="${ctx }/Administration/css/haiersoft.css" rel="stylesheet" type="text/css"
	media="screen,print" />
<link href="${ctx }/Administration/css/print.css" rel="stylesheet" type="text/css"
	media="print" />
<script src="${ctx }/Administration/js/jquery-1.10.1.min.js"></script>
<script src="${ctx }/Administration/js/side.js" type="text/javascript"></script>
</head>
<body>
	<header>
			<div class="top center">
				<c:choose>
					<c:when test="${sessionScope.userid != null }">
     					<div class="right fr">
							<a href="<%=request.getContextPath()%>/cart/list?userid=${sessionScope.userid}"><div class="gouwuche fr">购物车</div></a>
							<div class="fr">
								<ul>
									<li>欢迎您：${sessionScope.userid }来到商城</li>
									<li>|</li>
									<li><a href="<%=request.getContextPath()%>/product/list">我的商城</a></li>
									<li>|</li>
									<li><a href="<%=request.getContextPath()%>/exist">退出登录</a></li>
								</ul>
							</div>
							<div class="clear"></div>
						</div>
    				</c:when>
    				<c:otherwise>
       					<div class="right fr">
							<div class="fr">
								<ul>
									<li><a href="<%=request.getContextPath()%>/login.jsp" target="_blank">登录</a></li>
									<li>|</li>
									<li><a href="<%=request.getContextPath()%>/regist.jsp" target="_blank" >注册</a></li>
									<li>|</li>
								</ul>
							</div>
							<div class="clear"></div>
						</div>
    				</c:otherwise>
				</c:choose>
				<div class="clear"></div>
			</div>
		</header>
	<div id="MainForm">
		<div class="form_boxB">
			<h2>订单信息</h2>
			<table cellpadding="0" cellspacing="0">
				<tr>
					<th>用户ID</th>
					<th>收件人</th>
					<th>电话</th>
					<th>商品信息</th>
					<th>总价</th>
					<th>收货地址</th>
					<th>下单时间</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${page.getOrderList() }" var="order">
					<tr>
						<td>${order.order_user_id }</td>
						<td>${order.user_name }</td>
						<td>${order.user_telephone }</td>
						<td>${order.book_massage }</td>
						<td class="money">￥${order.sum_price }</td>
						<td>${order.user_address }</td>
						<td>${order.order_time }</td>
						<td>
							<a href="${ctx }/self/delete?id=${sessionScope.userid}&orderid=${order.order_id}">删除</a>|
							<a href="${ctx }/self/clear?id=${sessionScope.userid}&orderid=${order.order_id}">取消订单</a>
						</td>
					</tr>
					<c:set var="orderid" value="${order.order_id }" scope="page"/>
				</c:forEach>
			</table>
		</div>
	</div>
	<!-- /MainForm -->
	<!-- BtmMain -->
	<div id="BtmMain">
	</div>
	<!-- /BtmMain -->

	<!-- PageNum -->
	<ul id="PageNum">
		<li>共${page.totalRecords}条记录 共${page.totalPages}页
			当前第${page.pageNo}页</li>
		<li><a
			href="${ctx }/self/${methodname }?pageNo=${page.topPageNo}&id=${sessionScope.userid}&orderid=${orderid}">首页</a></li>
		<c:choose>
			<c:when test="${page.pageNo!=1}">
				<li><a
					href="${ctx }/self/${methodname }?pageNo=${page.previousPageNo }&id=${sessionScope.userid}&orderid=${orderid}">上一页</a></li>
			</c:when>
			<c:otherwise>
				<a>上一页</a>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${page.pageNo != page.totalPages}">
				<li><a
					href="${ctx }/self/${methodname }?pageNo=${page.nextPageNo }&id=${sessionScope.userid}&orderid=${orderid}">下一页</a></li>
			</c:when>
			<c:otherwise>
				<a>下一页</a>
			</c:otherwise>
		</c:choose>
		<li><a
			href="${ctx }/self/${methodname }?pageNo=${page.bottomPageNo}&id=${sessionScope.userid}&orderid=${orderid}">尾页</a></li>
	</ul>
	<!-- /PageNum -->
	</div>
</body>
</html>