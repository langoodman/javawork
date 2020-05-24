<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layout/header.jsp" %>
<%--wsy修改个人主页面 --%>
<style>
.input-group
{
	margin-top:10px;
}
.join
{
	padding: 2px 4px;
	background-color: #337ab7;
	border-radius:2px;
	color:white;
	font-size:12px;
}
.omit
{
overflow:hidden; /*自动隐藏文字 */
text-overflow: ellipsis; /*文字隐藏后添加省略号 */
white-space:nowrap; /*强制不换行 */
}
.dist
{
display:inline-block;
margin-bottom:5px;
white-space:nowrap; /*强制不换行 */
}
</style>
<div class="row">
    <div class="col-md-9">
        <div class="box">
            <div class="cell">
                <table cellpadding="0" cellspacing="0" border="0" width="100%" style="margin-bottom:0px;">
                    <tbody>
                    <tr>
                        <td width="73" valign="top" align="center">
                            <img src="${user.avatar}" border="0" align="default" style="border-radius: 4px;" width="73" height="73px"/>
                            <div class="sep10"></div>
                        </td>
                        <td width="10"></td>
                        <td width="auto" valign="top" align="left">
                            <div class="fr">
                            	<c:if test="${user2 != null && user2.userId != user.userId}">
                                    <button class="btn btn-follow" onclick="save()" id="follow">加入特别关注</button>
                                    <div class="sep10"></div>
                                    <%--<button class="btn btn-warning">Block</button>
                                    	  积分  访问量  是否被封禁  主题数  评论数 收藏数
                                     --%>
                                     <span id="user2Id" style="display:none;">${user2.userId}</span>
                                     <span id="userName" style="display:none;">${user.userName}</span>
                                     <button id="delvisit" class="btn btn-primary" onclick="delVisit()" style="display: block;
   												 margin-bottom: 10px;">删除访问记录</button>
                                </c:if>
                            </div>
                            <span>
                            <h1 title="${user.userId}" id="user_id" class="user_id" style="display:inline-block;">${user.userName}</h1>
                            <button class="btn btn-warning" data-toggle="modal" data-target="#detailModal" style="display:inline-block;padding:2px 5px;vertical-align: inherit;">详细信息</button>	  
                            </span>
                            <span style="display:block;font-size:14px;">
                            	<span class="gray"><span class="join">No.${user.userId}</span> 注册会员，于</span>
                            	<span  class="gray">
                                	<fmt:formatDate type="both" value="${user.createDate}" />加入。    
                                	<div class="sep5"></div>
                            	</span>
                            </span>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="sep5"></div>
            </div>
        </div>
        <div class="sep20"></div>
        <div class="panel panel-default">
            <div class="cell_tabs">
                <div class="fl">
                    <%--<img src="${user.avatar}" width="24" style="border-radius: 24px; margin-top: -2px;" border="0"> --%>
                </div>
                <a href="javascript:void(0);" onclick="topicList()" class="cell_tab_current">主题</a>
                <a href="javascript:void(0);" onclick="replyList()" class="cell_tab">评论</a>
                <a href="javascript:void(0);" onclick="collectList()" class="cell_tab">收藏</a>
                <a href="javascript:void(0);" onclick="followList()" class="cell_tab">关注</a>
                <a href="javascript:void(0);" onclick="fansList()" class="cell_tab">粉丝</a>
                <a href="javascript:void(0);" onclick="topicQnaList()" class="cell_tab">提问</a>
            </div>
            <div class="itemList"></div>
        </div>
        <button id="toggleBigImageBtn" data-toggle="modal" class="hidden" data-target="#showBigImageModal"></button>
        <div class="modal fade" tabindex="-1" role="dialog" id="showBigImageModal">
            <div class="modal-dialog" style="width: 98%" role="document">
                <div class="modal-content">
                    <div class="modal-body text-center">
                        <img src="" id="bigImage" style="max-width: 100%;" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<%--wsy添加详细信息模态框 --%>
