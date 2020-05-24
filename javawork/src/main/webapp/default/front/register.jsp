<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="layout/header2.jsp" %>
<%--ljy 美化注册界面--%>
<style>
#changelink a:link {color:#259;text-decoration:none;}
#changelink	a:visited {color:#259;text-decoration:none;}
#changelink	a:hover {color:#004229;}
.panel-body-head{
	  text-align:center;
	  margin-top:20px;
	  padding:0px;
}
.logosize{
	width:120px;
	height:120px;
}
.conul{
	padding:0px;
	margin-bottom:0px;
	font-size:16px;
}
li{
	position:relative;
	line-height:30px;
	margin-bottom:20px;
}
.zhuce{
	background:#66b7ff;
	color:#fff !important;
	font-size:16px;
}
.hint
{
	background:#ffeaea;
	border:1px solid #e5c3c4;
	color:#C00;
	display:none;
	font-size:13px;
	text-align:center;
}
.useragreementdetails{
	background:#f5f5f5;
	color:#666;
	margin-bottom:20px;
	padding:20px 15px;
}
.losepadding{
	padding:0px;
}
.title{
	border:none;
	font-size:20px;
	font-weight:500;
	margin-top:30px;
	margin-bottom:20px;
}
.controlheight{
	height:40px;
}
.changelink{
	margin-bottom:10px;
	font-size:14px;
}
.isdisplay{
	display:none;
}
.useragrdet{
 max-height:300px;
 overflow-x:hidden;
}
.captchaImage{
	cursor:pointer;
	width:100%;
	height:90%;
}
#UserAgreementDetails{
	display:none;
	height:200px;
	position:absolute;
}
.changecodeimg{
	font-size:10px;
	text-align:center;
	margin-top:-5px;
}
</style>

<div class="row" style="color:#666;">
	   	<div class="col-md-12 col-xs-12">
	   	 <div class="panel panel-default">
	   	  <div class="panel-heading"><a href="/">主页</a> / 注册</div>
	   	   <div class="panel-body" id="panel">
	   	    <div class="container-fluid panel-body-head" >
	   			<img class="center-block logosize" src="default/front/img/register_logo.png">
	   			<h1 class="title">注册新用户</h1>
	   	    </div>
	   	    <div class="container-fluid losepadding">
	   	       <div class="col-md-3"></div>
		   	    <div class="col-md-6 col-xs-12 losepadding">
		   	      <div class="col-md-2"></div>
		   	       
			   	     <div class="col-md-8 col-xs-12 losepadding">
			   	       
						<ul class="conul">
						   <li>
			                   <input class="form-control controlheight" type="text" id="username" name="username" placeholder="用户名" onfocus="usernamefocus()" onblur="usernameblur()">
			                   <div id="usernameId" class="hint btn isdisplay"></div>
			               </li>
						   <li >
			                   <input class="form-control controlheight" type="password" id="password" name="password" placeholder="密码" onfocus="passwordfocus()" onblur="passwordblur()">
			                   <div id="passwordId" class="hint btn isdisplay"></div>
			               </li>
			               <li >
			                   <input class="form-control controlheight" type="email" id="email" name="email" placeholder="邮箱" onfocus="emailfocus()" onblur="emailblur()">
			               	   <div id="emailId" class="hint btn isdisplay"></div>
			               </li>
	                        <li >性别:&nbsp;&nbsp;
	                        	<label style="font-weight:500;"><input name="sex" id="sex" value="男" type="radio" /> 男</label>&nbsp;&nbsp;&nbsp;
	                            <label style="font-weight:500;"><input name="sex" id="sex" value="女" type="radio" /> 女</label>&nbsp;&nbsp;&nbsp;
	                            <label style="font-weight:500;"><input name="sex" id="sex" value="保密" type="radio" checked="checked" /> 保密</label>
	                        </li>
	                        <li>
	                        	<div class="container-fluid losepadding">
	                        		<div class="col-md-2">组别:</div>
	                        		<div class="col-md-10">
	                        			<select id="groupid" name="group" class="selectpicker form-control" style="display:inline-block">
	                              	 		<c:forEach items="${groupList}" var="group">
		                              			<option id="group" value="${group.groupId}" class="form-control"/>${group.groupName}</option>
	                               			</c:forEach>
	                            		</select>
	                        		</div>
	                        	</div>
	                        </li>
		                  <li >
		                  <%--图片验证码--%>
		                    <div class="container-fluid losepadding">
		                      <div class="col-md-7 col-xs-7 losepadding">
		                        <input type="text" class="form-control" id="checkcode" name="checkcode01" placeholder="请输入验证码" />
		                      </div>
		                      <div class="col-md-1"></div>
		                      <div class="col-md-4 col-xs-4 pull-right" style="height:34px;">
		                      	  <%--点击图片更新验证码--%>
		                          <img id="checkImage" name="checkCode" class="captchaImage" onclick="this.src='captcha?'+Math.random()" src="captcha" title="点击更换验证码">
		                          <div class="changecodeimg"><a onclick="checkImage.src='captcha?'+Math.random()">看不清？换一张</a></div>
		                      </div>
		                    </div>
		                  </li>
		                  <li id="changelink" class="changelink">	
		                    <label style="font-weight:500;"><input type="checkbox" checked="checked" name="agreement_chk"/> 我同意</label> 
		                    <a href="javascript:;" id="UserAgreement">用户协议</a>
		                    <a href="/login" class="pull-right" >已有账号?</a>
		                  </li>
		                   <li style="margin-bottom:50px;">
	                    	<button class="btn btn-large btn-block zhuce" id="btn" method="post">注 册</button>
	                    	<div id="errorMsg" style="display:none;" class="hint btn isdisplay"></div>
	                  	  </li>
			            </ul>
		       		</div>
		   	    <div class="col-md-2"></div>
		   	    <div class="container-fluid losepadding" id="UserAgreementDetails" >
					         <div class="useragreementdetails">
				        		<div class="useragrdet">
				        		   	<p style="margin-bottom:10px;">当您申请用户时，表示您已经同意遵守本规章。</p>
									<p>欢迎您加入本站点参与交流和讨论，本站点为社区，为维护网上公共秩序和社会稳定，请您自觉遵守以下条款：</p>
									<p style="margin-bottom:10px;">一、不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益，不得利用本站制作、复制和传播下列信息：</br>
									　（一）煽动抗拒、破坏宪法和法律、行政法规实施的；</br>
									　（二）煽动颠覆国家政权，推翻社会主义制度的；</br>
									　（三）煽动分裂国家、破坏国家统一的；</br>
									　（四）煽动民族仇恨、民族歧视，破坏民族团结的；</br>
									　（五）捏造或者歪曲事实，散布谣言，扰乱社会秩序的；</br>
									　（六）宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；</br>
									　（七）公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；</br>
									　（八）损害国家机关信誉的；</br>
									　（九）其他违反宪法和法律行政法规的；</br>
									　（十）进行商业广告行为的。</p>
									<p>二、互相尊重，对自己的言论和行为负责。</p>
									<p>三、禁止在申请用户时使用相关本站的词汇，或是带有侮辱、毁谤、造谣类的或是有其含义的各种语言进行注册用户，否则我们会将其删除。</p>
									<p>四、禁止以任何方式对本站进行各种破坏行为。</p>
									<p>五、如果您有违反国家相关法律法规的行为，本站概不负责，您的登录信息均被记录无疑，必要时，我们会向相关的国家管理部门提供此类信息。</p>
				        		</div>
				       		 </div>
			       		   </div>
		      </div>
	        <div class="col-md-3"></div>
	   	   </div>
	   	  </div>
	    </div>
	   </div>
