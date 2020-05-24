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
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 style="margin-top: 0; margin-bottom: 0px;">${tagName}
                <small>共有${pageByTag.totalRow}篇话题</small>
            </h4>
        </div>
        <%--wsy修改话题展示样式 --%>
        <div class="panel-body paginate-bot">
            <c:forEach var="item" items="${pageByTag.list}">
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
                                    <a href="${item.url}">${item.title}</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/topic/${item.topicId}">${item.title}</a>
                                </c:otherwise>
                            </c:choose>&nbsp;
                            <span style="font-size:16px;"><i class="glyphicon glyphicon-thumbs-up"></i>&nbsp;${item.postGoodCount}</span>
                        </div>
                        <div class="tip">
                            <p class="gray">
                                <span class="dist"><a href="/node/${item.nodeSlug}" class="node">${item.nodeTitle}</a></span>
                                <span class="dist">•</span>
                                <strong class="dist"><a href="/user/${item.author}" style="font-size:17px;">${item.author}</a></strong>
                                <span class="hidden-sm hidden-xs dist">•</span>
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
<script src="/default/front/tag/js/detail.js"></script>
<script type="text/javascript">
    $("#biaoqian").addClass("active");
    // 数据总量
    var count = ${pageByTag.totalRow};
    // 每页显示的条数
    var limit = ${pageByTag.pageSize};
    // url
    var url = "/tag/${tagName}?p=";

    function page() {
        var page = location.search.match(/p=(\d+)/);
        return page ? page[1] : 1;
    }

    var p = page();//当前页数
    paginate(count, limit, p, url);
</script>
<%@ include file="../layout/footer.jsp" %>