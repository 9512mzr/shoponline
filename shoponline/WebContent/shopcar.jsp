<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>订单处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="format-detection" content="telephone=no" />
<meta name="" />

<link rel="stylesheet" href="${ctx }/static/css/tasp.css" />
<link href="${ctx }/static/css/orderconfirm.css" rel="stylesheet" />

<style>
#page {
	width: auto;
}

#comm-header-inner, #content {
	width: 950px;
	margin: auto;
}

#logo {
	padding-top: 26px;
	padding-bottom: 12px;
}

#header .wrap-box {
	margin-top: -67px;
}

#logo .logo {
	position: relative;
	overflow: hidden;
	display: inline-block;
	width: 140px;
	height: 35px;
	font-size: 35px;
	line-height: 35px;
	color: #f40;
}

#logo .logo .i {
	position: absolute;
	width: 140px;
	height: 35px;
	top: 0;
	left: 0;
	background: url(http://a.tbcdn.cn/tbsp/img/header/logo.png);
}
</style>

</head>
<body data-spm="1">


	<div id="page">

		<div id="content" class="grid-c">
			<div>
				<h3 class="dib">确认订单信息</h3>
				<table cellspacing="0" cellpadding="0" class="order-table"
					id="J_OrderTable" summary="统一下单订单信息区域">
					<caption style="display: none">统一下单订单信息区域</caption>
					<thead>
						<tr>
							<th class="s-title">店铺宝贝
								<hr />
							</th>
							<th class="s-price">单价(元)
								<hr />
							</th>
							<th class="s-amount">数量
								<hr />
							</th>
							<th class="s-agio">优惠方式(元)
								<hr />
							</th>
							<th class="s-total">小计(元)
								<hr />
							</th>
						</tr>
					</thead>
					<tbody data-spm="3" class="J_Shop" data-tbcbid="0"
						data-outorderid="47285539868" data-isb2c="false" data-postMode="2"
						data-sellerid="1704508670">
						<tr class="first">
							<td colspan="5"></td>
						</tr>
						<tr class="shop blue-line">
							<td colspan="2" class="promo">
								<div>
									<ul class="scrolling-promo-hint J_ScrollingPromoHint">
									</ul>
								</div>
							</td>
						</tr>
						<c:forEach items="${list }" var="car">
							<tr class="item"
								data-lineid="19614514619:31175333266:35612993875"
								data-pointRate="0">
								<td class="s-title"><a href="#" target="_blank">
										<img src="${ctx }/static/images/${car.book_img }"
										class="itempic"><span class="title J_MakePoint"
										data-point-url="">${car.book_name }</span>
								</a>

									</td>
								<td class="s-price"><span class='price '> <em
										class="style-normal-small-black J_ItemPrice">￥${car.book_price }</em>
								</span> <input type="hidden" name="costprice" value="630.00"
									class="J_CostPrice" /></td>
								<td class="s-amount" data-point-url=""><input type="hidden"
									class="J_Quantity" value="1"
									name="19614514619_31175333266_35612993875_quantity" />${car.book_count }</td>
								<td class="s-agio">
									<div class="J_Promotion promotion" data-point-url="">无优惠</div>
								</td>
								<td class="s-total"><span class='price '> <em
										class="style-normal-bold-red J_ItemTotal ">￥${(car.book_price)*(car.book_count)}</em>
								</span> <input id="furniture_service_list_b_47285539868" type="hidden"
									name="furniture_service_list_b_47285539868" /></td>
							</tr>
						</c:forEach>


						<tr class="item-service">
							<td colspan="5" class="servicearea" style="display: none"></td>
						</tr>

						<tr class="blue-line" style="height: 2px;">
							<td colspan="5"></td>
						</tr>
						<tr class="other other-line">
							<td colspan="5">
								<ul class="dib-wrap">
									<li class="dib user-info">
										<ul class="wrap">
											<li>
												<div class="field gbook">
													<label class="label">给卖家留言：</label>
													<textarea style="width: 350px; height: 80px;"
														title="选填：对本次交易的补充说明（建议填写已经和卖家达成一致的说明）" name=""></textarea>
												</div>
											</li>
										</ul>
									</li>
									<li class="dib extra-info">

										<div class="shoparea">
											<ul class="dib-wrap">
												<li class="dib title">店铺优惠：</li>
												<li class="dib sel"><div
														class="J_ShopPromo J_Promotion promotion clearfix"
														data-point-url="http://log.mmstat.com/buy.1.16"></div></li>
												<li class="dib fee"><span class='price '> -<em
														class="style-normal-bold-black J_ShopPromo_Result">0.00</em>
												</span></li>
											</ul>
										</div>

										<div class="shoppointarea"></div>

										<div class="farearea">
											<ul class="dib-wrap J_farearea">
												<li class="dib title">运送方式：</li>
												<li class="dib sel"
													data-point-url="http://log.mmstat.com/jsclick?cache=*&tyxd=wlysfs">
													<input type="hidden" name="1704508670:2|actualPaidFee"
													value="0" class="J_ActualPaidFee" /> <input type="hidden"
													name="1704508670:2|codAllowMultiple" value="true" /> <input
													type="hidden" name="1704508670:2|codSellerFareFee" value=""
													class="J_CodSellerFareFee" /> <input type="hidden"
													name="1704508670:2|codServiceFeeRate" value=""
													class="J_CodServiceFeeRate" /> <input type="hidden"
													name="1704508670:2|codPostFee" value="0"
													class="J_CodPostFee" /> <select name="1704508670:2|post"
													class="J_Fare">
														<option data-fare="1500" value=" 2 "
															data-codServiceType="2" data-level="" selected="selected"> 快递 15.00元 </option>
														<option data-fare="2500" value=" 7 "
															data-codServiceType="7" data-level="">EMS 25.00元 </option>
														<option data-fare="1500" value=" 1 "
															data-codServiceType="1" data-level=""> 平邮 15.00元 </option>
												</select> <em tabindex="0" class="J_FareFree" style="display: none">免邮费</em>
												</li>
												<li class="dib fee"><span class='price '> <em
														class="style-normal-bold-red J_FareSum">00.00</em>
												</span></li>
											</ul>
										</div>
										<div class="extra-area">
											<ul class="dib-wrap">
												<li class="dib title">发货时间：</li>
												<li class="dib content">卖家承诺订单在买家付款后，72小时内<a href="#">发货</a></li>
											</ul>
										</div>

										<div class="servicearea" style="display: none"></div>
									</li>
								</ul>
							</td>
						</tr>

						<tr class="shop-total blue-line">
							<td colspan="5">店铺合计(<span class="J_Exclude"
								style="display: none">不</span>含运费<span class="J_ServiceText"
								style="display: none">，服务费</span>)： <span class='price g_price '>
									<span>&yen;</span><em class="style-middle-bold-red J_ShopTotal">${sumPrice}</em>
							</span> <input type="hidden" name="1704508670:2|creditcard"
								value="false" /> <input type="hidden" id="J_IsLadderGroup"
								name="isLadderGroup" value="false" />

							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5">

								<div class="order-go" data-spm="4">
									<div class="J_AddressConfirm address-confirm">
										<div class="kd-popup pop-back" style="margin-bottom: 40px;">
											<div class="box">
												<div class="bd">
													<div class="point-in">

														<em class="t">实付款：</em> <span class='price g_price '>
															<span>&yen;</span><em class="style-large-bold-red"
															id="J_ActualFee">${sumPrice}</em>
														</span>
													</div>

													<ul>
														<c:forEach items="${list1 }" var="user">
															<li><em>寄送至:</em><span id="J_AddrConfirm"
																style="word-break: break-all;"> ${user.user_address} </span></li>
															<li><em>收货人:</em><span id="J_AddrNameConfirm">${user.user_name }
																	电话：${user.user_telephone } </span></li>
														</c:forEach>
													</ul>
												</div>
											</div>
											<a href="${ctx }/cart/list?userid=${sessionScope.userid}"
												class="back J_MakePoint" target="_top" data-point-url="">返回购物车</a>
											<a id="J_Go" class=" btn-go" data-point-url="" tabindex="0"
												title="" href="${ctx }/order/list?userid=${sessionScope.userid }">提交订单<b class="dpl-button"></b></a>
										</div>
									</div>

									<div class="J_confirmError confirm-error">
										<div class="msg J_shopPointError" style="display: none;">
											<p class="error">积分点数必须为大于0的整数</p>
										</div>
									</div>


									<div class="msg" style="clear: both;">
										<p class="tips naked" style="float: right; padding-right: 0">若价格变动，请在提交订单后联系卖家改价，并查看已买到的宝贝</p>
									</div>
								</div>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>

			<input type="hidden" id="J_useSelfCarry" name="useSelfCarry"
				value="false" /> <input type="hidden" id="J_selfCarryStationId"
				name="selfCarryStationId" value="0" /> <input type="hidden"
				id="J_useMDZT" name="useMDZT" value="false" /> <input type="hidden"
				name="useNewSplit" value="true" /> <input type="hidden"
				id="J_sellerIds" name="allSellIds" value="1704508670" />
			</form>
		</div>

		<div id="footer"></div>
	</div>

</body>
</html>
