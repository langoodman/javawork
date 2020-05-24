<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layout/header.jsp" %>
<%--wsy修改通知系统页面样式 --%>
<style>
.noticetag
{
	display: inline-block;
	height: 20px;
	line-height: 18px;
	padding: 0 5px;
	color:#4d4d4d;
	font-size: 12px;
	text-align: center;
	background-color:#fff;
	border: 1px solid #e0e0e0;
	vertical-align: top;
}
.media span
{
	color:#000000c2;
	font-size:15px;
}
.media-info
{
	margin: 15px auto;
	padding: 15px;
	background-color:#f7f7f7;
	font-size: 14px;
	color:#4d4d4d;
	line-height: 22px;
}
</style>
<div class="row">
    <div class="col-md-9">
        <div class="panel panel-default">
            <div class="panel-heading">
                <a href="/" style="color: #778087;">主页</a><span class="chevron">&nbsp;›&nbsp;</span>通知系统
                <span  class="pull-right" style="color:#1976d2;font-size:14px;">
                	<span style="border-right:1px gray solid;padding:0px 10px;">总共收到通知 ${countByAuthor}</span>
                	<%--这里要加一个模态框 --%>
                	<a style="padding-left:10px;display:inline-block;cursor:pointer;" data-toggle="modal" data-target="#delAll">清空所有消息</a>
                </span>
            </div>
            <div class="panel-body">
                <c:forEach var="item" items="${page.list}">
                	<c:if test="${item.noticeTitle eq 'visitNotice'}">
                		<div class="media">
                			<span class="noticetag">访问</span>
                			<span>访问消息通知</span>
                			<%--这里要加一个模态框 --%>
                			<span style="float:right;"><fmt:formatDate type="date" value="${item.createDate}"/>
                				<span class="glyphicon glyphicon-trash" style="margin-left:15px;" data-toggle="modal" data-target="#delOne" data-noticeid="${item.noticeId}"></span>
                			</span>
                			<div class="media-info">
                				<div class="media-left">
	                            	<img src="${item.avatar}" class="avatar-sm img-circle">
	                        	</div>
		                        <div class="media-body" >
		                            <div class="gray">
		                            	<a href="/user/${item.noticeAuthorName}" class="label label-primary" style="background-color:#3f51b5eb;">${item.noticeAuthorName}</a>
		                                	于 <fmt:formatDate type="both" value="${item.createDate}"/> 偷偷查看了你的主页.
		                                <span style="float:right;color:#3f51b5eb;"><i class="glyphicon glyphicon-eye-open"></i></span>
		                            </div>
		                        </div>
                			</div>         
                    	</div>
                    </c:if>
                    <c:if test="${item.noticeTitle eq 'replyNotice'}">
                    	<div class="media">
                    		<span class="noticetag">评论</span>
                			<span>评论消息通知</span>
                			<%--这里要加一个模态框 --%>
                			<span style="float:right;">
                				<fmt:formatDate type="date" value="${item.createDate}"/>
                				<span class="glyphicon glyphicon-trash" style="margin-left:15px;" data-toggle="modal" data-target="#delOne" data-noticeid="${item.noticeId}"></span>
                			</span>
	                    	<div class="media-info">
	                    		<div class="media-left">
	                            	<img src="${item.avatar}" class="avatar-sm img-circle">
	                        	</div>
		                        <div class="media-body">
		                            <div class="gray">
		                                <a href="/user/${item.noticeAuthorName}" class="label label-primary" style="background-color:#3f51b5eb;">${item.noticeAuthorName}</a>
		                                	于 <fmt:formatDate type="both" value="${item.createDate}"/> 在帖子
		                                <a href="/topic/${item.topicId}" class="label label-primary" style="background-color:#3f51b5eb;">${item.title}</a>
		                                	里评论了你。
		                                <span  style="float:right;color:#3f51b5eb;"><i class="glyphicon glyphicon-edit"></i></span>
		                            </div>
		                            <div class="payload" style="background-color:white;">${item.noticeContent}</div>
		                        </div>
	                    	</div>
                    	</div>
                    </c:if>
                </c:forEach>
            </div>
            <div class="panel-footer" id="paginate"></div>
        </div>
    </div>
    <div class="col-md-3 hidden-sm hidden-xs">
        <div class="panel panel-default" id="session"></div>
    </div>
</div>

<%--wsy创建删除信息的确定模态框 --%>
<%--删除全部信息 --%>
<div class="modal fade" id="delAll" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
	<div class="modal-dialog modal-sm"> 
		<div class="modal-content"> 
		    <div class="modal-body" style="margin-top:10px;">您确定清空所有的系统消息？</div>
		    <div class="modal-footer" style="border-top: none;"> 
		    	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		    	<button type="button" class="btn btn-primary" onclick="delAll()">确定</button>
		    </div>
		</div>
	</div>
</div>
<%--删除一条信息 --%>
<div class="modal fade" id="delOne" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
	<div class="modal-dialog modal-sm"> 
		<div class="modal-content"> 
		    <div class="modal-body" style="margin-top:10px;">您确定此条的系统消息？</div>
		    <div class="modal-footer" style="border-top: none;"> 
		    	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
		    	<button type="button" class="btn btn-primary" onclick="delOne()">确定</button>
		    </div>
		</div>
	</div>
</div>

<script type="text/javascript">
    // 数据总量
    var count = ${page.totalRow};
    // 每页显示的条数
    var limit = ${page.pageSize};
    // url
    var url = "/notification/list?p=";
    function page() {
        var page = location.search.match(/p=(\d+)/);
        return page ? page[1] : 1;
    }

    var p = page();//当前页数
    paginate(count, limit, p, url);
    
    var noticeId;
    $('#delOne').on('show.bs.modal', function (event) {
    	var button = $(event.relatedTarget);
    	noticeId = button.data('noticeid');
    })
    //wsy设置模态框js
    function delOne()
    {
    	$.ajax({
            url: '/user/notice/delone',
            type: 'post',
            async: true,
            cache: false,
            dataType: 'json',
            data: {
            	noticeId:noticeId,
            },
            success: function (data) {
                if (data.success != null && data.success == true) {
                    window.location.href = '/notification/list';//重新跳转
                    /* setTimeout(function() {
                      window.location.href = '/logout';
                    }, 2000); */
                } else {
                    alert(data.error);
                }
            }
        });
    }
    function delAll() {
    	$.ajax({
            url: '/user/notice/delall',
            type: 'post',
            async: true,
            cache: false,
            dataType: 'json',
            data: {
            	
            },
            success: function (data) {
                if (data.success != null && data.success == true) {
                    window.location.href = '/notification/list';//重新跳转
                    /* setTimeout(function() {
                      window.location.href = '/logout';
                    }, 2000); */
                } else {
                    alert(data.error);
                }
            }
        });
	}
</script>
<%@ include file="../layout/footer.jsp" %>