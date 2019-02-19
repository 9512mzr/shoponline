<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>商城网上商城</title>
		<link rel="stylesheet" type="text/css" href="${ctx}/static/css/styleg.css">
		<link rel="stylesheet" type="text/css" href="${ctx}/static/css/css.css" />
		<script type="text/javascript" src="${ctx}/static/js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript">
			$(function() {
				var region = $("#region");
				var address = $("#address");
				var number_this = $("#number_this");
				var name = $("#name_");
				var phone = $("#phone");
				$("#sub_setID").click(function() {
					var input_out = $(".input_style");
					for (var i = 0; i <= input_out.length; i++) {
						if ($(input_out[i]).val() == "") {
							$(input_out[i]).css("border", "1px solid red");
							
							return false;
						} else {
							$(input_out[i]).css("border", "1px solid #cccccc");
						}
					}
				});
				var span_momey = $(".span_momey");
				var b = 0;
				for (var i = 0; i < span_momey.length; i++) {
					b += parseFloat($(span_momey[i]).html());
				}
				var out_momey = $(".out_momey");
				out_momey.html(b);
				$(".shade_content").hide();
				$(".shade").hide();
				$('.nav_mini ul li').hover(function() {
					$(this).find('.two_nav').show(100);
				}, function() {
					$(this).find('.two_nav').hide(100);
				})
				$('.left_nav').hover(function() {
					$(this).find('.nav_mini').show(100);
				}, function() {
					$(this).find('.nav_mini').hide(100);
				})
				$('#jia').click(function() {
					$('input[name=num]').val(parseInt($('input[name=num]').val()) + 1);
				})
				$('#jian').click(function() {
					$('input[name=num]').val(parseInt($('input[name=num]').val()) - 1);
				})
				$('.Caddress .add_mi').click(function() {
					$(this).css('background', 'url("images/mail_1.jpg") no-repeat').siblings('.add_mi').css('background', 'url("images/mail.jpg") no-repeat')
				})
			})
			var x = Array();

			function func(a, b) {
				x[b] = a.html();
				alert(x)
				a.css('border', '2px solid #f00').siblings('.min_mx').css('border', '2px solid #ccc');
			}

			function onclick_close() {
				var shade_content = $(".shade_content");
				var shade = $(".shade");
				if (confirm("确认关闭么！此操作不可恢复")) {
					shade_content.hide();
					shade.hide();
				}
			}

			function onclick_open() {
				$(".shade_content").show();
				$(".shade").show();
				var input_out = $(".input_style");
				for (var i = 0; i <= input_out.length; i++) {
					if ($(input_out[i]).val() != "") {
						$(input_out[i]).val("");
					}
				}
			}

			function onclick_remove(r) {
				if (confirm("确认删除么！此操作不可恢复")) {
					var out_momey = $(".out_momey");
					var input_val = $(r).parent().prev().children().eq(1).val();
					var span_html = $(r).parent().prev().prev().children().html();
					var out_add = parseFloat(input_val).toFixed(2) * parseFloat(span_html).toFixed(2);
					var reduce = parseFloat(out_momey.html()).toFixed(2)- parseFloat(out_add).toFixed(2);
					console.log(parseFloat(reduce).toFixed(2));
					out_momey.text(parseFloat(reduce).toFixed(2))
					$(r).parent().parent().remove();
				}
			}

			function onclick_btnAdd(a) {
				var out_momey = $(".out_momey");
				var input_ = $(a).prev();
				var input_val = $(a).prev().val();
				var input_add = parseInt(input_val) + 1;
				input_.val(input_add);
				var btn_momey = parseFloat($(a).parent().prev().children().html());
				var out_momey_float = parseFloat(out_momey.html()) + btn_momey;
				out_momey.text(out_momey_float.toFixed(2));
			}

			function onclick_reduce(b) {
				var out_momey = $(".out_momey");
				var input_ = $(b).next();
				var input_val = $(b).next().val();
				if (input_val <= 1) {
					alert("商品个数不能小于1！")
				} else {
					var input_add = parseInt(input_val) - 1;
					input_.val(input_add);
					var btn_momey = parseFloat($(b).parent().prev().children().html());
					var out_momey_float = parseFloat(out_momey.html()) - btn_momey;
					out_momey.text(out_momey_float.toFixed(2));
				}
			}
		</script>
	</head>

	<body>
		<div id="top">
			<div id="top_main">
				<ul class="topu">
					<li>
						<div class="xing">
						</div>
						<a href="#">收藏商城</a>
					</li>
				</ul>
				<div id="hello">
					<span>您好，欢迎来到商城！
			<a href="login.html">[登陆]</a><a href="login.html">[免费注册]</a>
			</span>
				</div>
				
			</div>
		</div>
		
		<div id="serach">
			<div class="logo">
					<img src="${ctx }/static/images/go.png" alt="" />
				<div class="dongtu">
				</div>
			</div>
			<div class="sou">
				<div class="sousuo">
					<input type="text" class="kuang" value="跨界" style="color:#999;font-size:14px" />
					<div class="souzi">
						<a href="#">搜索</a>
					</div>
				</div>
				<div class="reci">
					
				</div>
			</div>
			<div class="myjd">
				<div class="mytu">
				</div>
				<a href="<%=request.getContextPath()%>/product/list">我的商城</a>
			</div>
		</div>
		<div class="Caddress">
			<div class="open_new">
				<button class="open_btn" onclick="javascript:onclick_open();">使用新地址</button>
			</div>
			<c:forEach items="${list1 }" var="user">
				<div class="add_mi">
					<p style="border-bottom:1px dashed #ccc;line-height:28px;">${user.user_name }收</p>
					<p>地址：${user.user_address}<br>电话：${user.user_telephone }</p>
				</div>
			</c:forEach>
		</div>
		
		<div class="shopping_content">
			<div class="shopping_table">
				<table border="1" bordercolor="#cccccc" cellspacing="0" cellpadding="0" style="width: 100%; text-align: center;">
					<tr>
						<th>商品图片</th>
						<th>商品名称</th>
						<th>商品价格</th>
						<th>商品数量</th>
						<th>商品操作</th>
					</tr>
					<c:forEach items="${list }" var="car">	
						<tr>
							<td>
								<a><img src="${ctx }/static/images/${car.book_img }" /></a>
							</td>
							<td><span>${car.book_name }</span></td>
							
							<td>
								<span class="span_momey">￥${car.book_price }</span>
							</td>
							<td>
								<form action="<%=request.getContextPath()%>/cart/update?carid=${car.car_id }&userid=${sessionScope.userid}" method="post">
									<!--  <button class="btn_reduce" onclick="javascript:onclick_reduce(this);">-</button>-->
									<input class="momey_input" type="text" name="count"  value="${car.book_count }"  />&nbsp;&nbsp;
									<!-- <button class="btn_add" onclick="javascript:onclick_btnAdd(this);">+</button>-->
									<input class="btn_r" type="submit" value="修   改" />
								</form>
							</td>
							<td>
								<!--  <button class="btn_r" onclick="javascript:onclick_remove(this);">删除</button>-->
								<a class="btn_rr" href="<%=request.getContextPath()%>/cart/delete?carid=${car.car_id }&userid=${sessionScope.userid}">删&nbsp;除</a>
							</td>
						</tr>
					</c:forEach>
				</table>
				<c:forEach items="${list }" var="car">
					<c:set var="price1" scope="page" value="${(car.book_count)*(car.book_price)}"/>
					<c:set var="sum11" scope="page" value="${sum11+price1}"/>
				</c:forEach>
				<c:set var="carlist" scope="session" value="${list}" />
				<c:set var="addresslist" scope="session" value="${list1}" />
				<c:set var="sumprice" scope="session" value="${sum11}" />
				<c:set var="userid" scope="session" value="${sessionScope.userid}" />
				<div class="" style="width: 100%; text-align: right; margin-top: 10px;">
					<form action="<%=request.getContextPath()%>/order/submit?userid=${sessionScope.userid }" metod="post">
						<div class="div_outMumey" style="float: left;">
							总价：<span >￥<c:out value="${sum11}"/></span>
						</div>
						<input class="btn_closing" type="submit" value="结算" name="123"/>
					</form>
				</div>
			</div>
		</div>

		<!--
        	作者：z@163.com
        	时间：2016-03-01
        	描述：shade 遮罩层
        -->
		<div class="shade">
		</div>
		<!--
        	作者：z@163.com
        	时间：2016-03-02
        	描述：shade_content
        -->
		<div class="shade_content">
			<div class="col-xs-12 shade_colse">
				<button onclick="javascript:onclick_close();">x</button>
			</div>
			<div class="nav shade_content_div">
				<div class="col-xs-12 shade_title">
					新增收货地址
				</div>
				<div class="col-xs-12 shade_from">
					<form action="" method="post">
						<div class="col-xs-12">
							<span class="span_style" id="">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;区</span>
							<input class="input_style" type="" name="" id="region" value="" placeholder="&nbsp;&nbsp;请输入您的所在地区" />
						</div>
						<div class="col-xs-12">
							<span class="span_style" id="">详细地址</span>
							<input class="input_style" type="" name="" id="address" value="" placeholder="&nbsp;&nbsp;请输入您的详细地址" />
						</div>
						<div class="col-xs-12">
							<span class="span_style" id="">邮政编号</span>
							<input class="input_style" type="" name="" id="number_this" value="" placeholder="&nbsp;&nbsp;请输入您的邮政编号" />
						</div>
						<div class="col-xs-12">
							<span class="span_style" class="span_sty" id="">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</span>
							<input class="input_style" type="" name="" id="name_" value="" placeholder="&nbsp;&nbsp;请输入您的姓名" />
						</div>
						<div class="col-xs-12">
							<span class="span_style" id="">手机号码</span>
							<input class="input_style" type="" name="" id="phone" value="" placeholder="&nbsp;&nbsp;请输入您的手机号码" />
						</div>
						<div class="col-xs-12">
							<input class="btn_remove" type="button" id="" onclick="javascript:onclick_close();" value="取消" />
							<input type="submit" class="sub_set" id="sub_setID" value="提交" />
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<!-- 底部开始 -->
		<div id="down">
			<div class="down_top">
				<a href="#">关于我们</a>
				<a href="#">联系我们</a>
				<a href="#">商家入驻</a>
				<a href="#">营销中心</a>
				<a href="#">手机商城</a>
				<a href="#">友情链接</a>
				<a href="#">销售联盟</a>
				<a href="#">商城社区</a>
				<a href="#">商城公益</a>
				<a href="#" style="border-right:none">English Site</a>
			</div>
			<div class="down_center">
				<span>北京市公安局朝阳分局备案编号110105014669  |  京ICP证070359号  |  <a href="#">互联网药品信息服务资格证编号(京)-经营性-2014-0008</a>  |  新出发京零 字第大120007号</span>
				<span><a href="#">音像制品经营许可证苏宿批005号</a>  |  出版物经营许可证编号新出发(苏)批字第N-012号  |  互联网出版许可证编号新出网证(京)字150号</span>
				<span><a href="#">网络文化经营许可证京网文[2011]0168-061号</a>  违法和不良信息举报电话：4006561155  Copyright © 2004-2014  商城JD.com 版权所有</span>
				<span>商城旗下网站：<a href="#">360TOP</a><a href="#">拍拍网</a><a href="#">网银在线</a></span>
			</div>
		</div>
		<!-- 底部结束 -->
	</body>

</html>