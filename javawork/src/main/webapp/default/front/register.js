$(function () {
	function checkforminfo(){
//	    $("#panel").on("click", "#btn", function () {
			var errorMsgHint=document.getElementById("errorMsg");
	    	var username = $("#username").val();
	        var password = $("#password").val();
	        var email = $("#email").val();
	        var sex = $("input[name='sex']:checked").val();
	        var group = $("#groupid").find("option:selected").val();
	        var checkcode = $("#checkcode").val();//验证码
	        var agreement_chk = $('input:checkbox[name="agreement_chk"]').prop("checked");//判断“我同意”复选框的状态 
	        var usernameRule=/^[\u4e00-\u9fa5.·]{2,10}$/;
	    	var passwordRule=/^\w+$/;
	    	var emailRule=/^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	    	console.log(username+"123")
	        if (!username) {
	        	errorMsgHint.style.display="block";
	        	errorMsgHint.innerText="用户名不能为空哦";
//	            alert('用户名不能为空哦');
	            return false;
	        }
	        else if(!usernameRule.test(username)){//判断用户名格式
	        	errorMsgHint.style.display="block";
	        	errorMsgHint.innerText="用户名格式错误";
//	        	alert('用户名格式错误');
	    		return false;
	        }
	        else if (!password) {
	        	errorMsgHint.style.display="block";
	        	errorMsgHint.innerText="密码不能为空哦";
//	            alert('密码不能为空哦');
	            return false;
	        }
	        else if(!passwordRule.test(password)||password.length<6||password.length>15){//判断密码格式
	        	errorMsgHint.style.display="block";
	        	errorMsgHint.innerText="密码格式错误";
//	        	alert('密码格式错误');
	    		return false;
	    	}
	        else if (!email) {
	        	errorMsgHint.style.display="block";
	        	errorMsgHint.innerText="邮箱不能为空哦";
//	            alert('邮箱不能为空哦');
	            return false;
	        }
	        else if(!emailRule.test(email)){//判断邮箱格式
	        	errorMsgHint.style.display="block";
	        	errorMsgHint.innerText="邮箱格式错误";
//	        	alert('邮箱格式错误');
	    		return false;
	        }
	        else if (!checkcode) {
	        	errorMsgHint.style.display="block";
//	            alert('请输入验证码');
	            errorMsgHint.innerText="请输入验证码";
	            return false;
	        }
	        else if (!agreement_chk) {
	        	errorMsgHint.style.display="block";
	        	errorMsgHint.innerText="你必需同意用户协议才能继续";
//	            alert('你必需同意用户协议才能继续');
	            return false;
	        }
	        else{
	        	return true;
	        }
//	    });
	}
	
   
    $(document).ready(function(){
    	$("#btn").click(function(e){
//    		alert("点击注册")
        	if(checkforminfo()){
//        		alert("要提交请求了")
        		 $.ajax({
         		    type: "post",
         		    url: "/register",
         		    dataType: "json",
         		    data: {
         		        username: $("#username").val(),
         		        password: $("#password").val(),
         		        email: $("#email").val(),
         		        sex : $("input[name='sex']:checked").val(),
         		        group : $("#groupid").find("option:selected").val(),
         		        checkcode : $("#checkcode").val(),
         		        agreement_chk : $('input:checkbox[name="agreement_chk"]').prop("checked"),
         		    },
         		    success: function (data) {
//         		    	alert("是否会提交成功？")
         		        // console.log(data);
         		        if (data.success != null && data.success == false) {
//         		        	alert(msg);
         		        	var errorMsgHint=document.getElementById("errorMsg");
         		        	errorMsgHint.style.display="block";
         		        	errorMsgHint.innerText=data.error;
//             		    	location.href = "/register";
         		        } else {
         		        	var errorMsgHint=document.getElementById("errorMsg");
         		        	errorMsgHint.innerText="";
         		        	toast("注册成功！等待审核！正在跳转至登录...", "success");
         		            setTimeout(function () {
         		                window.location.href = "/login";
         		            }, 1000);
         		        }
         		    },
         		    error: function (data) {
         		    	
         		    }
         		});
        	}
        	else{
//        		var errorMsgHint=document.getElementById("errorMsg");
//		        errorMsgHint.innerText="请输入正确信息！";
//        		alert("请输入正确信息！");
        	}
        });
    });

});