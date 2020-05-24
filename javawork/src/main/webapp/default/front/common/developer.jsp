<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layout/header.jsp" %>
<%--ljy 完善页面内容 --%>
<style>
h1{
	margin-top: 0px;
	text-align:center;
	font-size:26px;
	font-weight:500;
}
h4{
	font-size:22px;
	font-weight:500;
}
</style>
<div class="row">
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <a href="/">主页</a> / 开发人员
            </div>
            <div class="panel-body" style="color: #333;">
                <h1 style="margin-top: 0px;">开发人员</h1>
                  <h4>开发人员名单：</h4>
                  <p>吴恒 &nbsp;&nbsp;&nbsp; 孙超 &nbsp;&nbsp;&nbsp; 胡智杰 &nbsp;&nbsp;&nbsp; 吴天赐 &nbsp;&nbsp;&nbsp; 王赛雅 &nbsp;&nbsp;&nbsp; 李婧旖</p>
                  </br>
                  <p>之后的开发人员可以在此页写上自己的名字。</p>
            </div>
        </div>
    </div>
</div>
<%@ include file="../layout/footer.jsp" %>