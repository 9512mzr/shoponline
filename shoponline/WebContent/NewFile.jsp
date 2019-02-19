<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#PageNum{ text-align:center; padding-top:50px;}
#PageNum li{ text-align:center; display:inline-block; padding:0px 5px;}
#PageNum li a{ display:block; background-color:#FFF; height:30px; line-height:30px; vertical-align:middle; font-size:12px; padding:0px 10px;-moz-border-radius: 30px; -webkit-border-radius: 30px;border-radius:30px; text-decoration:none; color:#333;}
#PageNum li a:hover{ background-color:#eb6d48; color:#FFF;}
</style>
</head>
<body>
<!-- PageNum -->
			<ul id="PageNum">
				<li>共${page.totalRecords}条记录 共${page.totalPages}页 当前第${page.pageNo}页</li>
				<li><a href="<%=request.getContextPath()%>/book/${methodname }?pageNo=${page.topPageNo}&name=${sessionScope.bookname}">首页</a></li>
				<c:choose>
					<c:when test="${page.pageNo!=1}">
						<li><a href="${ctx }/book/${methodname }?pageNo=${page.previousPageNo }&name=${sessionScope.bookname}">上一页</a></li>
					 </c:when>
					 <c:otherwise>   
					 	<a>上一页</a>   
					 </c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${page.pageNo != page.totalPages}">
						<li><a href="${ctx }/book/${methodname }?pageNo=${page.nextPageNo }&name=${sessionScope.bookname}">下一页</a></li>
					</c:when>
					<c:otherwise>    
				        <a>下一页</a>
				    </c:otherwise>
				</c:choose>
				<li><a href="${ctx }/book/${methodname }?pageNo=${page.bottomPageNo}&name=${sessionScope.bookname}">尾页</a></li>
			</ul>
			<!-- /PageNum -->
</body>
</html>