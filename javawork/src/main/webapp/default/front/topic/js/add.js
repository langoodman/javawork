/*****切换编辑器*****/
function switchEditor(type) {

    // 0：富文本编辑器
    if (type === 0){
        $("#codemirror").hide();
        $("#wangEditor").show();
        $("#codemirror-btn").hide();
        $("#wangEditor-btn").show();
    }

    // 1：Markdown 编辑器
    if(type === 1){
        $("#wangEditor").hide();
        $("#codemirror").show();
        $("#wangEditor-btn").hide();
        $("#codemirror-btn").show();
    }
}

var realtag = [];
var strtag = "";
function deltag(obj) {
    // 删除当前按钮节点所在父节点
	var tagName = obj.parentNode.firstChild.innerHTML;
	var len = realtag.length;
	for( var i = 0 ; i < len ; i++ ){
		if( realtag[i] == tagName ){
			realtag[i] = "";
			break;
		}
	}
 	obj.parentNode.remove();
 }
$(function () {

    /****** 富文本编辑器 *****/
    var E = window.wangEditor;
    var wangEditor = new E('#wangEditor-content');
    wangEditor.customConfig.uploadFileName = 'file';
    wangEditor.customConfig.uploadImgServer = '/common/upload';
    wangEditor.customConfig.menus = [
        'head',  // 标题
        'bold',  // 粗体
        'italic',  // 斜体
        'underline',  // 下划线
        'strikeThrough',  // 删除线
        'link',  // 插入链接
        'list',  // 列表
        'quote',  // 引用
        'emoticon',  // 表情
        'image',  // 插入图片
        'table',  // 表格
        'code',  // 插入代码
        'undo',  // 撤销
        'redo'  // 重复
    ];

    wangEditor.create();
    
    
    var idi = 0;
    $("#addtag-btn").click(function(){
    	var tagName = $("#tag").val().trim();
    	realtag.push(tagName);
    	$("#tag").val("");
        //创建DIV
        var fileItem = document.createElement('div');
        fileItem.style.display="inline-block";
        var span = document.createElement('span');
        var xbtn = document.createElement('button');
        span.id = "onetag";
        span.setAttribute('class','addnow');
        span.innerHTML = tagName;
        fileItem.appendChild(span);
        xbtn.id = "deltag" + idi;
        idi++;
        xbtn.setAttribute('class','addnow');
        xbtn.setAttribute('type','button');
        xbtn.innerHTML = "x";
        xbtn.setAttribute('onclick','deltag(this)');
        xbtn.style.marginRight="15px";
        fileItem.appendChild(xbtn);
//        fileItem.className = 'file-item';
        $("#tag-box").append(fileItem);
        
        //为按钮设置点击事件(删除)
//        $("#deltag").click(function(){
//           // 删除当前按钮节点所在父节点
//        	realtag -= "#" - this.innerHTML;
//            this.parentNode.remove();
//        })
    });

    
    $("#wangEditor-btn").click(function () {
    	for( var i = 0 ; i < realtag.length ; i++ ){
        	if( realtag[i] == "" ) continue;
        	strtag += realtag[i] + "#";
        }
        // 标题
        var title = $("#title").val();

        // html 格式的正文
        var contentHtml = wangEditor.txt.html();

        // 普通格式的正文
        // var contentText = wangEditor.txt.text();

        // 节点
        var node = $("#hidden-node").val();
        var nodeTitle = node ? node : $("#node option:selected").val();

        // 标签
        var tag = $("#tag").val().trim();

        if (!title || title.length > 120) {
            toast("请输入标题，且最大长度在120个字符以内");
            return;
        }
        if (!nodeTitle || nodeTitle.length == 0) {
            toast("请选择一个节点");
            return;
        }
        if ( strtag.length == 0) {
            toast("请至少输入一个标签");
            return;
        }

        // 将标签以空格分割
        var tags = tag.split(/\s+/);
        for (var i = 0; i < tags.length; i++) {
            if (tags[i].length > 10) {
                toast("每个标签的最大长度不能超过10个字符");
                return;
            }
        }
        
        $.ajax({
            url: '/topic/save',
            type: 'post',
            async: false,
            cache: false,
            dataType: 'json',
            data: {
                title: title,
                content: contentHtml,
                nodeTitle: nodeTitle,
                tag: strtag,
                type: "0"
            },
            success: function (data) {
                //console.log(JSON.stringify(data));
                if (data.success != null && data.success == true) {
                    window.location.href = "/topic/" + data.data.topic.topicId;
                } else {
                    toast(data.error);
                }
            },
            error: function (data) {
                toast(data.error);
            }
        })
    });

    /****** Markdown 编辑器*****/
    CodeMirror.keyMap.default["Shift-Tab"] = "indentLess";
    CodeMirror.keyMap.default["Tab"] = "indentMore";
    var CodeMirrorEditor = CodeMirror.fromTextArea(document.getElementById("codemirror-content"), {
        lineNumbers: false,     // 显示行数
        indentUnit: 4,         // 缩进单位为4
        tabSize: 4,
        matchBrackets: true,   // 括号匹配
        mode: 'markdown',     // Markdown模式
        lineWrapping: true,    // 自动换行
    });

    $("#codemirror-btn").click(function () {
    	for( var i = 0 ; i < realtag.length ; i++ ){
        	if( realtag[i] == "" ) continue;
        	strtag += realtag[i] + "#";
        }
        // 标题
        var title = $("#title").val();

        // 正文
        var content = CodeMirrorEditor.getDoc().getValue();

        // 节点
        var node = $("#hidden-node").val();
        var nodeTitle = node ? node : $("#node option:selected").val();

        // 标签
        var tag = $("#tag").val().trim();

        if (!title || title.length > 120) {
            toast("请输入标题，且最大长度在120个字符以内");
            return;
        }
        if (!nodeTitle || nodeTitle.length == 0) {
            toast("请选择一个节点");
            return;
        }
        if ( strtag.length == 0) {
            toast("请至少输入一个标签");
            return;
        }

        // 将标签以空格分割
        var tags = tag.split(/\s+/);
        for (var i = 0; i < tags.length; i++) {
            if (tags[i].length > 10) {
                toast("每个标签的最大长度不能超过10个字符");
                return;
            }
        }
        
        
        $.post("/topic/save", {
            title: title,
            content: content,
            nodeTitle: nodeTitle,
            tag: strtag,
            type: "1"
        }, function (data) {
            if (data.success != null && data.success == true) {
                toast("发布帖子成功", "success");
                setTimeout(function () {
                    window.location.href = "/topic/" + data.data.topic.topicId
                }, 700);
            } else {
                toast(data.error);
            }
        })
    })
})