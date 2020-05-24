<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--ljy添加按时间、点赞数量排序+点赞、回复功能--%>
<style>
.floor{
	font-size:13px;
	color:#ccc;
}
.rankStyle a{
	color:#666 !important;
	display:inline-block;
	line-height:100%;
	padding: 5px 10px;
	border-bottom:2px solid #fff;
	text-decoration:none;
}
.rankStyle a:visited{
	color:#666 !important;
	display:inline-block;
	line-height:100%;
	padding: 5px 10px;
	border-bottom:2px solid #fff;
	text-decoration:none;
	font-weight:bold;
}
.rankStyle a:hover{
	color:#333333 !important;
	display:inline-block;
	line-height:100%;
	padding: 5px 10px;
	border-bottom:2px solid #155faa;
	text-decoration:none;
	font-weight:bold;
}
.rankStyle a:active{
	color:#333333 !important;
	display:inline-block;
	line-height:100%;
	padding: 5px 10px;
	border-bottom:2px solid #155faa;
	text-decoration:none;
	font-weight:bold;
}
.rankStyle .active a{
 	color:#333333 !important;
	display:inline-block;
	line-height:100%;
	padding: 5px 10px;
	border-bottom:2px solid #155faa;
	text-decoration:none;
	font-weight:bold;
}
.spStyle a{
	height:28px;
	line-height:28px;
	display:inline-block;
	float:left;
	padding:0 10px;
	border-radius:4px;
	margin-right:5px;
	background-color:#f5f5f5;
	color:#999;
	text-decoration:none;
	
}
.spStyle a:hover{
	background-color:#499ef3 !important;
	border-radius:4px !important;
	color:#fff !important;
	text-decoration:none !important;
}
.spStyle a:active{
	background-color:#499ef3;
	border-radius:4px;
	color:#fff;
	text-decoration:none;
}
.spStyle_1 a{
	height:28px;
	line-height:28px;
	display:inline-block;
	float:left;
	padding:0 10px;
	border-radius:4px;
	margin-right:5px;
	background-color:#f5f5f5;
	color:#999;
	text-decoration:none;
	
}
.bStyle{
	font-size:15px;
	font-weight:500;
}
.commentListBlock{
	position:relative;
	margin:10px auto;
	border:1px solid #e6e6e6;
	border-radius:4px;
	background-color:#fff;
}
.commentList{
	padding:15px 15px 0 15px;;
	border-bottom:1px solid #f2f2f2; 
}
.noneComment{
	padding:0 10px 10px 10px;
	font-size:12px;
	color:#666;
}
.wComment{
	background-color:#fafafa;
	padding:15px;
}
.commentBtn{
	overflow:hidden;
	margin-top:10px;
}
.btn-mini{
	min-width:64px;
	height:25px;
	padding:0px 10px;
	line-height:25px;
	font-size:13px;
	margin-left:10px;
}
.btn-success:hover{
	color:#ccc !important;
}
.btn-success:active{
	color:#ccc !important;
}
.btn-gray{
	border:none !important;
	background-color:#eee;
}
.btn-gray:hover{
	background-color:#e6e6e6;
	color:#999;	
}
.btn-gray:active{
	background-color:#d9d9d9;
}
.ago{
	font-size:11px;
	color:#666;
	cursor:auto;
}
.commentsUl{
	padding:0px;
	margin:0px;
}
.commentli{
	position:relative;
	padding:0px 0 15px 42px;
	line-height:22px;
}
.commentUsername{
	font-size:12px;
	line-height:20px;
}
.commentUserAvatarLink{
	position:absolute;
	left:0;	
}
.commentUserAvatar{
	weight:32px;
	height:32px;
	border-radius:4px;
}
.commentDate{
	font-size:12px;
	color:#666;
}
.commentContent{
	font-size:12px;
	color:#666;
	margin:0px;
}
.noneInput{
	display:none;
	color:#fafafa;
	border:1px solid #fafafa;
}

.delOrRepBtn a{
	font-size:12px;
	color:#155faa;
	text-decoration:none;
	curson:pointer;
}
</style>

