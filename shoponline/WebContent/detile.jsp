<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品详情</title>
<link rel="stylesheet" href="${ctx }/static/css/shouye.css">

<script type="text/javascript" src="${ctx }/static/js/jquery.js"></script>
<script type="text/javascript" src="${ctx }/static/js/modernizr-custom-v2.7.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var $miaobian=$('.Xcontent08>div');
	var $huantu=$('.Xcontent06>img');
	var $miaobian1=$('.Xcontent26>div');
	$miaobian.mousemove(function(){miaobian(this);});
	$miaobian1.click(function(){miaobian1(this);});
	function miaobian(thisMb){
		for(var i=0; i<$miaobian.length; i++){
			$miaobian[i].style.borderColor = '#dedede';
		}
		thisMb.style.borderColor = '#cd2426';

		$huantu[0].src = thisMb.children[0].src;
	}
	function miaobian1(thisMb1){
		for(var i=0; i<$miaobian1.length; i++){
			$miaobian1[i].style.borderColor = '#dedede';
		}
		thisMb.style.borderColor = '#cd2426';
		$miaobian.css('border-color','#dedede');
		thisMb1.style.borderColor = '#cd2426';
		$huantu[0].src = thisMb1.children[0].src;
	}
			$(".Xcontent33").click(function(){
			var value=parseInt($('.input').val())+1;
       		$('.input').val(value);
		})

	$(".Xcontent32").click(function(){	
		var num = $(".input").val()
		if(num>0){
			$(".input").val(num-1);
		}			
		
	})

})
</script>
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
										<li><a href="<%=request.getContextPath()%>/login.jsp" target="_blank">登录</a></li>
										<li>|</li>
										<li><a href="${ctx }/self/order?id=${sessionScope.userid}">我的订单</a></li>
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
<div class="Xcontent">
		<ul class="Xcontent01">
				<c:forEach items="${list }" var="book">
				<div class="Xcontent06"><img src="${ctx }/images/${book.images.img3}"></div>
				<ol class="Xcontent08">
					<div class="Xcontent07"><img src="${ctx }/static/images/${book.images.img1}"></div>
					<div class="Xcontent07"><img src="${ctx }/static/images/${book.images.img3}"></div>
					<div class="Xcontent07"><img src="${ctx }/static/images/${book.images.img2}"></div>
					<div class="Xcontent07"><img src="${ctx }/static/images/${book.images.img4}"></div>
				</ol>
				<ol class="Xcontent13">
					<div class="Xcontent14"><a href="#"><p>${book.book_name }</p></a></div>
					<div class="Xcontent15"><img src="${ctx }/static/images/X11.png"></div>
					<div class="Xcontent16"><p>阅读充实人生</p></div>
					<div class="Xcontent17">
						<p class="Xcontent18">售价</p>
						<p class="Xcontent19">￥<span>${book.book_price }</span></p>
						<div class="Xcontent20">
							<p class="Xcontent21">促销</p>
							<img src="${ctx }/static/images/X12.png">
							<p class="Xcontent22">领610元新年礼券，满再赠好礼</p>
						</div>
						<div class="Xcontent23">
							<p class="Xcontent24">服务</p>
							<p class="Xcontent25">${book.book_publisher}&nbsp;&nbsp;&nbsp;&nbsp;       ${book.book_publish_date }出版 &nbsp;&nbsp;&nbsp;&nbsp;        满88元免邮</p>
						</div>
						
					</div>
					<div class="Xcontent26">
						<p class="Xcontent27">颜色</p>
						<div class="Xcontent28"><img  src="${ctx }/static/images/${book.images.img3}"></div>
					</div>
					<form action="cart?book_id=${book.book_id }&name=${book.book_name}&img=${book.book_img}&price=${book.book_price}&userid=${sessionScope.userid}" method="post">
						<div class="Xcontent30">
							<p class="Xcontent31">数量</p>
							<div class="Xcontent32"><img src="${ctx }/static/images/X15.png"></div>
	            				<input class="input" value="1" name="count" id="count"/>
							<div class="Xcontent33"><img src="${ctx }/static/images/16.png"></div>
						</div>
						<div class="Xcontent34">
							<c:choose>
								<c:when test="${sessionScope.userid != null }">
									<input class="btn" type="submit" value="加入购物车" style="height:38px;width:100px;background-color: #c0c0c0;border-radius:5px;"/>
								</c:when>
								<c:otherwise>
									<a class="btn_r">请先登录再购买</a>
								</c:otherwise>
							</c:choose>
						</div>
					</form>
			</ol>		
			</c:forEach>
		</ul>
	</div>
</body>
</html>