</div>
<script>

<%-- 实现用户协议显示与隐藏效果--%>
window.onload = function(){
	var UserAgreement = document.getElementById("UserAgreement");
	var UserAgreementDetails = document.getElementById("UserAgreementDetails");
	UserAgreement.onclick = function(){
		if(UserAgreementDetails.style.display == "none"){
			UserAgreementDetails.style.display = "block";
		}else{
			UserAgreementDetails.style.display = "none";
		}
    }
}


<%--注册表单验证--%>
<%--验证用户名--%>
function usernamefocus() {
	var usernameHint=document.getElementById("usernameId");
	usernameHint.style.display="none";
}
function usernameblur() {
	var username=document.getElementById("username");
	var usernameHint=document.getElementById("usernameId");
	var usernameRule=/^[\u4e00-\u9fa5.·]{2,10}$/;
    if(username.value=="")//用户名不能为空
    {
    	usernameHint.style.display="block";
    	usernameHint.innerText="用户名不能为空";
    }
    else if(!usernameRule.test(username.value)){//判断是否为2-10个汉字,
    	usernameHint.style.display="block";
		usernameHint.innerText="请输入2-10个汉字字符";
    }
    else{
    	usernameHint.style.display="none";
    }
}
<%--验证密码--%>
function passwordfocus() {
	var passwordHint=document.getElementById("passwordId");
	passwordHint.style.display="none";
}
function passwordblur() {
	var password=document.getElementById("password");
	var passwordHint=document.getElementById("passwordId");
	var passwordRule=/^\w+$/;//只能包含字母、数字和下划线。 
    if(password.value=="")//密码不能为空
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
<%--验证邮箱--%>
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

</script>
<script src="/default/front/register.js"></script>
<%@ include file="layout/footer.jsp" %>