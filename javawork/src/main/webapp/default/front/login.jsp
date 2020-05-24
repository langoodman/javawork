<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="layout/header.jsp" %>
<%--wsy美化login界面 --%>
<style>
.hint
{
	background:#ffeaea;
	border:1px solid #e5c3c4;
	color:#C00;
	display:none;
	font-size:13px;
}
</style>
<script type="text/javascript">
	function usernamefocus() {
		var usernameHint=document.getElementById("usernameId");
		usernameHint.style.display="none";
	}
	function usernameblur() {
		var username=document.getElementById('username');
		var usernameHint=document.getElementById("usernameId");
		var re=/^[\u4e00-\u9fa5.·]{2,10}$/;
        //用户名不能为空
        if(username.value=="")
        {
        	usernameHint.style.display="block";
        	usernameHint.innerText="用户名不能为空";
        }
        else if(!re.test(username.value)){//判断是否为2-10个汉字,
        	usernameHint.style.display="block";
    		usernameHint.innerText="请输入2-10个汉字字符";
        }
        else{
        	usernameHint.style.display="none";
        }
	}
	function passwordfocus() {
		var passwordHint=document.getElementById("passwordId");
		passwordHint.style.display="none";
	}
	function passwordblur() {
		var password=document.getElementById('password');
		var passwordHint=document.getElementById("passwordId");
		var re=/^\w+$/;//只能包含字母、数字和下划线。 
        if(password.value=="")
        {
            passwordHint.style.display="block";
            passwordHint.innerText="密码不能为空";
        }
        else if(!re.test(password.value)){//判断是否由数字、字母、符号组成
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
<div class="row">
	<div class="col-md-2"></div>
    <div class="col-md-8">
        <div class="panel panel-default">
            <div class="panel-heading">
                <a href="/">主页</a> / 登录
            </div>
            <c:if test="${message != null}">
                <div class="message">${message}</div>
            </c:if>
            <div class="panel-body" style="padding-bottom:0px;">
            	<div class="row">
            		<div class="col-md-7" style="padding:20px 30px;">
	            		<form role="form" id="form">
		                    <div class="form-group">
		                        <label for="username">用户名</label>
		                        <input type="text" class="form-control" id="username" name="username" placeholder="用户名/邮箱" onfocus="usernamefocus()" onblur="usernameblur()">
		                        <div id="usernameId" class="hint btn"></div>
		                    </div>
		                    <div class="form-group">
		                        <label for="password">密码</label>
		                        <input type="password" class="form-control" id="password" name="password" placeholder="密码" onfocus="passwordfocus()" onblur="passwordblur()">
		                        <div id="passwordId" class="hint btn"></div>
		                    </div>
		                    <p style="line-height:33px;font-size:12px;">
		                    	<%-- 加入一个记住我复选框--%>
		                    	<label style="font-weight:normal;">
		                    		<input type="checkbox" value="1" name="net_auto_login" > 记住我
		                    	</label>&nbsp;&nbsp;
								<a href="/admin/login" target="_blank" style="color:#66b7ff;">后台登录</a>
		                    	<button type="button" id="btn" class="btn btn-primary" style="float:right;">登录</button>
		                    </p>
	                	</form>
            		</div>
            		<div class="col-md-5" style="border-left:1px solid #e6e6e6;padding-left: 25px;font-size:12px;text-align:center;">
            			<%--工作室的图标  --%>
            			<img src="/default/front/img/register_logo.png" style="height:148px;width:145px;">
            			<p>还没有账号吗？<a href="/register" style="color:#66b7ff;">立即注册</a></p>
            			<p>忘记密码？<a href="/lostpass" method="GET" style="color:#66b7ff;" target="_blank">找回密码</a></p>
            		</div>
            	</div> 
            </div>
        </div>
    </div>
    <div class="col-md-2"></div>
</div>
<script src="/default/front/login.js"></script>
<%@ include file="layout/footer.jsp" %>