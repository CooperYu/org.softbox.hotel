/**
 * 后台rooms.jsp 包含的js文件
 */
/****
 * 显示房间的信息；
 */
function showDialog(category_id){
	var category = getCategoryById(category_id);
	$('#action').val('modify');
	 $('#myModal').modal('show');
}

/****
 * 保存房间
 */
function saveRooms(){
	var category_id = $('#info_category_id').val();
	var category_name = $('#info_category_name').val();
	var price = $('#info_price').val();
	var count = $('#info_count').val();
	var category_state = $('#info_category_state').val();
	var category_keyword = $('#info_category_keyword').val();
	var category_desc = $('#info_category_desc').val();
	var info_path = $('#info_path').val();
	var action = $('#action').val();
	
	$.ajax({   
	    type : "POST",   
	    url : adminCtxPath + '/addRoom.html', 
	    async : true,
	    data : {
	    	'category_id'		: category_id,
	    	'category_name'		: category_name,
	    	'price'				: price,
	    	'count'				: count,
	    	'category_state'	: category_state,
	    	'category_keyword'	: category_keyword,
			'category_desc' 	: category_desc,
			'info_path'			: info_path,
			'action'			: action,
		},  
	    dataType: "json",   
	    success : function(data){
	    	if(data.success == 'T'){
	    		alert("新增成功！");
	    		location.reload();
	        }
	    },
		error: function(){
			alert("操作失败！");
		}
	});
}

/*
function modifyRooms(){
	var category_name = $('#info_category_name').val();
	var price = $('#info_price').val();
	var count = $('#info_count').val();
	var category_state = $('#info_category_state').val();
	var category_keyword = $('#info_category_keyword').val();
	var category_desc = $('#info_category_desc').val();
}
*/

function deleteRooms(category_id){
	if(!confirm("是否删除！")) return;
	
	$.ajax({   
	    type : "POST",   
	    url :  adminCtxPath + '/delRoom.html', 
	    async : false,
	    data : {
	      'category_id' : category_id	
		},  
	    dataType: "json",   
	    success : function(data){
	    	if(data.success == 'T'){
	    		alert('删除成功！');
	    		location.reload();
	        }else{
	        	alert("操作失败！");
	        }
	    },
		error: function(){
			alert("操作失败！");
		}
	});
	
}

function getCategoryById(category_id){
	var category = new Object();
	$.ajax({   
	    type : "POST",   
	    url : adminCtxPath +'/getCategoryById.html', 
	    async : false,
	    data : {
	      'category_id' : category_id	
		},  
	    dataType: "json",   
	    success : function(data){
	    	if(data.success == 'T'){
	    		$('#label_category_id').show();
	    		$('#info_category_id').val(data.category_id);
	    		$('#info_category_name').val(data.category_name);
	    		$('#info_price').val(data.price);
	    		$('#info_count').val(data.count);
	    		$('#info_category_state').val(data.category_state);
	    		$('#info_category_keyword').val(data.category_keyword);
	    		$('#info_category_desc').val(data.category_desc);
	    		
	    		$('#info_image').attr('src',ctxPath + '/' + data.image_path);
	    		$('#info_path').val(data.image_path);
	    		
	    		/*--将控件重置为不可编辑--*/
	    		/*
	    		$('#info_category_id').attr("disabled", "disabled");
	    		$('#info_category_name').attr("disabled", "disabled");
	    		$('#info_price').attr("disabled", "disabled");
	    		$('#info_count').attr("disabled", "disabled");
	    		$('#info_category_state').attr("disabled", "disabled");
	    		$('#info_category_keyword').attr("disabled", "disabled");
	    		$('#info_category_desc').attr("disabled", "disabled");
	    		*/
	    		/*--屏蔽保存保存按钮--*/
	    		$('.modal-footer').show();
	        }
	    },
		error: function(){
			alert("操作失败！");
		}
	});
	return category;
}

function newRooms(){
	//图片
	$('#info_path').val("");
	$('#info_image').attr("src",ctxPath+"/images/no_pic.gif");
	
	$('#label_category_id').hide();
	$('#info_category_name').removeAttr("disabled");
	$('#info_category_name').val("");
	$('#info_price').removeAttr("disabled");
	$('#info_price').val("");
	$('#info_count').removeAttr("disabled");
	$('#info_count').val("");
	$('#info_category_state').removeAttr("disabled");
	$('#info_category_state').val("00A");
	$('#info_category_keyword').removeAttr("disabled");
	$('#info_category_keyword').val("");
	$('#info_category_desc').removeAttr("disabled");
	$('#info_category_desc').val("");
	
	$('#action').val('new');
	//按钮调整
	$('.modal-footer').show();
	$('#myModal').modal('show');
}


$(function(){
	$('#file_upload').uploadify({
		'swf'      			: adminResCtxPath + '/images/uploadify.swf',
		'uploader' 			: ctxPath + '/fileupload',
        'cancelImg'      	: adminResCtxPath + '/images/cancel.png',
        'folder'         	: 'upload',
        'queueID'        	: 'queue',
		'fileTypeDesc' : 	'Image Files',
        'fileTypeExts' : 	'*.gif; *.jpg; *.png',
        'auto'           	: true,
        'multi'          	: false,
        'removeCompleted'	: true,
        'sizeLimit'      	: 90485799,
        'simUploadLimit' 	: 1,
        'buttonText'     	: '添加图片',
		'onInit': function () {                        //载入时触发，将flash设置到最小
		},
		'onSelect' : function(file) {
       },
        'onUploadSuccess' : function(file, data, response) {
        	//data:返回图片的上下文路径；
			$('#info_image').attr('src',ctxPath + '/' + data);
			$('#info_path').val(data);
        }
	});
});