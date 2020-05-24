<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="layout/header.jsp" %>
<%--ljy微调样式--%>
<style>
.row a:link{
	text-decoration:none;
}
.row a:hover{
	text-decoration:none;
}
.row a:visited{
	text-decoration:none;
}
.row a:actived{
	text-decoration:none;
}
.label-success{
	background-color:#5cb85c;
}
</style>
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">更多链接</div>
        <div class="panel-body" style="font-size:20px;">
            <div class="row">
                <c:forEach var="item" items="${friendURL}">
                    <div class="col-md-3" style="margin-bottom: 1.5%; padding-left: 10px;">
                        <a href="${item.url}" target="_blank">
                            <span class="label label-success">${item.URLName}</span>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="panel-footer" id="paginate"></div>
    </div>
</div>
<%@ include file="layout/footer.jsp" %>