<div class="modal fade" id="detailModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
	<div class="modal-dialog modal-sm"> 
		<div class="modal-content"> 
			<div class="modal-header"> 
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel"><big style="color:#337ab7;">${user.userName}</big>信息</h4>
		    </div>
		    <div class="modal-body">
		    	<form> 
			    	<div class="input-group">
			    		<span class="input-group-addon" id="basic-addon1">积分 <i class="glyphicon glyphicon-stats"></i></span>
			    		<input type="text" class="form-control" aria-describedby="basic-addon1" value="${countScore}分" disabled="disabled">
			    	</div>
		    		<div class="input-group">
		    			<span class="input-group-addon" id="basic-addon2">访问 <i class="glyphicon glyphicon-eye-open"></i></span>
		    			<input type="text" class="form-control" aria-describedby="basic-addon2" value="${userCheck.visitNum}次" disabled="disabled">
		    		</div>
		    		<div class="input-group">
		    			<span class="input-group-addon" id="basic-addon3">主题 <i class="glyphicon glyphicon-tag"></i></span>
		    			<input type="text" class="form-control" aria-describedby="basic-addon3" value="${countTopic}个" disabled="disabled">
		    		</div>
		    		<div class="input-group">
		    			<span class="input-group-addon" id="basic-addon4">评论 <i class="glyphicon glyphicon-pencil"></i></span>
		    			<input type="text" class="form-control" aria-describedby="basic-addon4" value="${countReply}次" disabled="disabled">
		    		</div>
		    		<div class="input-group">
		    			<span class="input-group-addon" id="basic-addon5">收藏 <i class="glyphicon glyphicon-star"></i></span>
		    			<input type="text" class="form-control" aria-describedby="basic-addon5" value="${countCollect}次" disabled="disabled">
		    		</div>
		    		<div class="input-group">
		    			<span class="input-group-addon" id="basic-addon6">封禁 <i class="glyphicon glyphicon-ban-circle"></i></span>
		    			<c:if test="${userCheck.status == 0 }">
		    				<input type="text" class="form-control" aria-describedby="basic-addon6" value="是" disabled="disabled">
		    			</c:if>
		    			<c:if test="${userCheck.status == 1 }">
		    				<input type="text" class="form-control" aria-describedby="basic-addon6" value="否" disabled="disabled">
		    			</c:if>
		    		</div>
		    		<div class="input-group">
		    			<span class="input-group-addon" id="basic-addon7">性别 <i class="glyphicon glyphicon-user"></i></span>
		    			<input type="text" class="form-control" aria-describedby="basic-addon7" value="${user.userSex}" disabled="disabled">
		    		</div>
		    		<div class="input-group">
		    			<c:forEach items="${groupList}" var="group">
		                 	<c:if test="${userCheck.groupId == group.groupId }">
		                 		<span class="input-group-addon" id="basic-addon8">组别 <i class="glyphicon glyphicon-align-justify"></i></span>
		    					<input type="text" class="form-control" aria-describedby="basic-addon8" value="${group.groupName}" disabled="disabled">
		    				</c:if>         
	                	</c:forEach>
		    		</div>
		    	</form>
		    </div>
		    <div class="modal-footer"> 
		    	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		    	<%-- <button type="button" class="btn btn-primary">提交更改</button>--%>
		    </div>
		</div><!-- /.modal-content --> 
	</div><!-- /.modal --> 
</div>
<script src="/default/front/user/js/view.js"></script>
<script>
function delVisit()
{
	var noticeAuthorId=$("#user2Id").text();
	var targetAuthorName=$("#userName").text();
	var delbtn=document.getElementById("delvisit");
	$("#delvisit").attr("disabled","true"); 
	$.ajax({
        url: '/user/notice/delvisit',
        type: 'post',
        async: true,
        cache: false,
        dataType: 'json',
        data: {
        	noticeAuthorId:noticeAuthorId,
        	targetAuthorName:targetAuthorName,
        },
        success: function (data) {
            if (data.success != null && data.success == true) {
            	delbtn.innerHTML=data.error;
            } else {
                delbtn.innerHTML=data.error;
            }
        }
    });
}
</script>
<%@ include file="../layout/footer.jsp" %>