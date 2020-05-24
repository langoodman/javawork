<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layout/header.jsp" %>
<script src="/default/front/common/ckeditor/ckeditor.js"></script>
<%--wsy修改话题页面上半部分样式&&富文本编辑器   --%>
<script>
</script>
<div class="row">
    <div class="col-md-9">
        <div class="panel panel-default">
            <div class="panel-body topic-detail-header">
                <div class="media">
                    <div class="media-body">
                        <a href="/">主页</a>
                        <input type="hidden" value="${topic.topicId}" id="hidden-topicId">
                        <c:if test="${topic.nodeTitle != null}">
                            <span class="chevron">&nbsp;›&nbsp;</span>
                            <a href="/n/${topic.nodeTitle}" class="topic-detail-node">${topic.nodeTitle}</a>
                        </c:if>
                        <div class="sep10"></div>
                        <div style="border-bottom: 1px solid #eee;padding-bottom: .5em;">
                        	<c:choose>
                            <c:when test="${topic.url != null}">
                                <p style="font-size: 1.75em;line-height: 1.225;font-weight:800;"><a href="${topic.url}" target="_blank"><strong>${topic.title}</strong></a></p>
                            </c:when>
                            <c:otherwise>
                                <p style="font-size: 1.75em;line-height: 1.225;">${topic.title}</p>
                            </c:otherwise>
                        	</c:choose>
                        	<img src="${topic.avatar}" class="avatar-lg img-circle" style="max-width:30px;">
                        	<span class="author" style="font-size: 20px;"><a href="/user/${topic.author}"><strong> ${topic.author}</strong></a></span>&nbsp;&nbsp;
                        	<span style="font-size:12px;"><fmt:formatDate type="both" value="${topic.createDate}"/><strong> 提问</strong></span>&nbsp;&nbsp;
                        	<c:if test="${topic.lastReplyTime != null}">
                        		<span style="font-size:12px;"> <fmt:formatDate type="both" value="${topic.lastReplyTime}"/><strong> 回复</strong></span>
                        	</c:if>
                       	</div>
                        <p>
                        <div id="topic_${topic.topicId}_votes" class="votes" style="float:right;">
                        <span id = "upDown" style="display:none">${upDown}</span>
	                    <a href="javascript:" onclick="voteTopic(${topic.topicId},true);" id = "clickup" class="vote vote_up" title="0 赞同">
                            <li class="fa fa-chevron-up" style="font-size:15px;"></li>
					    </a>
                        <a href="javascript:" onclick="voteTopic(${topic.topicId},false);" id = "clickdown" class="vote vote_down" title="0 反对">
                            <li class="fa fa-chevron-down" style="font-size:15px;"></li>
                        </a>
                        </div>
                        <c:if test="${topic.top}">
                            <span class="label label-primary" style="background-color:#3f51b5eb;font-size:14.4px;">置顶</span>
                            <span>•</span>
                        </c:if>
                        <c:if test="${topic.good}">
                            <span class="label label-success" style="background-color:#ff5722e6;font-size:13.6px;">精华<i class="glyphicon glyphicon-fire"></i></span>
                            <span>•</span>
                        </c:if>
                        <span>${topic.viewCount}次浏览</span>
                        <span>•</span>
                        <span id="collectCount"><i class="glyphicon glyphicon-star-empty"></i>${countByTid}</span>
                        </p>
                    </div>
                    <%-- <div class="media-right">
                        <img src="${topic.avatar}" class="avatar-lg img-circle">
                    </div>--%>
                </div>
            </div>
            <div class="divide"></div>
            <div class="panel-body topic-detail-content show_big_image">
                ${topic.content}
                <div>
                    <c:forEach var="tag" items="${tags}">
                        <span class="label label-success" id="wholetag" style="display:none;">${tag}</span>
 						<div id="tags-div"></div>
                        <script>
	                    	var wholetag=document.getElementById("wholetag").innerText;
	                    	var arr=[];
	                    	arr=wholetag.split('#');
	                    	for ( var i = 0; i < arr.length ; i++ ) { 
	                    		if( arr[i] == "" ) continue;
	                    		var a = document.createElement('a');
	                    		a.setAttribute("text-decoration" , "none");
	                    		a.setAttribute("href" , "/tag/" + arr[i]);
	                    		var span = document.createElement('span');
	                    		span.className = "label label-success";
	                    		span.setAttribute("margin-left" , "5px");
	                    		span.innerHTML = arr[i];
	                    		a.appendChild(span);
	                    		$("#tags-div").append(a);
	                    		$("#tags-div").append(" ");
	                    	}
	                    </script>
                    </c:forEach>
                </div>
            </div>
            <div class="panel-footer" style="display: none" id="collect">
            	<a href="javascript:void(0);" class="collectTopic" onclick="save()"></a>
            	<a href="javascript:window.open('http://service.weibo.com/share/share.php?url=https://ctguqmx.cn/topic/${topic.topicId}?r=${topic.author}&amp;title=${topic.title}', '_blank', 'width=550,height=370'); recordOutboundLink(this, 'Share', 'weibo.com');" style="float:right;">分享<img src="/default/front/img/weibo01.jpg" style="max-width:18px;"></a>
            </div>
        </div>
        <c:if test="${topic.replyCount == 0}">
            <div class="panel panel-default">
                <div class="panel-body text-center">目前暂无评论</div>
            </div>
        </c:if>
        <c:if test="${topic.replyCount > 0}">
            <jsp:include page="../reply/list.jsp"></jsp:include>
        </c:if>
        
        <div class="panel panel-default" id="pinglun" style="display: none">
            <div class="panel-heading">
                添加一条新评论&nbsp;
                <a href="javascript:void(0);" onclick="switchEditor(this)" style="color: #66afe9">
                    <small id="editor-type">Markdown编辑器</small>
                </a>
            </div>
            <div class="panel-body">
                <%--富文本编辑器--%>
                <%-- <div id="wangEditor" class="form-group">
                    <div id="wangEditor-content" style="margin-bottom: 10px;"></div>
                </div>--%>

                <%--Markdown编辑器--%>
                <div id="codemirror" class="form-group" style="display: none;">
                    <textarea name="content"
                              id="codemirror-content"
                              class="form-control"
                              placeholder="内容，支持Markdown语法">
                    </textarea>
                </div>
				<div id="ckeditor">
				</div>
				<script>
				var ckeditor=CKEDITOR.replace('ckeditor');
				</script>
                <button type="button" id="wangEditor-btn" class="btn btn-primary" style="margin-top: 15px;">评论</button>
                <button type="button" id="codemirror-btn" class="btn btn-primary" style="display: none;margin-top: 15px;">评论</button>
                <div class="fr"><a href="/" style="margin-top: 20px;display: inline-block;">← 主页</a></div>
            </div>
        </div>
    </div>
    <div class="col-md-3 hidden-sm hidden-xs">
    <%--wsy消除未登录边框修改 --%>
    <c:if test="${user.userName!=null}">
        <div class="panel panel-default noborder" id="session" style="display:block;"></div>
    </c:if>
    </div>
</div>
<script src="/default/front/topic/js/view.js"></script>
<script type="text/javascript">

    // 数据总量
    var count = ${replyPage.totalRow};
    //每页显示的条数
    var limit = ${replyPage.pageSize};
    //url
    var url = "/topic/${topic.topicId}?p=";

    function page() {
        var page = location.search.match(/p=(\d+)/);
        return page ? page[1] : 1;
    }

    var p = page();//当前页数
    paginate(count, limit, p, url);

</script>
<%@ include file="../layout/footer.jsp" %>