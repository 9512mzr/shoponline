<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新华书店</title>
<link rel="stylesheet" type="text/css"
	href="${ctx }/static/css/style.css">
</head>
<body>
	<!-- start header -->
	<header>
		<div class="top center">
			<c:choose>
				<c:when test="${sessionScope.userid != null }">
					<div class="right fr">
						<a
							href="<%=request.getContextPath()%>/cart/list?userid=${sessionScope.userid}"><div
								class="gouwuche fr">购物车</div></a>
						<div class="fr">
							<ul>
								<li>欢迎您：${sessionScope.userid }来到商城</li>
								<li>|</li>
								<li><a href="${ctx }/self/order?id=${sessionScope.userid}">我的订单</a></li>
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
								<li><a href="<%=request.getContextPath()%>/login.jsp"
									target="_blank">登录</a></li>
								<li>|</li>
								<li><a href="<%=request.getContextPath()%>/regist.jsp"
									target="_blank">注册</a></li>
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
	<!--end header -->

	<!-- start banner_x -->
	<div class="banner_x center">
		<a href="./index.html" target="_blank"><div class="logo fl"></div></a>
		<a href=""><div class="ad_top fl"></div></a>
		<div class="nav fl">
			<ul>
				<li><a href="<%=request.getContextPath()%>/product/list">首页</a></li>
				<li><a href="<%=request.getContextPath()%>/product/id?id=1">军事书籍</a></li>
				<li><a
					href="<%=request.getContextPath()%>/product/id?pageNo=1&id=2">经济书籍</a></li>
				<li><a
					href="<%=request.getContextPath()%>/product/id?pageNo=1&id=3">语言</a></li>
				<li><a
					href="<%=request.getContextPath()%>/product/id?pageNo=1&id=4">历史&nbsp;地理</a></li>
				<li><a
					href="<%=request.getContextPath()%>/product/id?pageNo=1&id=7">航空航天</a></li>
				<li><a
					href="<%=request.getContextPath()%>/product/id?pageNo=1&id=5">生物科学</a></li>
				<li><a
					href="<%=request.getContextPath()%>/product/id?pageNo=1&id=6">文学</a></li>
				<li><a
					href="<%=request.getContextPath()%>/product/id?pageNo=1&id=10">交通运输</a></li>
			</ul>
		</div>
		<div class="search fr">
			<form action="find" method="post">
				<div class="text fl">
					<input type="text" class="shuru" name="massage" placeholder="搜你想要的" />
				</div>
				<div class="submit fl">
					<input type="submit" class="sousuo" value="搜索" />
				</div>
				<div class="clear"></div>
			</form>

		</div>
	</div>
	<!-- end banner_x -->
	<!-- start banner_y -->
	<div class="banner_y center">
		<div class="tu"></div>
		<div class="nav">
			<ul align="center">
				<li><a
					href="<%=request.getContextPath()%>/product/id?pageNo=1&id=1">军事书籍</a>
				</li>
				<li><a
					href="<%=request.getContextPath()%>/product/id?pageNo=1&id=2">经济书籍</a>
				</li>
				<li><a
					href="<%=request.getContextPath()%>/product/id?pageNo=1&id=3">语言&nbsp;文字</a>
				</li>
				<li><a
					href="<%=request.getContextPath()%>/product/id?pageNo=1&id=4">历史&nbsp;地理</a>
				</li>
				<li><a
					href="<%=request.getContextPath()%>/product/id?pageNo=1&id=5">生物科学</a>
				</li>
				<li><a
					href="<%=request.getContextPath()%>/product/id?pageNo=1&id=6">&nbsp;&nbsp;&nbsp;文&nbsp;学</a>
				</li>
				<li><a
					href="<%=request.getContextPath()%>/product/id?pageNo=1&id=7">航空&nbsp;航天</a>

				</li>
				<li><a
					href="<%=request.getContextPath()%>/product/id?pageNo=1&id=8">农业科学</a>
				</li>
				<li><a
					href="<%=request.getContextPath()%>/product/id?pageNo=1&id=9">工业技术</a>
				</li>
				<li><a
					href="<%=request.getContextPath()%>/product/id?pageNo=1&id=10">交通运输</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="sub_banner center">
		<div class="sidebar fl">
			<a href="../img/list?id=2"><img
				src="${ctx }/static/images/sanguo.png" alt=""></a>
		</div>
		<div class="datu fl">
			<a href="<%=request.getContextPath()%>/img/list?id=4"><img
				src="${ctx }/static/images/j22.png" alt=""></a>
		</div>
		<div class="datu fl">
			<a href="<%=request.getContextPath()%>/img/list?id=5"><img
				src="${ctx }/static/images/y33.png" alt=""></a>
		</div>
		<div class="datu fr">
			<a href="<%=request.getContextPath()%>/img/list?id=1"><img
				src="${ctx }/static/images/s11.png" alt=""></a>
		</div>
		<div class="clear"></div>
	</div>
	<!-- end banner -->
	<div class="find">
		<form action="${ctx }/product/select" method="post">
			<div class="find1">
				<input type="text" class="shuru" name="massage" value="${name }" />
				<input type="submit" class="sousuo" value="搜索"
					style="height: 23px; line-height: 23px; vertical-align: middle; border: none; font-size: 16px; background-color: #1fbba6; padding: 0px 10px; color: #FFF; -moz-border-radius: 3px; -webkit-border-radius: 3px; border-radius: 3px; cursor: pointer;" />
				<c:out value="${massage }" />
			</div>
		</form>
		<div class="find2">
			<form action="findprice" method="post">
				价格：<input type="text" size="3" name="first" placeholder="￥${first }" />&nbsp;&nbsp;-&nbsp;&nbsp;<input
					type="text" name="second" size="3" placeholder="￥${second }" />&nbsp;&nbsp;&nbsp;
				<input type="submit" value="确定"
					style="height: 23px; line-height: 23px; vertical-align: middle; border: none; font-size: 16px; background-color: #1fbba6; padding: 0px 10px; color: #FFF; -moz-border-radius: 3px; -webkit-border-radius: 3px; border-radius: 3px; cursor: pointer;" />
			</form>
		</div>
	</div>
	<!-- start danpin -->
	<div class="peijian w">
		<div class="biaoti center"></div>
		<div class="main center">
			<div class="content">
				<c:forEach items="${page.getList() }" var="book">
					<div class="remen fl">
						<div class="xinpin">
							<span>新品</span>
						</div>
						<div class="tu">
							<a href="../img/list?id=${book.book_id }"><img
								src="${ctx }/static/images/${book.book_img}"></a>
						</div>
						<div class="miaoshu">
							<a href="../img/list?id=${book.book_id }">${book.book_name }</a>
						</div>
						<div class="jiage">${book.book_price }元</div>
						<div class="pingjia">372人评价</div>
						<div class="piao" align="center">
							<a href="../img/list?id=${book.book_id}"> <span>发货速度很快！</span>
							</a>
						</div>
					</div>
				</c:forEach>
				<div class="clear">&nbsp;</div>
			</div>
		</div>
	</div>
	<div class="pager">
		<div class="page-co">
			<table style="margin-left: 500px;">
				<tr>
					<td colspan="6" align="center" bgcolor="">共${page.totalRecords}条记录
						共${page.totalPages}页 当前第${page.pageNo}页
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
						href="<%=request.getContextPath()%>/product/${methodname }?pageNo=${page.topPageNo}&id=${id}&massage=${name}"
						class="btn_r">首页</a> <c:choose>
							<c:when test="${page.pageNo!=1}">
								<a
									href="<%=request.getContextPath()%>/product/${methodname }?pageNo=${page.previousPageNo }&id=${id}&massage=${name}"
									class="btn_r">上一页</a>
							</c:when>
							<c:otherwise>
								<a class="btn_r">上一页</a>
							</c:otherwise>
						</c:choose> <c:choose>
							<c:when test="${page.pageNo != page.totalPages}">
								<a
									href="<%=request.getContextPath()%>/product/${methodname }?pageNo=${page.nextPageNo }&id=${id}&massage=${name}"
									class="btn_r">下一页</a>
							</c:when>
							<c:otherwise>
								<a class="btn_r">下一页</a>
							</c:otherwise>
						</c:choose> <a
						href="<%=request.getContextPath()%>/product/${methodname }?pageNo=${page.bottomPageNo}&id=${id}&massage=${name}"
						class="btn_r">尾页</a>
					</td>
				</tr>
			</table>
		</div>
	</div>


	<footer class="mt20 center">
		<div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select
			Region</div>
		<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号
			京网文[2014]0059-0009号</div>
		<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
	</footer>
</body>
</html>