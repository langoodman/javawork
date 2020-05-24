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
</style>
<div class="row">
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <a href="/">主页</a> / 问题反馈
            </div>
            <div class="panel-body" style="color: #333;">
              <h1 >问题反馈</h1>
              <p>工作室成员会长期维护该网站，若您在使用本网站的过程中遇到问题或者产生新的想法功能，请在这里留下您宝贵的意见。您的意见是我们不断改进的动力。</p>
                <form id="feedback_add" enctype="multipart/form-data" method="post" action="/feedback/add">
            	 	<div class="form-group">
           	 		  <p>问题描述：</p>
                	  <textarea name="info" id="info" class="form-control" rows="3"></textarea>
            		</div>
                    <button type="button" class="btn btn-primary" id="feedback_add_btn">提交</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="/default/front/common/js/feedback.js"></script>
<%@ include file="../layout/footer.jsp" %>
