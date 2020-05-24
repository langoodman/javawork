
//按时间排序
//评论textarea框
function commentfocus1(k){
	var commentBtns1Id="#commentBtns1"+k;
	$(commentBtns1Id).show();
}
function commentblur1(k){
	var commentBtns1Id="#commentBtns1"+k;
	var commentText1Id="#commentText1"+k;
	var commentText=$(commentText1Id).val();//评论内容
	if(commentText=="")
		$(commentBtns1Id).hide();
}
//按点赞排序
//评论textarea框
function commentfocus2(k){
	var commentBtns2Id="#commentBtns2"+k;
	$(commentBtns2Id).show();
}
function commentblur2(k){
	var commentBtns2Id="#commentBtns2"+k;
	var commentText2Id="#commentText2"+k;
	var commentText=$(commentText2Id).val();//评论内容
	if(commentText=="")
		$(commentBtns2Id).hide();
}

//按时间排序
//提交评论按钮
function submitComment1(item,k){
	var commentBtns1Id="#commentBtns1"+k;
	var commentText1Id="#commentText1"+k;
	var commentText=$(commentText1Id).val();//评论内容
	var cid=item.replyId;//对应replyId
	var rank=0;//评论rank=1，回复rank=-1
	if(commentText==""){
		$(commentBtns1Id).hide();
	}
	else{
		 $.ajax({
  		    type: "post",
  		    url: "/reply/list",
  		    dataType: "json",
  		    data: {
  		    	commentText: commentText,
  		    	cid: item.replyId,
  		    	rank:rank,
  		    },
  		    success: function (data) {
  		    	alert("是否会提交成功？")
  		        if (data.success != null && data.success == false) {
  		        	alert("评论失败");
  		        } else {
  		        	alert("评论成功");
  		        }
  		    },
  		    error: function (data) {
  		    	
  		    }
  		});			
	}
}
//取消评论按钮
function closeComment1(k){
	var commentBtns1Id="#commentBtns1"+k;
		$(commentBtns1Id).hide();
}

//按点赞排序
//提交评论按钮
function submitComment2(item,k){
	var commentBtns2Id="#commentBtns2"+k;
	var commentText2Id="#commentText2"+k;
	var commentText=$(commentText2Id).val();//评论内容
	var cid=item.replyId;//对应replyId
	var rank=0;//评论rank=1，回复rank=-1
	if(commentText==""){
		$(commentBtns2Id).hide();
	}
	else{
		 $.ajax({
  		    type: "post",
  		    url: "/reply/list",
  		    dataType: "json",
  		    data: {
  		    	commentText: commentText,
  		    	cid: item.replyId,
  		    	rank:rank,
  		    },
  		    success: function (data) {
  		    	alert("是否会提交成功？")
  		        if (data.success != null && data.success == false) {
  		        	alert("评论失败");
  		        } else {
  		        	alert("评论成功");
  		        }
  		    },
  		    error: function (data) {
  		    	
  		    }
  		});			
	}
}
//取消评论按钮
function closeComment2(k){
	var commentBtns2Id="#commentBtns2"+k;
	$(commentBtns2Id).hide();
}
//按时间排序
//点赞、踩
function thumbBtn1(replyId,k,t){
	var replyId=replyId;
	//点赞
	var thumbBtnId="thumbBtn1"+k;
	var thumbBtn=document.getElementById(thumbBtnId);
	var good=thumbBtn.value();
	var unThumbBtnId="unThumbBtn1"+k;//踩
	var unThumbBtn=document.getElementById(unThumbBtnId);
	var bad=unThumbBtn.value();
	if(good==null)//初始化value值
		good=false;
	if(bad==null)//初始化value值
		bad=false;
	if(t==1){//点赞
		if(good===false&&bad===true){
			good=true;
			bad=false;
			thumbBtn.style['background-color']="#499ef3";
			thumbBtn.style['color']="#fff";
			unThumbBtn.style['background-color']="#f5f5f5";
			unThumbBtn.style['color']="#999";
		}
		else if(good===false){
			good=true;
			thumbBtn.style['background-color']="#499ef3";
			thumbBtn.style['color']="#fff";
		}
		else if(good===true){
			good=false;
			thumbBtn.style['background-color']="#f5f5f5";
			thumbBtn.style['color']="#999";
		}
	}
	//踩
	else if(t==-1){//踩
		if(bad===false&&good===true){
			good=false;
			bad=true;
			unThumbBtn.style['background-color']="#499ef3";
			unThumbBtn.style['color']="#fff";
			thumbBtn.style['background-color']="#f5f5f5";
			thumbBtn.style['color']="#999";
		}
		else if(bad===false){
			bad=true;
			unThumbBtn.style['background-color']="#499ef3";
			unThumbBtn.style['color']="#fff";
		}
		else if(bad===true){
			bad=false;
			unThumbBtn.style['background-color']="#f5f5f5";
			unThumbBtn.style['color']="#999";
		}
	}
	
	$.ajax({
		    type: "post",
		    url: "/reply/list",
		    dataType: "json",
		    data: {
		    	replyId: replyId,
		    	good: thumbBtn.value(),
		    	bad: unThumbBtn.value(),
		    },
		    success: function (data) {
		        if (data.success != null && data.success == false) {
		        	if(good)
		        		alert("点赞失败");
		        	else if(bad)
		        		alert("踩失败");
		        } 
		    },
		    error: function (data) {
		    	
		    }
		});			
}
//评论
function commentClick1(k){
	var commentBtnId="commentBtn1"+k;
	var commentBtn=document.getElementById(commentBtnId);
	var commentNum="commentList1"+k;
	var commentList=document.getElementById(commentNum);
	if(commentList.style.display == "none"){
		commentBtn.style['background-color']="#499ef3";
		commentBtn.style['color']="#fff";
		commentList.style.display = "block";
	}else{
		commentBtn.style['background-color']="#f5f5f5";
		commentBtn.style['color']="#999";
		commentList.style.display = "none";
	}
}
//未登录 点击评论
function commentClick1_1(k){
	var commentBtnId="commentBtn1_1"+k;
	var commentBtn=document.getElementById(commentBtnId);
	var commentNum="commentList1_1"+k;
	var commentList = document.getElementById(commentNum);
	if(commentList.style.display == "none"){
		commentBtn.style['background-color']="#499ef3";
		commentBtn.style['color']="#fff";
		commentList.style.display = "block";
	}else{
		commentBtn.style['background-color']="#f5f5f5";
		commentBtn.style['color']="#999";
		commentList.style.display = "none";
	}
}

