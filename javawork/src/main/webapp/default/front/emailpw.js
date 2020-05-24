//wsy添加提交信息函数
$(function () {
    $("#form").on("click", "#btn", function () {
        var email = $("#email").val();
        var checkcode = $("#checkcode").val();
        var password = $("#newPassword").val();
        var confirmpassword = $("#confirmPassword").val();
        console.log(password);
        if (email.length === 0) {
        	toast('邮箱不能为空');
            return false;
        }
        if (checkcode.length === 0) {
        	toast('验证码不能为空');
            return false;
        }
        if (password.length === 0) {
        	toast('新密码不能为空');
            return false;
        }
        if (password.length < 6){
        	toast('密码长度不能少于6位');
        	return false;
        }
        if (password.length > 15){
        	toast('密码长度不能超过15位');
        	return false;
        }
        if (confirmpassword!=password){
        	toast('两次输入密码不匹配');
        	return false;
        }
        $.ajax({
            type: "post",
            url: "/resetpass",
            dataType: "json",
            data: {
                email:email,
                password:password,
                checkcode:checkcode,
            },
            success: function (data) {
                if (data.success != null && data.success == true) {
                	//toast('设置成功');
                	location.href = "/login";
                } else {
                	toast(data.error);
                    return false;
                }
            },
            error: function (data) {
            	toast("修改失败!请稍后重试!");
            }
        });
    });
});