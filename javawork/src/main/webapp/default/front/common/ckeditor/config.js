/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */
//wsy修改富文本编辑器的配置
CKEDITOR.editorConfig = function( config ) {
	config.toolbarGroups = [
		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
		{ name: 'forms', groups: [ 'forms' ] },
		{ name: 'links', groups: [ 'links' ] },
		{ name: 'insert', groups: [ 'insert' ] },
		{ name: 'paragraph', groups: [ 'align', 'list', 'indent', 'blocks', 'bidi', 'paragraph' ] },
		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
		{ name: 'tools', groups: [ 'tools' ] },
		'/',
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'styles', groups: [ 'styles' ] },
		{ name: 'colors', groups: [ 'colors' ] },
		{ name: 'about', groups: [ 'about' ] },
		'/',
		{ name: 'others', groups: [ 'others' ] }
	];
	config.image_previewText=' ';//去掉图片上传框的预览。
	config.removeButtons = 'BidiLtr,BidiRtl,Language,Subscript,Superscript,Radio,Checkbox,ImageButton,Button,HiddenField,Flash,Form,Select,Textarea,TextField,Cut,Copy,Paste,PasteText,PasteFromWord,Preview,ShowBlocks,PageBreak,Anchor,CreateDiv,Find,Replace,Templates,Blockquote,Indent,Outdent,NewPage,SelectAll';
	config.font_names = '宋体/SimSun;新宋体/NSimSun;仿宋/FangSong;楷体/KaiTi;仿宋_GB2312/FangSong_GB2312;' +
    '楷体_GB2312/KaiTi_GB2312;黑体/SimHei;华文细黑/STXihei;华文楷体/STKaiti;华文宋体/STSong;华文中宋/STZhongsong;' +
    '华文仿宋/STFangsong;华文彩云/STCaiyun;华文琥珀/STHupo;华文隶书/STLiti;华文行楷/STXingkai;华文新魏/STXinwei;' +
    '方正舒体/FZShuTi;方正姚体/FZYaoti;细明体/MingLiU;新细明体/PMingLiU;微软雅黑/Microsoft YaHei;微软正黑/Microsoft JhengHei;' +
    'Arial Black/Arial Black;' + config.font_names;
	config.allowedContent = true;              //是否保留样式
    config.disableObjectResizing = false;     //图片表格大小调整功能
    config.disableNativeTableHandles = true;  //表格编辑功能（plugins/wysiwygarea/plugin.js）
    config.filebrowserImageUploadUrl = '/common/ImageUpload';
};