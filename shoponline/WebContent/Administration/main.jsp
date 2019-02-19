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
	<!-- wrap_left -->

	<!-- /wrap_left -->

	<!-- picBox -->
	<div class="picBox" onClick="switchSysBar()" id="switchPoint"></div>
	<!-- /picBox -->



	<!-- wrap_right -->
	<div class="wrap_right">
		<header> <!-- Header --> <!-- /Header --> </header>


		<!-- Contents -->
		<div id="Contents">
			<script type="text/javascript">
				$(
						function() {
							$(".select").each(
									function() {
										var s = $(this);
										var z = parseInt(s.css("z-index"));
										var dt = $(this).children("dt");
										var dd = $(this).children("dd");
										var _show = function() {
											dd.slideDown(200);
											dt.addClass("cur");
											s.css("z-index", z + 1);
										};
										var _hide = function() {
											dd.slideUp(200);
											dt.removeClass("cur");
											s.css("z-index", z);
										};
										dt.click(function() {
											dd.is(":hidden") ? _show()
													: _hide();
										});
										dd.find("a").click(function() {
											dt.html($(this).html());
											_hide();
										});
										$("body").click(
												function(i) {
													!$(i.target).parents(
															".select").first()
															.is(s) ? _hide()
															: "";
												});
									})
						})
			</script>

			<!-- MainForm -->
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
						</tr>
							<c:forEach items="${page.getOrderList() }" var="order">
								<tr>
									<td>${order.order_user_id }</td>
									<td>${order.user_name }</td>
									<td>${order.user_telephone }</td>
									<td >${order.book_massage }</td>
									<td class="money">￥${order.sum_price }</td>
									<td >${order.user_address }</td>
									<td>${order.order_time }</td>
								</tr>
							</c:forEach>	
					</table>
				</div>
			</div>
			<!-- /MainForm -->
			<!-- BtmMain -->
			<div id="BtmMain">
				<span class="ttl">搜索条件</span>

				<!-- txtbox -->
				<form action="${ctx }/userorders/idlist" method="post">
					<div class="txtbox floatL mag_r20">
						<span class="sttl">输入用户ID</span> <input name="id" type="text" size="8" value="${id }">
						<c:set var="user_id" value="${id }" scope="session"/>
					</div>
					<span class="ttl"><c:out value="${idd }"></c:out></span>
					<!-- /txtbox -->
					<!-- btn_box -->
					<div class="btn_box floatR mag_l20">
						<input name="" type="submit" value="搜索订单" />
					</div>
				</form>
				<!-- /btn_box -->
			</div>
			<!-- /BtmMain -->

			<!-- PageNum -->
			<ul id="PageNum">
				<li>共${page.totalRecords}条记录 共${page.totalPages}页 当前第${page.pageNo}页</li>
				<li><a href="<%=request.getContextPath()%>/userorders/${methodname }?pageNo=${page.topPageNo}&id=${sessionScope.user_id}">首页</a></li>
				<c:choose>
					<c:when test="${page.pageNo!=1}">
						<li><a href="${ctx }/userorders/${methodname }?pageNo=${page.previousPageNo }&id=${sessionScope.user_id}">上一页</a></li>
					 </c:when>
					 <c:otherwise>   
					 	<a>上一页</a>   
					 </c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${page.pageNo != page.totalPages}">
						<li><a href="${ctx }/userorders/${methodname }?pageNo=${page.nextPageNo }&id=${sessionScope.user_id}">下一页</a></li>
					</c:when>
					<c:otherwise>    
				        <a>下一页</a>
				    </c:otherwise>
				</c:choose>
				<li><a href="${ctx }/userorders/${methodname }?pageNo=${page.bottomPageNo}&id=${sessionScope.user_id}">尾页</a></li>
			</ul>
			<!-- /PageNum -->
		</div>
		<!-- /Contents -->

		<!-- /footer -->
		<footer>
		<address>2007 Corporation,All Rights</address>
		</footer>
		<!-- /footer -->

	</div>
	<!-- /wrap_right -->
</body>
</html>
