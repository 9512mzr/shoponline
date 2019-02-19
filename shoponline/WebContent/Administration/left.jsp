<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页左侧导航</title>
<link rel="stylesheet" type="text/css" href="css/public.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/public.js"></script>
<head></head>

<body id="bg">
	<!-- 左边节点 -->
	<div class="container">

		<div class="leftsidebar_box">
			<a href="${ctx }/Administration/p2.jsp" target="main"><div class="line">
					<img src="<%=request.getContextPath()%>/static/images/coin01.png" />&nbsp;&nbsp;首页
				</div></a>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="<%=request.getContextPath()%>/static/images/coin07.png" /><img class="icon2"
						src="<%=request.getContextPath()%>/static/images/coin07.png" />用户管理<img class="icon3"
						src="<%=request.getContextPath()%>/static/images/coin19.png" /><img class="icon4"
						src="<%=request.getContextPath()%>/static/images/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="<%=request.getContextPath()%>/static/images/coin111.png" /><img class="coin22"
						src="<%=request.getContextPath()%>/static/images/coin222.png" /><a class="cks" href="${ctx }/users/list"
						target="main">用户管理</a><img class="icon5" src="<%=request.getContextPath()%>/static/images/coin21.png" />
				</dd>
				<dd>
					<img class="coin11" src="<%=request.getContextPath()%>/static/images/coin111.png" /><img class="coin22"
						src="<%=request.getContextPath()%>/static/images/coin222.png" /><a class="cks" href="${ctx }/journal/list"
						target="main">用户登录日志</a><img class="icon5" src="<%=request.getContextPath()%>/static/images/coin21.png" />
				</dd>
			</dl>
			<dl class="system_log">
				<dt>
					<img class="icon1" src="<%=request.getContextPath()%>/static/images/coin01.png" /><img class="icon2"
						src="../static/images/coin02.png" />订单管理<img class="icon3"
						src="../static/images/coin19.png" /><img class="icon4"
						src="../static/images/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="../static/images/coin111.png" /><img class="coin22"
						src="../static/images/coin222.png" /><a class="cks" href="${ctx }/userorders/list"
						target="main">订单</a><img class="icon5" src="../static/images/coin21.png" />
				</dd>
				<dd>
					<img class="coin11" src="../static/images/coin111.png" /><img class="coin22"
						src="../static/images/coin222.png" /><a class="cks" href="${ctx }/userorders/delete"
						target="main">已删除订单</a><img class="icon5" src="../static/images/coin21.png" />
				</dd>
			</dl>
			
			<dl class="system_log">
				<dt>
					<img class="icon1" src="../static/images/coin11.png" /><img class="icon2"
						src="../static/images/coin12.png" /> 商品管理<img class="icon3"
						src="../static/images/coin19.png" /><img class="icon4"
						src="../static/images/coin20.png" />
				</dt>
				<dd>
					<img class="coin11" src="../static/images/coin111.png" /><img class="coin22"
						src="../static/images/coin222.png" /><a class="cks" href="${ctx }/book/list" target="main">查看商品</a><img class="icon5" src="../static/images/coin21.png" />
						<img class="icon5" src="../static/images/coin21.png" />
				</dd>
				<dd>
					<img class="coin11" src="../static/images/coin111.png" /><img class="coin22"
						src="../static/images/coin222.png" /><a class="cks" href="p1.jsp"
						target="main">添加商品</a><img class="icon5" src="../static/images/coin21.png" />
						<img class="icon5" src="../static/images/coin21.png" />
				</dd>
			</dl>
		</div>
	</div>
</body>
</html>
