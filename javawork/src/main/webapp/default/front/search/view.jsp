<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layout/header.jsp" %>
<%--wsy修改话题显示列表样式 --%>
<style>
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
        <div class="panel panel-default">
            <div class="panel-heading">搜索结果</div>
            <div class="panel-body paginate-bot">
                <c:forEach var="item" items="${pageLike.list}">
                    <div class="media" id="topic">
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
	                            	<c:if test="${item.top}" >
                                        <span class="label label-primary dist" style="background-color:#3f51b5eb;font-size:14.4px;">置顶</span> <span>•</span>
                                    </c:if>
                                    <c:if test="${item.good}">
                                        <span class="label label-primary dist" style="background-color:#ff5722e6;font-size:13.6px;">精华<i class="glyphicon glyphicon-fire"></i></span> <span>•</span>
                                    </c:if>
	                                <span class="dist"><a href="/node/${item.nodeSlug}" class="node">${item.nodeTitle}</a></span>
	                                <span class="dist">•</span>
	                                <strong class="dist"><a href="/user/${item.author}" style="font-size:17px;">${item.author}</a></strong>
	                                <span class="hidden-sm hidden-xs">•</span>
	                                <span class="dist"><fmt:formatDate type="date" value="${item.createDate}"/></span>
	                                <c:if test="${item.lastReplyAuthor != null}">
	                                </c:if>
	                            </p>
                        	</div>
                    	</div> 
	                    <div class="media-body">
	                    	<p style="font-size:15px;float:right;line-height:15px;">
	                    		<span class="hidden-sm hidden-xs" style="text-align:center;display:inline-block;padding:12px;"><span style="font-size:29px;">${item.viewCount}</span><small>浏览</small></span>
	                    		<span class="hidden-sm hidden-xs"><a href="/topic/${item.topicId}" style="text-align:center;display:inline-block;background:#337ab7;color:white;padding:12px;"><span style="font-size:29px;color:white;">${item.replyCount}</span><small>评论</small></a></span>
	                    	</p>
	                    </div>
                        <div class="divide mar-top-5"></div>
                    </div>
                </c:forEach>
            </div>
            <div class="panel-footer" id="paginate"></div>
        </div>
    </div>
</div>
<script src="/default/front/search/js/search.js"></script>
<script type="text/javascript">
    var search = "${search}";
    // 数据总量
    var count = ${pageLike.totalRow};
    // 每页显示的条数
    var limit = ${pageLike.pageSize};
    // url
    var url = "/search?s=" + search + "&p=";

    function page() {
        var page = location.search.match(/p=(\d+)/);
        return page ? page[1] : 1;
    }

    var p = page();//当前页数
    paginate(count, limit, p, url);
</script>
<%@ include file="../layout/footer.jsp" %>