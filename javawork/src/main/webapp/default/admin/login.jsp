<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--ljy 调整后台登录页面--%>
 <!doctype html>
 <html lang="zh-CN">
 <head>
   <meta charset="UTF-8">
   <meta name="viewport"
         content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <title>启明星工作室后台管理系统</title>
   <%--引入font awesome图标--%>
   <link rel="shortcut icon" href="/default/front/common/font-awesome/css/font-awesome.min.css">
   <link rel="icon" href="/default/front/common/images/favicon.ico">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" />
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css"/>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/2.4.8/css/AdminLTE.min.css" />
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/2.4.8/css/skins/_all-skins.min.css" />
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css" />
   <style>
     @media screen and (max-width: 768px) {
       .content-header {
         position: relative;
         padding: 65px 15px 0 15px;
       }
     }
   </style>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js"></script>
   <script src="/default/admin/common/js/app.min.js"></script>

   <script>
     function toast(txt, icon) {
       $.toast({
         text: txt, // Text that is to be shown in the toast
         heading: '系统提醒', // Optional heading to be shown on the toast
         icon: icon || 'error', // Type of toast icon warning, info, success, error
         showHideTransition: 'slide', // fade, slide or plain
         allowToastClose: true, // Boolean value true or false
         hideAfter: 2000, // false to make it sticky or number representing the miliseconds as time after which toast needs to be hidden
         stack: false, // false if there should be only one toast at a time or a number representing the maximum number of toasts to be shown at a time
         position: 'top-right', // bottom-left or bottom-right or bottom-center or top-left or top-right or top-center or mid-center or an object representing the left, right, top, bottom values
       });
     }
   </script>
 </head>
  
<style>
.backimg{
	background-image:url('/default/admin/common/images/loginback.jpg');
	background-repeat:no-repeat;
	overflow-y:hidden;
}
.hint
{
	background:#ffeaea;
	border:1px solid #e5c3c4;
	color:#C00;
	display:none;
	font-size:13px;
	text-align:center;
	padding:5px;
}
.isdisplay{
	display:none;
}
</style>
	
<body class="hold-transition login-page backimg">
  <div class="login-box" style="margin-top:15%;">
    <div class="login-logo">
      <a href="javascript:;"><b>启明星论坛</b>管理平台</a>
    </div>
    <div class="login-box-body">
      <p class="login-box-msg">启明星工作室论坛 管理平台登录</p>
      <c:if test="${error != null}">
        <div class="text-red">${error}</div>
      </c:if>
      <form id="form" action="/admin/login" method="post" onsubmit="return adminlogin()">
        <div class="form-group has-feedback">
          <input type="text" class="form-control" id="username" name="username" placeholder="用户名" onfocus="usernamefocus()" onblur="usernameblur()">
          <span class="glyphicon glyphicon-user form-control-feedback"></span>
          <div id="usernameId" class="hint btn isdisplay"></div>
        </div>
        <div class="form-group has-feedback">
          <input type="password" class="form-control" id="password" name="password" placeholder="密码" onfocus="passwordfocus()" onblur="passwordblur()">
          <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          <div id="passwordId" class="hint btn isdisplay"></div>
        </div>
        <!-- <div class="form-group">
          <div class="input-group">
            <input type="text" class="form-control" id="code" name="code" placeholder="验证码"/>
            <span class="input-group-btn">
            <img style="border: 1px solid #ccc;" src="/common/captcha" id="changeCode"/>
          </span>
          </div>
        </div> -->
        <div class="row">
        	
          <div class="col-xs-8">
            <input type="checkbox" name="rememberMe" id="rememberMe"> <label for="rememberMe">记住我</label>
          </div>
          <div class="col-xs-4">
            <button type="submit" style="padding:3px 10px;" class="btn btn-primary btn-block btn-flat" id="btn">登 录</button>
          </div>
          <div class="col-xs-12" style="margin-top:10px;">
          	<div id=errorMsg style="display:none;" class="hint btn"></div>
          </div>
        </div>
      </form>
    </div>
  </div>
  </body>
<script>
//后台登录表单验证
//用户名验证
function usernamefocus(){
	var usernameHint = document.getElementById("usernameId");
	usernameHint.style.display="none";
}
function usernameblur(){
	var username = document.getElementById("username");
	var usernameHint = document.getElementById("usernameId");
	var usernameRule=/^[\u4e00-\u9fa5.·]{2,10}$/;//2-10个汉字
	if(username.value==""){
		usernameHint.style.display="block";
		usernameHint.innerText="用户名不能为空";
	}
	else if(!usernameRule.test(username.value)){
		usernameHint.style.display="block";
		usernameHint.innerText="请输入2-10个汉字";
	}
	else{
		usernameHint.style.display="none";
	}
}
//密码验证
function passwordfocus(){
	var passwordHint = document.getElementById("passwordId");
	passwordHint.style.display="none";
}
function passwordblur(){
	var password = document.getElementById("password");
	var passwordHint = document.getElementById("passwordId");
	var passwordRule=/^\w+$/; //只能包含字母、数字和下划线。 
	if(password.value=="")
    {
        passwordHint.style.display="block";
        passwordHint.innerText="密码不能为空";
    }
    else if(!passwordRule.test(password.value)){//判断是否由数字、字母、符号组成
    	passwordHint.style.display="block";
    	passwordHint.innerText="只能包含字母、数字和下划线";
    }
    else if(password.value.length<6||password.value.length>15)//判断长度
	{
    	passwordHint.style.display="block";
    	passwordHint.innerText="请输入6-15个字符";
	}
    else{
    	passwordHint.style.display="none";
    }
}
</script>
 <script src="/default/admin/login.js"></script>
</html>