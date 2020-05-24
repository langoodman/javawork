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
h2{
	font-size:22px;
	font-weight:500;
}
.codeBlock{
	background:#eee;
	border:1px solid #ccc;
	padding:5px 10px;
}
</style>
<div class="row">
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <a href="/">主页</a> / 新手指南
            </div>
            <div class="panel-body" style="color: #333;">
               <h1>新手指南</h1>
				<p>欢迎来到启明星工作室在线社区，社区内容分为两个部分：问题讨论和文章。“问题”一般是简短的能够讨论和分享的内容，可以是一个疑问，也可以是想和大家讨论和分享的想法或者事物。“文章”是叙述清楚，有条理的篇幅较长的内容，可以是一些学习总结，也可以是生活分享和感悟。发布内容和题材本身并没有什么限制，也并没有指定是哪方面的内容，只要是爱国守法不攻击他人的内容均可，当然，如果能够发布一些引发讨论有学习价值的内容自然是更好。</p>
				<h2>个人信息</h2>
				<p>这里希望大家能够一起维护社区内容的完整性，所以在注册的时候，希望大家认真填写自己的个人信息，我们会尽可能的保护你们的个人信息不会泄露。我们希望注册会员能满足以下几点：</p>
				<ul>
					<li>经过验证的电子邮箱地址</li>
					<li>能够用于区分的不包含不雅内容的头像</li>
					<li>能够用于区分的昵称</li>
				</ul>
				<p>另外一点是工作室成员和老师需要提交认证：页面右上角的个人头像下拉菜单 -> 设置 -> 申请认证选项卡。</p>
				<p>填写完个人资料后提交认证，管理员会在后台审核。通过认证的会员在导航栏才会有签到按钮，所以为了你能够正常签到，请及时认证。</p>
				<h2>如何发布内容</h2>
				<p>发布内容分为两种形式：自主发布和跟帖评论。登陆后，在页面右上角有发起按钮，可快速发布问题和文章，在发布文章的时候需要满足以下条件：</p>
				<ul>
					<li>标题需要5个字以上</li>
					<li>选择一个分类</li>
					<li>建议添加一个或者多个与发布内容先关的话题，这样便于你发布的内容更容易被找到</li>
					<li>你也可以在别人发布的内容后面跟帖，比如回答他人的问题以参与讨论</li>
				</ul>
				<h2>编辑器的使用</h2>
				<p><img alt="" src="http://7vilag.com1.z0.glb.clouddn.com/editor.png" /></p>
				<p>编辑器的第二行栏位放置的是调整文本基本样式等按钮，加粗、斜体、列表排列、对齐方式、引用、字体颜色等。</p>
				<p>编辑器的第一行栏位大部分为插入某种格式的按钮，依次为插入链接、删除链接、插入页面锚点、插入图片、插入代码、插入表格、插入分隔线、插入表情、插入iframe。</p>
				<p><strong>插入图片：</strong></p>
				<p>插入图片分为本地图片和网络图片，本地图片需要先上传，上传文件和图片都要通过编辑器下方的上传附件按钮，点击后就可以选择并上传文件，需要注意文件的类型。</p>
				<p>如下图所示：</p>
				<p><img alt="" src="http://7vilag.com1.z0.glb.clouddn.com/upload.png" /></p>
				<p>如果上传的是合法的图片文件，在图片右下方有个插入按钮，点击插入即可将图片插入到编辑器中，文件和图片会附在文章和问题下面以供读者浏览和下载，由于服务器空间有限，请不要上传较大的文件或者图片。</p>
				<p><strong>插入代码和表格：</strong></p>
				<p>在编辑器上，有按钮<img alt="" src="http://7vilag.com1.z0.glb.clouddn.com/code_button.png" />和按钮<img alt="" src="http://7vilag.com1.z0.glb.clouddn.com/table_button.png" />分别用于插入代码和表格，只需要点击按钮选择和配置代码和按钮的属性集合轻松先文章添加代码和表格。</p>
				<p>代码在发布后会在页面加载的时候添加高亮，这样可以使得你的代码更适宜阅读。</p>
				<p><strong>插入音乐和视频：</strong></p>
				<p>由于考虑到安全的原因，我们过滤掉了大部分的html标签元素，视屏发布采用嵌入页面的iframe方式，这样不关安全，而且对手机登不支持flash的设备更加友好。</p>
				<p>我们目前支持的视频和音乐网址有：优酷、56、acfun、网易云音乐、土豆、腾讯视频</p>
				<p>接下来详解怎么发布视频和音乐内容：</p>
				<p>拿优酷为例：</p>
				<p>在优酷网站的视频播放器下，一般有个分享按钮：</p>
				<p><img alt="" src="http://7vilag.com1.z0.glb.clouddn.com/video_share.png" /></p>
				<p>找到包含 <span style="color:#008000">iframe</span> 的哪一项，接下来我们分析复制到的文本：</p>
				<div>
					&lt;iframe height=498 width=510 src=&quot;http://player.youku.com/embed/XNTA2NTUyNDQw&quot; frameborder=0 allowfullscreen&gt;&lt;/iframe&gt;
				</div>
				<p>接下来我们在编辑器中点击iframe按钮<img alt="" src="http://7vilag.com1.z0.glb.clouddn.com/iframe_button.png" /></p>
				<p>我们需要在对话框中填写URL为iframe标签中src的地址，宽度和高度为iframe里面的width和height，如下图所示：</p>
				<p><img alt="" src="http://7vilag.com1.z0.glb.clouddn.com/iframe_dialog.png" /></p>
				<hr></hr>
				<p><strong>技巧：给你的文章添加一个目录：</strong></p>
				<p>如果想使自己的文章更有条理，我们可以在写好文章准备发布前给文章添加一个目录。</p>
				<p>首先我们使用列表工具建立文章的大纲：</p>
				<p><img alt="" src="http://7vilag.com1.z0.glb.clouddn.com/menu_list.png" /></p>
				<p>然后我们在对应的文章章节位置添加锚点：</p>
				<p>如下，我们希望用户在点击目录的“目录1”项的时候跳转到文章的“目录1”对应的位置，我们需要给文章的“目录1”（跳转到的位置）添加一个锚点：</p>
				<p>这时我们需要选定文章中的“目录1”，然后按编辑器绿色旗帜按钮</p>
				<p><img alt="" src="http://7vilag.com1.z0.glb.clouddn.com/add_anchor.png" /></p>
				<p><span style="background-color:#FFA07A">锚点名称必须以“anchor_”开头，</span>不然会被过滤掉。</p>
				<p>最后我们来到我们建造的目录位置，给目录1添加一个指向这个锚点的链接：</p>
				<p><img alt="" src="http://7vilag.com1.z0.glb.clouddn.com/add_link.png" /></p>
				<p>这样我们的一个目录项就做好了，读者在点击目录中的目录1时会跳转到文章中目录1的位置。</p>
             </div>
        </div>
    </div>
</div>
<%@ include file="../layout/footer.jsp" %>