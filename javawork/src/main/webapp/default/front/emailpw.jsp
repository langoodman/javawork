<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="layout/header.jsp" %>
<%--wsy建立找回密码界面 --%>
<style>
.hint
{
	background:#ffeaea;
	border:1px solid #e5c3c4;
	color:#C00;
	display:none;
	font-size:13px;
}
.captchaImage{
	cursor:pointer;
	width:100%;
	height:90%;
}
.changecodeimg{
	font-size:10px;
	text-align:center;
	margin-top:3px;
}
.pull-right
{
	float:right !important;
}
#btn
{
	border-color:none;
}
#btn:hover
{
	background-color:#4daaff;
}
.form-group
{
	margin-bottom:16px;
}

.form-control
{
	height:37px;
}
</style>
<script type="text/javascript">
function emailfocus() {
	var emailHint=document.getElementById("emailId");
	emailHint.style.display="none";
}
function emailblur() {
	var email=document.getElementById("email");
	var emailHint=document.getElementById("emailId");
	var emailRule=/^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
    if(email.value=="")//邮箱不能为空
    {
    	emailHint.style.display="block";
    	emailHint.innerText="邮箱不能为空";
    }
    else if(!emailRule.test(email.value)){//判断邮箱格式是否正确
    	emailHint.style.display="block";
    	emailHint.innerText="邮箱格式不正确";
    }
    else{
    	emailHint.style.display="none";
    }
}
function newpasswordfocus() {
	var newpwHint=document.getElementById("newpasswordId");
	newpwHint.style.display="none";
}
function newpasswordblur() {
	var newpw=document.getElementById("newPassword");
	var newpwHint=document.getElementById("newpasswordId");
	var re=/^\w+$/;//只能包含字母、数字和下划线。 
    if(newpw.value=="")//新密码不能为空
    {
    	newpwHint.style.display="block";
    	newpwHint.innerText="新密码不能为空";
    }
    else if(!re.test(newpw.value)){//判断是否由数字、字母、符号组成
    	newpwHint.style.display="block";
    	newpwHint.innerText="只能包含字母、数字和下划线";
    }
    else if(newpw.value.length<6||newpw.value.length>15)//判断长度
	{
    	newpwHint.style.display="block";
    	newpwHint.innerText="请输入6-15个字符";
	}
    else{
    	newpwHint.style.display="none";
    }
}
function getVerify()
{
	var email=document.getElementById("email").value;
	var $button =document.getElementById("sendVerifyCode");
	var number = 60;
	var countdown = function(){
		if (number == 0) {
		    $button.disabled = false;
		    $button.innerHTML="获取验证码";
            number = 60;
            return;
        }
        else {
        	$button.setAttribute("disabled", "disabled");
        	$button.innerHTML=number + "s后重新获取";
        	number--;
        }
		setTimeout(countdown,1000);
	}
	setTimeout(countdown,1000);
	
	$.ajax({
        url: '/lostpassword',
        type: 'post',
        async: true,
        cache: false,
        dataType: 'json',
        data: {
        	email:email,
        },
        success: function (data) {
        	console.log(data);
            if (data.success != null && data.success == true) {
            	toast("请查看自己邮箱的收件箱或垃圾箱!");
            } else {
            	toast("发送失败");
            }
        }
    });
}
</script>
<div class="row">
	<div class="col-md-2"></div>
    <div class="col-md-8">
        <div class="panel panel-default">
            <div class="panel-heading">
                <a href="/">主页</a> /<big>找回密码</big>
            </div>
            <c:if test="${message != null}">
                <div class="message">${message}</div>
            </c:if>
            <div class="panel-body" style="padding-bottom:0px;">
            	<div class="row">
            		<div class="col-md-6" style="border-right:1px solid #e6e6e6;font-size:14px;text-align:center;color:#333333;margin:20px 0px;">
            			<%--工作室的图标  --%>
            			<img src="/default/front/img/register_logo.png" style="height:215px;width:210px;">
            			<p>请输入你的注册邮箱，系统将发出一封验证邮件，<br>通过验证邮件就可以重新设置密码了</p>
            		</div>
            		<div class="col-md-6" style="padding:20px 30px;">
	            		<form role="form" id="form">
		                    <div class="form-group">
		                        <input type="text" class="form-control" id="email" name="email" placeholder="请输入邮箱" onfocus="emailfocus()" onblur="emailblur()">
		                        <div id="emailId" class="hint btn"></div>
		                    </div>
		                    <div class="form-group row" style="margin-left: 0px;">
		                    	<div class="col-md-7" style="padding:0px;">
		                    		<input type="text" class="form-control" id="checkcode" name="checkcode01" placeholder="请输入验证码">
		                    	</div>
		                    	<div class="col-md-1"></div>
		                    	<div class="col-md-4 pull-right" style="padding:0px;">
		                    		<%--点击图片更新验证码
		                        	<img id="checkImage" name="checkCode" class="captchaImage" onclick="this.src='captcha?'+Math.random()" src="captcha" title="点击更换验证码">
		                        	<div class="changecodeimg"><a onclick="checkImage.src='captcha?'+Math.random()">看不清？换一张</a></div>--%>
		                        	<button type="button" id="sendVerifyCode" class="btn btn-primary" onclick="getVerify()" style="height:37px;">获取验证码</button>
		                    	</div>
		                    </div>
		                  	<div class="form-group">
		                    	<input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="请输入新密码" onfocus="newpasswordfocus()" onblur="newpasswordblur()">
		             			<div id="newpasswordId" class="hint btn"></div>
		                    </div>
		                    <div class="form-group">
		                    	<input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="请确认密码">
		             			<div id="confirmpasswordId" class="hint btn"></div>
		                    </div>
		                    <p>
		                    	<button type="button" id="btn" class="btn btn-primary" style="float:right;height:37px;">确认</button>
		                    </p>
	                	</form>
            		</div>
            	</div> 
            </div>
        </div>
    </div>
    <div class="col-md-2"></div>
</div>
<script src="/default/front/emailpw.js"></script>
<%@ include file="layout/footer.jsp" %>