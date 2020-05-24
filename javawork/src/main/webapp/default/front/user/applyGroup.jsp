<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns:th="http://www.thymeleaf.org">
<%@ include file="../layout/header.jsp" %>
<%--wsy创建组别申请页面 --%>
<div class="col-md-3 hidden-sm hidden-xs">
    <div class="panel panel-default">
        <div class="list-group" style="font-weight:700;text-align:center;">
            <a href="/user/settings/profile" class="list-group-item ">个人设置</a>
            <a href="/user/settings/changeAvatar" class="list-group-item">修改头像</a>
            <a href="/user/settings/changePassword" class="list-group-item ">修改密码</a>
            <a href="/user/settings/applyGroup" class="list-group-item active">申请组别</a>
            <!-- <a href="/user/settings/accessToken" class="list-group-item ">用户令牌</a> -->
            <!-- <a href="/user/settings/log" class="list-group-item ">日志记录</a> -->
        </div>
    </div>
</div>
<div class="col-md-9">
    <div class="panel panel-default">
        <div class="panel-heading"><a href="/">主页</a> / 申请组别</div>
        <div class="panel-body">
                <div class="form-group">
                    <c:if test="${userCheck.groupId !=1 }">
                    	 <label for="nowGroup">您现在的组别为：</label>
                    	 <c:forEach items="${groupList}" var="group" begin = "1">
                    	 	<c:if test="${userCheck.groupId == group.groupId }">
                    	 		<input type="text" class="form-control" id="nowGroup" name="nowGroup" disabled="disabled" value="${group.groupName}">
                    	 	</c:if>
		                  </c:forEach>
                    	 <p>您已经修改过组别，如果有修改组别的需要，请联系现任组长。</p>
                    </c:if>
                    <c:if test="${userCheck.groupId ==1 }">
                    	<label>申请组别：</label>
	                	<select id = "groupreal_id" name="group" class="selectpicker form-control" style="display:inline-block">
		                  	<c:forEach items="${groupList}" var="group" begin="1" >
			              		<option id="group" value="${group.groupId}"/>${group.groupName}</option>
		                  	</c:forEach>
		            	</select>
		            	<button id="btn" class="btn btn-primary" type="button" style="float:right;margin-top:20px;">申请组别</button>
                    </c:if>
                </div>
                <input  class="form-control" id="userId" value="${user.userId}" style="display:none;">
		</div>
    </div>
</div>
<script type="text/javascript">
$(function () {
    $("#btn").click(function(){
	   	var group_id = $("#groupreal_id").find("option:selected").val();
        if (!group_id) {
            alert('请选择申请的组别');
            return false;
        }
        $.ajax({
            url: '/user/setting/applyGroup',
            type: 'post',
            async: true,
            cache: false,
            dataType: 'json',
            data: {
            	groupId:group_id,
            },
            success: function (data) {
                if (data.success != null && data.success == true) {
                    window.location.href = '/user/settings/profile';//返回到个人设置页面
                    /* setTimeout(function() {
                      window.location.href = '/logout';
                    }, 2000); */
                } else {
                    alert(data.error);
                }
            }
        });
        return false;
    })
})
</script>
<%@ include file="../layout/footer.jsp" %>