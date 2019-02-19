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

<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
<![endif]-->
</head>

<body>
	<!-- Popup -->
	<div id="Popup">

		<!-- SubPopup -->
		<div id="SubPopup">
			<script type="text/javascript">
				$(function() {
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
									dd.is(":hidden") ? _show() : _hide();
								});
								dd.find("a").click(function() {
									dt.html($(this).html());
									_hide();
								});
								$("body").click(
										function(i) {
											!$(i.target).parents(".select")
													.first().is(s) ? _hide()
													: "";
										});
							})
				})
			</script>
			<form action="${ctx }/add/book" method="post">
				<div class="form_boxC">
					<h2>添加图书</h2>
					<table cellpadding="0" cellspacing="0">
						<tr>
							<th width="100">图书编码 <span class="f_cB">*</span></th>
							<td><div class="txtbox floatL" style="width: 100px;">
									<input name="bookid" type="text" size="5" value="">
								</div></td>
						</tr>
						<tr>
							<th>图书名 <span class="f_cB">*</span></th>
							<td><div class="txtbox floatL" style="width: 100px;">
									<input name="bookname" type="text" size="5" value="">
								</div></td>
						</tr>
						<tr>
							<th>作者 <span class="f_cB">*</span></th>
							<td>
								<!-- selectbox -->
								<div class="txtbox floatL" style="width: 100px;">
									<input name="auther" type="text" size="5" value="">
								</div>
							</td>
						</tr>
						<tr>
							<th>出版社 <span class="f_cB">*</span></th>
							<td>
								<div class="txtbox floatL" style="width: 230px;">
									<input name="publisher" type="text" size="10" value="">
								</div>
							</td>
						</tr>
						<tr>
							<th>出版日期 <span class="f_cB">*</span></th>
							<td>
								<div class="txtbox floatL" style="width: 230px;">
									<input name="date" type="text" size="10" value="">
								</div>
							</td>
						</tr>
						<tr>
							<th>价格 <span class="f_cB">*</span></th>
							<td>
								<div class="txtbox floatL" style="width: 230px;">
									<input name="price" type="text" value="" />
								</div>
							</td>
						</tr>
						<tr>
							<th>图书类型 <span class="f_cB">*</span></th>
							<td>
								<div class="txtbox floatL" style="width: 230px;">
									<input name="typeid" type="text" size="10" value="">
								</div>
							</td>
						</tr>
					</table>
				</div>
				<div id="BtmBtn">
					<div class="btn_box floatR">
						<input type="submit" value="提交" />
					</div>
				</div>
			</form>
		</div>


	</div>
	<!-- /Popup -->
</body>
</html>