<div class="panel panel-default" id="reply">
    <div class="cell"><span class="gray">${topic.replyCount} 回复</span>
    	<div class="pull-right rankStyle">
        	<ul class="nav nav-tabs" role="tablist" id="mytab">
	        	<li class="active" style="margin-bottom:0px;">
	          	   <span>
	          		 <a href="#tab-1" id="timeRank" role="tab" data-toggle="tab" style="margin-right:5px;">时间
	          		  <span class="glyphicon glyphicon-sort-by-attributes"></span>
	          		 </a>
	          	   </span>
	        	</li>
	        	<li style="margin-bottom:0px;">
	          	  <span>
	          	    <a href="#tab-2" id="goodRank" role="tab" data-toggle="tab">点赞
	          		  <span class="glyphicon glyphicon-sort-by-attributes-alt"></span>
	          		</a>
	          	  </span>
	        	</li>
        	</ul>
      	</div>
    </div>
    <%int i = 1,j = 1;%>
    <div class="tab-content">
    <%--按时间排序--%>
    <div class="tab-pane active" id="tab-1">
    <c:forEach var="item" items="${replyPage.list}">
        <div id="r_${item.replyId}" class="cell" style="padding-bottom: 0px;" role="tabpanel">
            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="pinglun_table" style="margin-bottom:15px;">
                <tbody>
                <tr>
                    <td width="48" valign="top" align="center">
                        <a href="/user/${item.replyAuthorName}">
                            <img src="${item.avatar}" class="user-avatar img-circle" alt=""/>
                        </a>
                    <td width="10" valign="top"></td>
                    <td width="auto" valign="top" align="left">
                        <div class="fr"> &nbsp; &nbsp; <span class="floor" style="color:#666;">第<%=i++%>楼</span></div>
                        <div class="sep3"></div>
                        <strong>
                            <a href="/user/${item.replyAuthorName}" class="dark">${item.replyAuthorName}</a>
                        </strong>&nbsp;
                        <span class="formate-date-reply ago">
                            <fmt:formatDate type="both" dateStyle="medium" timeStyle="short" value="${item.createDate}"/>
                        </span>
                        <div class="sep5"></div>
                        <div class="reply_content">${item.replyContent}</div>
                    </td>
                </tr>
                </tbody>
                <%--已登录 --%>
                <c:if test="${user.userName!=null}">
                <tfoot>
                  <tr>
                  <td width="48" valign="top" align="center"></td>
                  <td width="10" valign="top"></td>
                  <td width="auto" valign="top" align="left">
                  <%--点赞、踩--%>
                    <span class="spStyle" id="thumbBtns">
                	  <a href="javascript:;" id="thumbBtn1<%=(i-1)%>" onclick="thumbBtn1(${item.replyId},<%=(i-1)%>,1)">
                	  	<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
                	  	<b class="bStyle">${item.replyGoodCount}</b>
                	  </a>
                	  <a href="javascript:;" id="unThumbBtn1<%=(i-1)%>" onclick="thumbBtn1(${item.replyId},<%=(i-1)%>,-1)">
                	  	<i class="fa fa-thumbs-o-down" aria-hidden="true"></i>
                	  	<b class="bStyle">${item.replyBadCount}</b>
                	  </a>
                	 </span>
                	 <%--评论--%>
                	 <span class="spStyle">
                	   <a href="javascript:;" id="commentBtn1<%=(i-1)%>" onclick="commentClick1(<%=(i-1)%>)" >
                	  	 <i class="fa fa-commenting-o" aria-hidden="true"></i>
                	  	 <b class="bStyle">${item.total}</b>
                	   </a>
                	 </span>
                  </td>
                </tr>
                <tr>
                	<td width="48" valign="top" align="center"></td>
                    <td width="10" valign="top"></td>
                    <td width="auto" valign="top" align="left" id="commentList1<%=(i-1)%>" style="display:none;">
                	 <div class="commentListBlock">
                	   <div class="commentList">
                	   	 <c:if test="${item.total==0}">
                		  <div class="noneComment" align="center">暂无评论</div>
                		 </c:if>
                		 <c:if test="${item.total!=0}">
                		   <ul class="commentsUl">
                		   	<li class="commentli">
                		   		<a class="commentUserAvatarLink">
                		   		  <img src="${item.avatar}" class="commentUserAvatar">
                		   		</a>
                		   		<div>
                		   		  <div>
	                		   		  <span class="pull-right delOrRepBtn">
	                		   		  	<a href="#" onclick="return false">删除</a>
	                		   		  	   
										<a href="#" onclick="return false">回复</a>
	                		   		  </span>
	                		   		  <a href="" class="commentUsername">某某某</a>
	                		   		  <span class="commentDate"> • 2020-02-23 22:15</span>
                		   		  </div>
                		   		  <p class="commentContent">You look really cute today!!</p>
                		   		</div>
                		   	</li>
                		   </ul>
                		 </c:if>
                	   </div>
                	    <div>
                	      <div class="wComment">
                	         <div>
	                	       <textarea class="form-control" rows="2" name="message" placeholder="评论一下..." id="commentText1<%=(i-1)%>" onfocus="commentfocus1(<%=(i-1)%>)" onblur="commentblur1(<%=(i-1)%>)" style="overflow: hidden; overflow-wrap: break-word; resize: none; height: 33.6px;"></textarea>
	                	      	<div class="commentBtn" style="display:none;" id="commentBtns1<%=(i-1)%>">
	                	      	  <span class="pull-right">
	                	      		<a class="btn btn-mini btn-success" style="color:#fff;" onclick="submitComment1(${item},<%=(i-1)%>)">评 论</a>
	                	      		<a class="btn btn-mini btn-gray" style="color:#999;" onclick="closeComment1(<%=(i-1)%>)">取 消</a>
	                	      	  </span>
	                	      	</div>
	                	      </div>
                	      </div>
                	    </div>
                	  </div>
                	 </td>
                </tr>
                </tfoot>
                </c:if>
                <%--未登录 --%>
                <c:if test="${user.userName==null}">
                <tfoot>
                  <tr>
                  <td width="48" valign="top" align="center"></td>
                  <td width="10" valign="top"></td>
                  <td width="auto" valign="top" align="left">
                  <%--点赞、踩--%>
                    <span class="spStyle_1" id="thumbBtns_1">
                	  <a href="javascript:;" id="thumbBtn1_1<%=(i-1)%>">
                	  	<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
                	  	<b class="bStyle">${item.replyGoodCount}</b>
                	  </a>
                	  <a href="javascript:;" id="unThumbBtn1_1<%=(i-1)%>">
                	  	<i class="fa fa-thumbs-o-down" aria-hidden="true"></i>
                	  	<b class="bStyle">${item.replyBadCount}</b>
                	  </a>
                	 </span>
                	 <%--评论--%>
                	 <span class="spStyle_1">
                	   <a href="javascript:;" id="commentBtn1_1<%=(i-1)%>" onclick="commentClick1_1(<%=(i-1)%>)" >
                	  	 <i class="fa fa-commenting-o" aria-hidden="true"></i>
                	  	 <b class="bStyle">${item.total}</b>
                	   </a>
                	 </span>
                  </td>
                </tr>
                <tr>
                	<td width="48" valign="top" align="center"></td>
                    <td width="10" valign="top"></td>
                    <td width="auto" valign="top" align="left" id="commentList1_1<%=(i-1)%>" style="display:none;">
                	 <div class="commentListBlock">
                	   <div class="commentList">
                		  <div class="noneComment" align="center">暂无评论</div>
                	   </div>
                	  </div>
                	 </td>
                </tr> 
                </tfoot>
                </c:if>
                
            </table>
        </div>
    </c:forEach>
    </div>
    <%--按点赞排序--%>
    <div class="tab-pane" id="tab-2">
    <c:forEach var="item" items="${replyByGood.list}">
        <div id="r_${item.replyId}" class="cell" style="padding-bottom: 0px;" role="tabpanel">
           <table cellpadding="0" cellspacing="0" border="0" width="100%" class="pinglun_table" style="margin-bottom:15px;">
	           <tbody>
	           <tr>
	               <td width="48" valign="top" align="center">
	                   <a href="/user/${item.replyAuthorName}">
	                       <img src="${item.avatar}" class="user-avatar img-circle" alt=""/>
	                   </a>
	               <td width="10" valign="top"></td>
	               <td width="auto" valign="top" align="left">
	                   <div class="fr"> &nbsp; &nbsp; <span class="floor" style="color:#666;">第<%=j++%>楼</span></div>
	                   <div class="sep3"></div>
	                   <strong>
	                       <a href="/user/${item.replyAuthorName}" class="dark">${item.replyAuthorName}</a>
	                   </strong>&nbsp;
	                   <span class="formate-date-reply ago">
	                       <fmt:formatDate type="both" dateStyle="medium" timeStyle="short" value="${item.createDate}"/>
	                   </span>
	                   <div class="sep5"></div>
	                   <div class="reply_content">${item.replyContent}</div>
	               </td>
	           </tr>
	           </tbody>
	           <%--已登录 --%>
	           <c:if test="${user.userName!=null}">
	            <tfoot>
                  <tr>
                  <td width="48" valign="top" align="center"></td>
                  <td width="10" valign="top"></td>
                  <td width="auto" valign="top" align="left">
                  	<%--点赞、踩--%>
                    <span class="spStyle">
                	  <a href="javascript:;" id="thumbBtn2<%=(j-1)%>" onclick="thumbBtn2(${item.replyId},<%=(j-1)%>,1)">
                	  	<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
                	  	<b class="bStyle">${item.replyGoodCount}</b>
                	  </a>
                	  <a href="javascript:;" id="unThumbBtn2<%=(j-1)%>" onclick="thumbBtn2(${item.replyId},<%=(j-1)%>,-1)">
                	  	<i class="fa fa-thumbs-o-down" aria-hidden="true"></i>
                	  	<b class="bStyle">${item.replyBadCount}</b>
                	  </a>
                	 </span>
                	 <%--评论--%>
                	 <span class="commentSpStyle spStyle">
                	   <a href="javascript:;" id="commentBtn2<%=(j-1)%>" onclick="commentClick2(<%=(j-1)%>)">
                	  	 <i class="fa fa-commenting-o" aria-hidden="true"></i>
                	  	 <b class="bStyle">${item.total}</b>
                	   </a>
                	 </span>
                  </td>
                </tr>
                <tr>
                	<td width="48" valign="top" align="center"></td>
                    <td width="10" valign="top"></td>
                    <td width="auto" valign="top" align="left" id="commentList2<%=(j-1)%>" style="display:none;">
                	 <div>
                	  <div class="commentListBlock">
                	    <div class="commentList">
                		  <div class="noneComment" align="center">暂无评论</div>
                	    </div>
                	    <div>
                	      <div class="wComment">
                	         <div>
	                	       <textarea class="form-control" rows="2" name="message" placeholder="评论一下..." id="commentText2<%=(j-1)%>" onfocus="commentfocus2(<%=(j-1)%>)" onblur="commentblur2(<%=(j-1)%>)" style="overflow: hidden; overflow-wrap: break-word; resize: none; height: 33.6px;"></textarea>
	                	      	<div class="commentBtn" style="display:none;" id="commentBtns2<%=(j-1)%>">
	                	      	  <span class="pull-right">
	                	      		<a class="btn btn-mini btn-success" style="color:#fff;" onclick="submitComment2(${item},<%=(j-1)%>)">评 论</a>
	                	      		<a class="btn btn-mini btn-gray" style="color:#999;" onclick="closeComment2(<%=(j-1)%>)">取 消</a>
	                	      	  </span>
	                	      	</div>
	                	      </div>
                	      </div>
                	    </div>
                	   </div>
                	  </div>
                	 </td>
                </tr>
                </tfoot>
                </c:if>
                
               <%--未登录 --%>
                <c:if test="${user.userName==null}">
                <tfoot>
                  <tr>
                  <td width="48" valign="top" align="center"></td>
                  <td width="10" valign="top"></td>
                  <td width="auto" valign="top" align="left">
                  <%--点赞、踩--%>
                    <span class="spStyle_1">
                	  <a href="javascript:;" id="thumbBtn2_2<%=(j-1)%>">
                	  	<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
                	  	<b class="bStyle">${item.replyGoodCount}</b>
                	  </a>
                	  <a href="javascript:;" id="unThumbBtn2_2<%=(j-1)%>">
                	  	<i class="fa fa-thumbs-o-down" aria-hidden="true"></i>
                	  	<b class="bStyle">${item.replyBadCount}</b>
                	  </a>
                	 </span>
                	 <%--评论--%>
                	 <span class="commentSpStyle spStyle_1">
                	   <a href="javascript:;" id="commentBtn2_2<%=(j-1)%>" onclick="commentClick2_2(<%=(j-1)%>)">
                	  	 <i class="fa fa-commenting-o" aria-hidden="true"></i>
                	  	 <b class="bStyle">${item.total}</b>
                	   </a>
                	 </span>
                  </td>
                </tr>
                <tr>
                	<td width="48" valign="top" align="center"></td>
                    <td width="10" valign="top"></td>
                    <td width="auto" valign="top" align="left" id="commentList2_2<%=(j-1)%>" style="display:none;">
                	 <div class="commentListBlock">
                	   <div class="commentList">
                		  <div class="noneComment" align="center">暂无评论</div>
                	   </div>
                	  </div>
                	 </td>
                </tr> 
                </tfoot>
                </c:if>
           </table>
        </div>
    </c:forEach>
    </div>
    </div>
    <div class="panel-footer" id="paginate"></div>
</div>

<script src="/default/front/reply/list.js"></script>