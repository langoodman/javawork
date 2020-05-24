//提交验证
//$("#formbody").on("click", "#btn", function(){
function adminlogin(){
    var username = $("#username").val();
    var password = $("#password").val();
    var errorMsgHint=document.getElementById("errorMsg");
	var usernameRule=/^[\u4e00-\u9fa5.·]{2,10}$/;//2-10个汉字
	var passwordRule=/^\w+$/; //只能包含字母、数字和下划线。 
	var rememberMe = false;
    $('#form input[type="checkbox"]').each(function () {
		if($(this).is(":checked"))
		{
			rememberMe = true;
		}
	});    
	if(username==""){
//			alert('用户名不能为空');
		errorMsgHint.style.display="block";
		errorMsgHint.innerText="用户名不能为空";
		return false;
	}
	else if(!usernameRule.test(username)){
//			alert('用户名格式错误');
		errorMsgHint.style.display="block";
		errorMsgHint.innerText="用户名格式错误";
		return false;
	}
	else if(password==""){
//			alert("密码不能为空");
		errorMsgHint.style.display="block";
		errorMsgHint.innerText="密码不能为空";
		return false;
	}
	else if(!passwordRule.test(password)||password.length<6||password.length>10){
//			alert('密码格式错误');
		errorMsgHint.style.display="block";
		errorMsgHint.innerText="密码格式错误";
		return false;
	}
	else return true;
}

		
		$.ajax({
			type: "post",
	        url: "/admin/login",
	        dataType: "json",
	        data: {
	            username: $("#username").val(),
	            password: $("#password").val(),
	            checkbox: checkbox,
	        },
	        success: function (data) {
	            if (data.success != null && data.success == false){
	            	 console.log(data);
	            	var errorMsgHint=document.getElementById("errorMsg");
	            	errorMsgHint.style.display="block";
	            	errorMsgHint.innerText=data.error;
	            	toast(data.error);
	                return false;
	            } else {
	            	var errorMsgHint=document.getElementById("errorMsg");
	            	errorMsgHint.style.display="none";
 		            setTimeout(function () {
 		                window.location.href = "/admin/index";
 		            }, 1000);
	            }
	        },
	        error: function (data) {

	        }
		});



