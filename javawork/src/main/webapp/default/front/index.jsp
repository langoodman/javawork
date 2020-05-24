<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="layout/header.jsp" %>
<%--wsy修改首页  --%>
<%--添加友情连接 --%>
<style>
.friendli
{
float: left;
position: relative;
height: 30px;
line-height: 30px;
margin: 0 10px 10px 0;
font-size: 14px;
text-align: center;
cursor: pointer;
border-radius: 5px;
}
.list
{
margin: 0;
padding: 0;
}
.friendli:hover
{
	background:#5cb85c;
}
.friendli:hover > a
{
	color:white;
}
.friendli > a
{
display: block;
padding: 0 10px;
color:#413c3c;
}
.friendli > a:hover
{
text-decoration: none;
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
	<div class="col-md-12">
		<ul style="list-style:none;" class="list">
			<li class="friendli" style="background:#5cb85c;"><a style="color:white;" disabled="disabled">友情链接<i class="glyphicon glyphicon-link"></i></a></li>
			<c:forEach var="item" items="${friendURL}">
				<li class="friendli"><a href="${item.url}" target="_blank">${item.URLName}</a></li>
			</c:forEach>
			<li class="friendli"><a href="/morefriendurl">更多&gt;&gt;</a></li>
		</ul>
	</div>
</div>
<div class="row">
    <div class="col-md-9">
        <div class="panel panel-default">
            <div class="tab panel-heading">
                <ul class="nav nav-pills" id="tab">
                    <li class="all"><a href="/?tab=all">全部</a></li>
                    <li class="hot"><a href="/?tab=hot">最热</a></li>
                    <li class="new"><a href="/?tab=new">最新</a></li>
                    <li class="lonely"><a href="/?tab=lonely">无人问津</a></li>
                </ul>
            </div>
            <%--wsy修改话题展示样式 --%>
            <div class="panel-body paginate-bot">
                <c:forEach var="item" items="${page.list}">
                    <div class="media">
                        <c:if test="${fn:length(item.avatar) > 0}">
                            <div class="media-left">
                                <img src="${item.avatar}" class="avatar img-circle" alt="">
                            </div>
                        </c:if>
                        <div class="media-body">
                            <div class="title omit">
                                <c:choose>
                                    <c:when test="${item.url != null}">
                                        <a href="${item.url}" target="_blank">${item.title}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="/topic/${item.topicId}">${item.title}</a>
                                    </c:otherwise>
                                </c:choose>&nbsp;
                                <span style="font-size:16px;"><i class="glyphicon glyphicon-thumbs-up"></i>&nbsp;${item.postGoodCount}</span>
                            </div>
                            <div class="tip">
                                <p class="gray" style="font-size:12.5px;">
                                    <c:if test="${item.top}">
                                        <span class="label label-primary dist" style="background-color:#3f51b5eb;font-size: 14.4px;">置顶</span> <span>•</span>
                                    </c:if>
                                    <c:if test="${item.good}">
                                        <span class="label label-success dist" style="background-color:#ff5722e6;font-size:13.6px;">精华<i class="glyphicon glyphicon-fire"></i></span> <span>•</span>
                                    </c:if>
                                    <span class="dist"><a href="/n/${item.nodeTitle}" class="node">${item.nodeTitle}</a></span>
                                    <span class="dist">•</span>
                                    <strong class="dist"><a href="/user/${item.author}" style="font-size:17px;">${item.author}</a></strong>
                                    <span>•</span>
                                    <span class="dist"><fmt:formatDate type="date"
                                                          value="${item.createDate}"/></span>
                                </p>
                            </div>
                        </div>
                        <div class="media-body">
                        	<p style="font-size:15px;float:right;line-height:15px;">
                               	<c:if test="${item.viewCount >= 0}">
                                  		<!--<span class="hidden-sm hidden-xs">•</span>  -->
                                   	<span class="hidden-sm hidden-xs" style="text-align:center;display:inline-block;padding:12px;"><span style="font-size:29px;">${item.viewCount}</span><small>浏览</small></span>
                               	</c:if>
                                <!-- 评论数量 -->
                               	<c:if test="${item.replyCount >= 0}">
                                   	<span class="hidden-sm hidden-xs"><a
                                           href="/topic/${item.topicId}" style="text-align:center;display:inline-block;background:#337ab7;color:white;padding:12px;"><span style="font-size:29px;color:white;">${item.replyCount}</span><small>评论</small></a></span>
                               	</c:if>
                             </p>
                        </div>
                        <%-- <div class="media-right">
                        	<span class="badge badge-default">
                        		<a href="/topic/${item.topicId}">${item.replyCount}</a>
                        	</span>
                        </div> --%>
                        <div class="divide mar-top-5"></div>
                    </div>
                </c:forEach>
            </div>
            <div class="panel-footer" id="paginate"></div>
        </div>
    </div>
    <div class="col-md-3 hidden-sm hidden-xs">
        <div class="panel panel-default" id="session"></div>
        <!-- 今日热议帖子 -->
        <c:if test="${findHot ne null && fn:length(findHot) > 0}">
	        <div class="panel panel-default">
	            <div class="panel-heading"><span>今日热议帖子</span></div>
	            <table class="table" style="font-size: 14px;">
	                <tbody>
	                <c:forEach var="item" items="${findHot}">
	                    <tr>
	                        <c:if test="${fn:length(item.avatar) > 0}">
	                            <td width="24" valign="middle" align="center">
	                                <img src="${item.avatar}" class="avatar img-circle" border="0" align="default" style="max-width: 24px; max-height: 24px;">
	                            </td>
	                        </c:if>
	                        <td>
	                            <c:choose>
	                                <c:when test="${item.url != null}">
	                                    <a href="${item.url}">${item.title}</a>
	                                </c:when>
	                                <c:otherwise>
	                                    <a href="/topic/${item.topicId}">${item.title}</a>
	                                </c:otherwise>
	                            </c:choose>
	                        </td>
	                    </tr>
	                </c:forEach>
	                </tbody>
	            </table>
	        </div>
        </c:if>
        <!-- 今日等待回复的主题 -->
        <%-- <div class="panel panel-default">
          <div class="panel-heading"><span>今日等待回复主题</span></div>
          <table class="table" style="font-size: 14px;">
            <tbody>
            <c:forEach var="item" items="${findTodayNoReply}">
              <tr>
              <td width="24" valign="middle" align="center">
                    <a href="/user/${item.author}"><img src="${item.avatar}" class="avatar img-circle" border="0" align="default" style="max-width: 24px; max-height: 24px;"></a>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${item.url != null}">
                            <a href="${item.url}">${item.title}</a>
                        </c:when>
                        <c:otherwise>
                            <a href="/topic/${item.topicId}">${item.title}</a>
                        </c:otherwise>
                    </c:choose>
                </td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
        </div> --%>
        <!-- 积分榜 -->
        <div class="panel panel-default">
            <div class="panel-heading"><span>积分榜
                <a class="dark" href="/top100" style="float: right;">TOP 100 &gt;&gt;</a></span>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="inner top100"></div>
                </div>
            </div>
        </div>
        <!-- 热门分类 -->
        <c:if test="${nodeList2 ne null && fn:length(nodeList2) > 0}">
        	<div class="panel panel-default">
            	<div class="panel-heading"><span>热门分类</span></div>
	            <div class="panel-body">
	                <c:forEach var="item" items="${nodeList2}">
	                    <a href="${item.url}" class="item_node"><span class="layui-badge layui-bg-primary">${item.nodeTitle}</span></a>
	                </c:forEach>
	            </div>
        	</div>
        </c:if>
        <!-- 热门话题 -->
        <c:if test="${nodeList2 ne null && fn:length(nodeList2) > 0}">
        	<div class="panel panel-default">
            	<div class="panel-heading"><span>热门话题</span></div>
	            <div class="panel-body">
	                <c:forEach var="item" items="${tag.list}">
	                    <a href="/tag/${item.tag}" class="item_node"><span class="layui-badge layui-bg-primary">${item.tag}</span></a>
	                </c:forEach>
	            </div>
        	</div>
        </c:if>
        <!-- 社区运行状况 -->
        <div class="panel panel-default">
            <div class="panel-heading"><span>社区运行状况</span></div>
            <div class="cell">
                <table cellpadding="5" cellspacing="0" border="0" width="100%">
                    <tbody style="font-size: 14px;">
                    <tr>
                        <td width="80" align="right"><span class="gray">注册人数：</span></td>
                        <td width="auto" align="left"><strong>${countUserAll}</strong></td>
                    </tr>
                    <tr>
                        <td width="80" align="right" style="font-size: 14px;"><span class="gray">主题：</span></td>
                        <td width="auto" align="left"><strong>${countAllTopic}</strong></td>
                    </tr>
                    <tr>
                        <td width="80" align="right"><span class="gray">回复：</span></td>
                        <td width="auto" align="left"><strong>${countAllReply}</strong></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="/default/front/index.js"></script>
<script type="text/javascript">
    var tab = "${tab}";//父板块
    var count = ${page.totalRow};//数据总量
    var limit = ${page.pageSize};//每页显示的条数
    var url = "?tab=" + tab + "&p=";//url
    function page() {
        var page = location.search.match(/p=(\d+)/);
        return page ? page[1] : 1;
    }
    var p = page();//当前页数
    paginate(count, limit, p, url);
</script>
<%@ include file="layout/footer.jsp" %>