//按点赞排序
//点赞、踩
function thumbBtn2(replyId,k,t){
	var replyId=replyId;
	//点赞
	var thumbBtnId="thumbBtn2"+k;
	var thumbBtn=document.getElementById(thumbBtnId);
	var good=thumbBtn.value();
	var unThumbBtnId="unThumbBtn2"+k;//踩
	var unThumbBtn=document.getElementById(unThumbBtnId);
	var bad=unThumbBtn.value();
	if(good==null)//初始化value值
		good=false;
	if(bad==null)//初始化value值
		bad=false;
	if(t==1){//点赞
		if(good===false&&bad===true){
			good=true;
			bad=false;
			thumbBtn.style['background-color']="#499ef3";
			thumbBtn.style['color']="#fff";
			unThumbBtn.style['background-color']="#f5f5f5";
			unThumbBtn.style['color']="#999";
		}
		else if(good===false){
			good=true;
			thumbBtn.style['background-color']="#499ef3";
			thumbBtn.style['color']="#fff";
		}
		else if(good===true){
			good=false;
			thumbBtn.style['background-color']="#f5f5f5";
			thumbBtn.style['color']="#999";
		}
	}
	//踩
	else if(t==-1){//踩
		if(bad===false&&good===true){
			good=false;
			bad=true;
			unThumbBtn.style['background-color']="#499ef3";
			unThumbBtn.style['color']="#fff";
			thumbBtn.style['background-color']="#f5f5f5";
			thumbBtn.style['color']="#999";
		}
		else if(bad===false){
			bad=true;
			unThumbBtn.style['background-color']="#499ef3";
			unThumbBtn.style['color']="#fff";
		}
		else if(bad===true){
			bad=false;
			unThumbBtn.style['background-color']="#f5f5f5";
			unThumbBtn.style['color']="#999";
		}
	}
	
	$.ajax({
	    type: "post",
	    url: "/reply/list",
	    dataType: "json",
	    data: {
	    	replyId: replyId,
	    	good: thumbBtn.value(),
	    	bad: unThumbBtn.value(),
	    },
	    success: function (data) {
	        if (data.success != null && data.success == false) {
	        	if(good)
	        		alert("点赞失败");
	        	else if(bad)
	        		alert("踩失败");
	        } 
	    },
	    error: function (data) {
	    	
	    }
	});			
}
//评论
function commentClick2(k){
	var commentBtnId="commentBtn2"+k;
	var commentBtn=document.getElementById(commentBtnId);
	var commentNum="commentList2"+k;
	var commentList = document.getElementById(commentNum);
	if(commentList.style.display == "none"){
		commentBtn.style['background-color']="#499ef3";
		commentBtn.style['color']="#fff";
		commentList.style.display = "block";
	}else{
		commentBtn.style['background-color']="#f5f5f5";
		commentBtn.style['color']="#999";
		commentList.style.display = "none";
	}
}
//未登录 点击评论
function commentClick2_2(k){
	var commentBtnId="commentBtn2_2"+k;
	var commentBtn=document.getElementById(commentBtnId);
	var commentNum="commentList2_2"+k;
	var commentList = document.getElementById(commentNum);
	if(commentList.style.display == "none"){
		commentBtn.style['background-color']="#499ef3";
		commentBtn.style['color']="#fff";
		commentList.style.display = "block";
	}else{
		commentBtn.style['background-color']="#f5f5f5";
		commentBtn.style['color']="#999";
		commentList.style.display = "none";
	}
}

$(function(){
	//按时间排序
	$('#myTab a[href="#tab-1"]').click(function (e) {
		 $("#tab-1").style.display="block";
		 $("#tab-2").style.display="none";
		 e.preventDefault();
		 $('#myTab a[href="#tab-1"]').tab('show');
	});
	//按点赞排序
	$('#myTab a[href="#tab-2"]').click(function (e) {
		 $("#tab-1").style.display="none";
		 $("#tab-2").style.display="block";
		 e.preventDefault();
		 $('#myTab a[href="#tab-2"]').tab('show');
	});
	
	
	
})