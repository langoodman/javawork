//wsy添加登录页面 记住我 功能
$(function () {
    $("#form").on("click", "#btn", function () {
        var username = $("#username").val();
        var password = $("#password").val();
        //增加记住我复选框
        var checkbox = false;
        $('#form input[type="checkbox"]').each(function () {
			if($(this).is(":checked"))
			{
				checkbox = true;
			}
		});
        
        if (username.length === 0) {
            alert('用户名不能为空哦');
            return false;
        }
        if (password.length === 0) {
            alert('密码不能为空哦');
            return false;
        }
        $.ajax({
            type: "post",
            url: "/login",
            dataType: "json",
            data: {
                username: $("#username").val(),
                password: $("#password").val(),
                checkbox: checkbox,
            },
            success: function (data) {
                if (data.success != null && data.success == false) {
                	toast(data.error);
                    return false;
                } else {
                    location.href = "/";
                }
            },
            error: function (data) {
            	toast("修改失败!请稍后重试!");
            }
        });
    });
});