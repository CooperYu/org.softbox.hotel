<%-- 房间管理 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div class="box-header well" data-original-title="">
	<h2>
		<i class="glyphicon glyphicon-user"></i> 订单管理
	</h2>
	<div class="box-icon">
		<%-- 
		<a href="#" class="btn btn-setting btn-round btn-default"><i class="glyphicon glyphicon-cog"></i></a>
		<a href="#" class="btn btn-minimize btn-round btn-default"><i class="glyphicon glyphicon-chevron-up"></i></a>
		<a href="#" class="btn btn-close btn-round btn-default"><i class="glyphicon glyphicon-remove"></i></a>
		 --%>
		<a href="#" title="新增房间" class="btn btn-close btn-round btn-default" data-toggle="tooltip"><i class="glyphicon glyphicon-plus"></i></a>
		
	</div>
</div>
<div class="box-content">
	<%--
	<div class="alert alert-info">
		For help with such table please check <a href="http://datatables.net/" target="_blank">http://datatables.net/</a>
	</div>
	--%>
	<table class="table table-striped table-bordered bootstrap-datatable datatable responsive">
		<thead>
			<tr>
				<th style="display: none;">房间ID</th>
				<th style="width: 100px;">房间名称</th>
				<th style="width: 100px;">价格</th>
				<th style="width: 100px;">库存</th>
				<th style="width: 100px;">房间状态</th>
				<th style="width: 100px;">关键字</th>
				<th style="width: 100px;">创建时间</th>
				<th style="width: 100px;">备注</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="category" items="${ categories }" >
				<tr>
					<td style="display: none;">${ category.category_id }</td>
					<td class="center">${ category.category_name }</td>
					<td class="center">${ category.price }</td>
					<td class="center">${ category.count }</td>
					<td class="center">${ category.category_state_name }</td>
					<td class="center">${ category.category_keyword }</td>
					<td class="center">${ category.create_date }</td>
					<td class="center">${ category.category_desc }</td>
					<td class="">
						<%-- 操作按钮 --%>
						<%--
							public static final String ORDER_STATE_00A = "有效";
							public static final String ORDER_STATE_00X = "无效";
						--%>
						<a id="view_${ order.order_id }" class="btn btn-info" href="#"><i class="glyphicon glyphicon-zoom-in icon-white"></i>明细</a>
		            	
		            	<%-- 表单Form --%>
		            	<form action="${ adminCtxPath }/saveOrder.html" method="post" id="order_${ order.order_id }" style="widows: 0px;height: 0px;">
						<div class="modal fade" id="myModal_${ order.order_id }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						    <div class="modal-dialog">
						        <div class="modal-content">
						            <div class="modal-header">
						                <button type="button" class="close" data-dismiss="modal">×</button>
						                <h3>订单明细</h3>
						            </div>
						            <div class="modal-body">
						                <table>
						                	<tr><td>房间ID&nbsp;：</td>	<td><input type="text" disabled="disabled" class="form-control" id="order_type" value="${ category.category_id }" ></td></tr>
						                	<tr><td>房间名称</td>		<td><input type="text" disabled="disabled" class="form-control" id="order_type" value="${ category.category_name }" ></td></tr>
						                	<tr><td>价格：</td>			<td><input type="text" disabled="disabled" class="form-control" id="order_type" value="${ category.price }" ></td></tr>
						                	<tr><td>库存：</td>			<td><input type="text" disabled="disabled" class="form-control" id="order_type" value="${ category.count }" ></td></tr>
						                	<tr>
						                		<td>状态：</td>
						                		<td>
                									<input type="text" disabled="disabled" class="form-control" id="order_type" value="${ order.category_state_name }" >
                								</td>
						                	</tr>
						                	<tr><td>关键字：</td>		<td><input type="text" disabled="disabled" class="form-control" id="order_type" value="${ order.create_date }" ></td></tr>
						                	<tr><td>创建时间：</td>		<td><input type="text" disabled="disabled" class="form-control" id="order_type" value="${ order.create_date }" ></td></tr>
						                	<tr><td>备注：</td>			<td><textarea class="autogrow" disabled="disabled" cols="58" rows="20">&nbsp;${ order.item_desc }</textarea></td></tr>
						                	<tr>
						                		<td class="">
												<a id="view_${ order.order_id }" class="btn btn-info" href="#"><i class="glyphicon glyphicon-zoom-in icon-white"></i>明细</a>
												</td>
						                	</tr>
						                </table>
						            </div>
						            <%--
						            <div class="modal-footer">
						                <a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
						                <a href="#" class="btn btn-primary" data-dismiss="modal">Save changes</a>
						            </div>
						            --%>
						        </div>
						    </div>
						</div>
						</form>
						<script type="text/javascript">
							$('#view_'+ '${ order.order_id }').click(function (e) {
							    e.preventDefault();
							    $('#myModal_' + '${ order.order_id }').modal('show');
							});
						</script>
            		</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script type="text/javascript">

	/**入住**/
	function ruzhu(order_id){
		
		if(!confirm("是否入住！")) return;
		
		var flag = ajaxUpdateOrderState(order_id, "00P");
		if(flag){
			//按钮调整
			$('#ruzhu_'+order_id).hide();
			$('#revert_'+order_id).show();
			$('#quxiao_'+order_id).show();
			
			//修改状态；
			$('#show_order_state_'+order_id).html("已入住");
		}
	}
	
	/**完成，将还原库存 (ajax提交)**/
	function revert(order_id){
		if(!confirm("是否完成！")) return;
		
		var flag = ajaxUpdateOrderState(order_id, "00S");
		if(flag){
			//按钮调整
			$('#ruzhu_'+order_id).hide();
			$('#revert_'+order_id).hide();
			$('#quxiao_'+order_id).hide();
			
			//修改状态；
			$('#show_order_state_'+order_id).html("完成");
		}
	}
	
	/**取消订单**/
	function cancel(order_id){
		if(!confirm("是否取消！")) return;
		var flag = ajaxUpdateOrderState(order_id, "00X");
		if(flag){
			//按钮调整
			$('#ruzhu_'+order_id).hide();
			$('#revert_'+order_id).hide();
			$('#quxiao_'+order_id).hide();
			
			//修改状态；
			$('#show_order_state_'+order_id).html("无效");
		}
	}
	
	function ajaxUpdateOrderState(order_id,order_state){
		var returnflag = false;
		$.ajax({   
		    type : "POST",   
		    url : '${ adminCtxPath }/updateOrderState.html', 
		    async : false,
		    data : {
		      'order_id' : order_id	,
		      'order_state':order_state
			},  
		    dataType: "json",   
		    success : function(data){
		    	if(data.success == 'T'){   
		            alert("操作成功！"); 
		            returnflag = true;
		        }else{   
		            alert("操作失败！");   
		            returnflag = false;
		        }   
		    },
			error: function(){
				alert("操作失败！");
				returnflag = false;
			}
		});
		return returnflag;
	}
</script>


