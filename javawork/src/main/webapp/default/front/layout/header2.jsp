<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>启明星工作室</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- 引入 Bootstrap.css,引入整个bootstrap文件 -->
    <link rel="stylesheet" href="/default/front/common/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/default/front/common/bootstrap/css/bootstrap.css">
    <%--系统 ico 图标--%>
    <link rel="shortcut icon" href="/default/front/common/font-awesome/css/font-awesome.min.css">
    <link rel="shortcut icon" href="/default/front/img/register_logo.png">
    <!-- 引入layui.css -->
    <link rel="stylesheet" href="/default/front/common/layui/css/layui.css" media="all">
    <%--富文本编辑器--%>
    <link rel="stylesheet" href="/default/front/common/wangEditor/wangEditor.min.css">
    <link rel="stylesheet" href="/default/front/common/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/default/front/common/cropper/cropper.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.38.0/codemirror.min.css">
    <%--系统全局 CSS 样式--%>
    <link rel="stylesheet" href="/default/front/common/css/app.css" type="text/css">

    <%--系统全局第三方 js 文件--%>
    <script src="/default/front/common/js/jquery.js"></script>
    <script src="/default/front/common/cropper/cropper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.38.0/codemirror.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.38.0/mode/markdown/markdown.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.38.0/addon/display/placeholder.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>
    <script src="/default/front/common/wangEditor/wangEditor.min.js"></script>
    <script src="/default/front/common/layui/layui.js"></script>
    <script src="/default/front/common/layui/layui-paginate.js"></script>

    <%--系统全局通用 js 文件--%>
    <script src="/default/front/common/js/login_info.js"></script>
    <script src="/default/front/common/js/formatDate.js"></script>
    <script src="/default/front/common/js/bootstrap.min.js"></script>
	<%--wsy修改提示框 --%>
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
                position: 'top-center', // bottom-left or bottom-right or bottom-center or top-left or top-right or top-center or mid-center or an object representing the left, right, top, bottom values
            });
        }
    </script>
</head>
<body>
<%--wrapper 开始--%>
<%--wsy美化header页面 --%>
<div class="wrapper">
    <nav class="navbar navbar-default" style="background-color: #fff;">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed"
                        data-toggle="collapse" data-target="#navbar"
                        aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" style="font-weight: 700; font-size: 27px;" href="/"><img alt="启明星工作室" src="/default/front/img/logo.png" style="margin-top:-10px;"></a>
            </div>
            <div id="navbar" class="navbar-collapse collapse header-navbar">
                <form class="navbar-form navbar-left hidden-xs hidden-sm" role="search" action="/search" method="get">
                    <div class="form-group has-feedback">
                        <input type="text" class="form-control" name="s" value="" style="width: 270px;" placeholder="搜索话题、问题或人">
                        <!-- <span class="glyphicon glyphicon-search form-control-feedback" aria-hidden="true"></span> -->
                    </div>
                </form>
					<ul class="nav navbar-nav navbar-right" style="font-size:16px;">
						<li class="hidden-xs" id="shouye"><a href="/"><span class="glyphicon glyphicon-home"></span> 首页</a></li>
						<li id="nodes"><a href="/nodes"><span class="glyphicon glyphicon-list"></span> 分类</a></li>
						<li id="biaoqian"><a href="/tags"><span class="glyphicon glyphicon-tags"></span> 话题</a></li>
						<c:choose>
							<c:when test="${sessionScope.user != null}">
								<li id="loginuser">
									<a href="/user/${sessionScope.user.userName}">
										<span class="badge" id="badge">${sessionScope.user.userName}</span>
									</a>
								</li>
								<li id="shezhili">
									<a href="/user/settings/profile">设置</a>
								</li>
								<li id="tuichuli">
									<a href="javascript:location.href='/logout'">退出</a>
								</li>
							</c:when>
							<c:otherwise>
								<li id="loginli"><a href="/login">登录</a></li>
								<li id="zhuceli"><a href="/register">注册</a></li>
							</c:otherwise>
						</c:choose>
						<li class="hidden-md hidden-lg"><a href="/topic/create">发布话题</a></li>
					</ul>
				</div>
        </div>
    </nav>
    <%--container 开始--%>
    <div class="container">
        <form class="hidden-lg hidden-md" style="margin: 0 -10px;"
              role="search" action="/search" method="get">
            <div class="form-group has-feedback" style="margin-bottom: 10px;">
                <input type="text" class="form-control" name="q" value="" placeholder="搜索问题、话题或人">
                <!-- <span class="glyphicon glyphicon-search form-control-feedback" aria-hidden="true"></span> -->
            </div>
        </form>
        <!-- <script type="text/javascript">
            $(function () {
                $.ajax({
                    type: "get",
                    url: "/session",
                    dataType: "json",
                    success: function (data) {
                        //console.log(JSON.stringify(data));
                        if (data.success != null && data.success == true) {
                            $("#loginuser").show();
                            $("#loginuser a").text(data.user);
                            $("#loginuser a").attr("href", "/user/" + data.user);
                            $("#shezhili").show();
                            $("#tuichuli").show();
                        }
                        if (data.success != null && data.success == false) {
                            $("#loginli").show();
                            $("#zhuceli").show();
                            $("#nologin").show();
                        }
                    },
                    error: function (data) {

                    }
                });
            });
        </script> -->