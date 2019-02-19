<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>注册</title>
	<meta name="keywords" content="盒老师">
	<meta name="content" content="盒老师">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <link type="text/css" rel="stylesheet" href="static/css/login.css">
    <script type="text/javascript" src="${ctx }/static/js/jquery.min.js"></script>
    <script type="text/javascript">
    function $(id) {  
        return document.getElementById(id);  
    }  
    function checkEmail() {  //校验Email  
        $('emailinfo').innerHTML = "";  
        var email = $('email').value;  
        if(email == "") {  
             $('emailinfo').innerHTML = "Email值不能为空";  
             return false;  
        }  
          
        if(email.indexOf('@') == -1 || email.indexOf('.') == -1) {  
             $('emailinfo').innerHTML = "Email必须包含@和.";  
             return false;  
        }  
    }  
    function checkId() {  //校验账号
        $('Idinfo').innerHTML = "";  
        var password = $('Id').value;  
        if(password == "") {  
            $("Idinfo").innerHTML = "账号不能为空";  
            return false;  
        }  
    }
    function checkPassword() {  //校验密码  
       $('passwordinfo').innerHTML = "";  
       var password = $('password').value;  
       if(password == "") {  
           $("passwordinfo").innerHTML = "密码不能为空";  
           return false;  
       }  
      
      if(password.length < 6) {  
          $("passwordinfo").innerHTML = "密码长度必须大于或者等于6";  
          return false;  
       }  
    }
    function checkAddress() {  //校验地址
        $('Addressinfo').innerHTML = "";  
        var password = $('Address').value;  
        if(password == "") {  
            $("Addressinfo").innerHTML = "地址不能为空";  
            return false;  
        }  
    }
    function checkPhone() {  //手机号
        $('Phoneinfo').innerHTML = "";  
        var password = $('Phone').value;  
        if(password == "") {  
            $("Phoneinfo").innerHTML = "手机号不能为空";  
            return false;  
        }  
       
       if(password.length != 11) {  
           $("Phoneinfo").innerHTML = "手机号长度必须为11位";  
           return false;  
        }  
     }  
    function checkName() {  //校验姓名  
        $('nameinfo').innerHTML = "";  
        var name = $('name').value;  
        if(name == "") {  
           $("nameinfo").innerHTML = "姓名不能为空";  
            return false;  
        }  
          
        for(var i = 0; i < name.length; i++) {  
            var j = name.subString(i , i+1);  
            if(isNaN(j) == false) {  
                $("nameinfo").innerHTML = '姓名中不能包含数字';  
                return false;  
            }  
        }  
    } 
	</script>
</head>
<body class="login_bj" >
	<div class="zhuce_body">
	    <div class="zhuce_kong">
	    	<div class="zc">
	        	<div class="bj_bai">
	            <h3>欢迎注册</h3>
	       	  	  <form action="${pageContext.request.contextPath}/user" onsubmit="return check()" method="post">
	                <input type="text" name="userid" class="kuang_txt phone" placeholder="账号" id="Id" onblur="checkId();" /><br>
	                <span id="Idinfo" style="color:red"></span> 
	                <input  type="text" name="name" class="kuang_txt phone" placeholder="用户名" id="name"  onblur="checkName();"/><br>
	                <span id="nameinfo" style="color:red"></span> 
	                <input  type="text" name="pwd" class="kuang_txt possword" placeholder="密码" id="password" onblur="checkPassword();"/><br>
	                <span id="passwordinfo" style="color:red"></span>
	                <input  type="text" name="email" class="kuang_txt email" placeholder="邮箱" id="email" onblur="checkEmail();"/><br>
	                <span id="emailinfo" style="color:red"></span>
	                <input  type="text" name="tel" class="kuang_txt phone" placeholder="手机号" id="Phone" onblur="checkPhone();"><br>
	                <span id="Phoneinfo" style="color:red"></span>
	                <input  type="text" name="address" class="kuang_txt phone" placeholder="地址" id="Address" onblur="checkAddress();"><br>
	               	<span id="Addressinfo" style="color:red"></span>
	                <div>
	               		<input name="" type="checkbox" value=""><span>已阅读并同意<a href="#" target="_blank"><span class="lan">《XXXXX使用协议》</span></a></span>
	                </div>
	                <input name="注册" type="submit" class="btn_zhuce" value="注册">            
	                </form>
	            </div>
	        	<div class="bj_right">
	            	<p>使用以下账号直接登录</p>
	                <a href="#" class="zhuce_qq">QQ注册</a>
	                <a href="#" class="zhuce_wb">微博注册</a>
	                <a href="#" class="zhuce_wx">微信注册</a>
	                <p>已有账号？<a href="${ctx }/login.jsp">立即登录</a></p>
	            </div>
	        </div>
	    </div>
	</div>
</body>
</html>