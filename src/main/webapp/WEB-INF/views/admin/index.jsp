<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div class="box-header well" data-original-title="">
	<h2>
		<i class="glyphicon glyphicon-user"></i> 订单管理
	</h2>
	<div class="box-icon">
		<a href="#" class="btn btn-setting btn-round btn-default"><i class="glyphicon glyphicon-cog"></i></a>
		<a href="#" class="btn btn-minimize btn-round btn-default"><i class="glyphicon glyphicon-chevron-up"></i></a>
		<a href="#" class="btn btn-close btn-round btn-default"><i class="glyphicon glyphicon-remove"></i></a>
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
				<th style="display: none;">订单ID</th>
				<th style="display: none;">订单类型</th>
				<th width="2%">姓名</th>
				<th width="2%">证件号码</th>
				<th width="2%">联系电话</th>
				<th width="10%">房间类型</th>
				<th width="5%">价格</th>
				<th width="5%">状态 </th>
				<th width="8%">下单时间</th>
				<th width="11%">备注</th>
				<th width="16%">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="order" items="${ pageModel.dataResult }" >
				<tr>
					<td style="display: none;" >${ order.order_id }</td>
					<td style="display: none;">${ order.order_type }</td>
					<td class="">${ order.user_name }</td>
					<td class="">${ order.certi_no }</td>
					<td class="">${ order.phone }</td>
					
					<td class="">${ order.category_name }</td>
					<td class="">${ order.price }</td>
					
					<td class="" id="show_order_state_${ order.order_id }">${ order.order_state_name }</td>
					<td class="">${ order.create_date }</td>
					<td class="">${ order.item_desc }</td>
					<td class="">
						<%-- 操作按钮 --%>
						<%--
							public static final String ORDER_STATE_00A = "有效";
							public static final String ORDER_STATE_00X = "无效";
							public static final String ORDER_STATE_00P = "已入住";
							public static final String ORDER_STATE_00S = "完成";
						--%>
						<button id="view_${ order.order_id }" class="btn btn-info btn-sm"><i class="glyphicon glyphicon-zoom-in icon-white"></i>显示</button>
						<c:choose>
							<c:when test="${ order.order_state == '00A' }"><%-- 正常下单 --%>
				            	<button id="ruzhu_${ order.order_id }" 							class="btn btn-warning btn-sm"	onclick="ruzhu('${ order.order_id }');"><i class="glyphicon glyphicon-check"></i>入住</button>
								<button id="revert_${ order.order_id }" style="display: none;"	class="btn btn-success btn-sm"	onclick="revert('${ order.order_id }');" ><i class="glyphicon glyphicon-edit icon-white"></i>完成</button>
				            	<button id="quxiao_${ order.order_id }" 						class="btn btn-danger btn-sm" 	onclick="cancel('${ order.order_id }');"><i class="glyphicon glyphicon-remove"></i>取消</button>
							</c:when>
							<c:when test="${ order.order_state == '00P' }"><%-- 已经入住 --%>
				            	<button id="ruzhu_${ order.order_id }" 	style="display: none;" 	class="btn btn-warning btn-sm" 	href="ruzhu('${ order.order_id }');"><i class="glyphicon glyphicon-check"></i>入住</button>
								<button id="revert_${ order.order_id }" 						class="btn btn-success btn-sm" 	href="revert('${ order.order_id }');" ><i class="glyphicon glyphicon-edit icon-white"></i>完成</button>
				            	<button id="quxiao_${ order.order_id }" 	 					class="btn btn-danger btn-sm" 	href="cancel('${ order.order_id }');"><i class="glyphicon glyphicon-remove"></i>取消</button>
							</c:when>
							<c:when test="${ order.order_state == '00X' }"><%-- 无效  --%>
				            	<button id="ruzhu_${ order.order_id }"	style="display: none;" 	class="btn btn-warning btn-sm" 	href="ruzhu('${ order.order_id }');"><i class="glyphicon glyphicon-check"></i>入住</button>
								<button id="revert_${ order.order_id }" style="display: none;" 	class="btn btn-success btn-sm" 	href="revert('${ order.order_id }');" ><i class="glyphicon glyphicon-edit icon-white"></i>完成</button>
				            	<button id="quxiao_${ order.order_id }" style="display: none;" 	class="btn btn-danger btn-sm" 	href="cancel('${ order.order_id }');"><i class="glyphicon glyphicon-remove"></i>取消</button>
							</c:when>
							<c:when test="${ order.order_state == '00S' }"><%-- 完成  --%>
				            	<button id="ruzhu_${ order.order_id }" 	style="display: none;" 	class="btn btn-warning btn-sm" 	href="ruzhu('${ order.order_id }');"><i class="glyphicon glyphicon-check"></i>入住</button>
								<button id="revert_${ order.order_id }" style="display: none;" 	class="btn btn-success btn-sm" 	href="revert('${ order.order_id }');" ><i class="glyphicon glyphicon-edit icon-white"></i>完成</button>
				            	<button id="quxiao_${ order.order_id }" style="display: none;" 	class="btn btn-danger btn-sm" 	href="cancel('${ order.order_id }');"><i class="glyphicon glyphicon-remove"></i>取消</button>
							</c:when>
						</c:choose>
		            	
		            	
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
						                	<tr><td>订单编码：</td><td><input type="text" disabled="disabled" class="form-control" id="order_type" value="${ order.order_id }" ></td></tr>
						                	<tr><td>订单类型：</td><td><input type="text" disabled="disabled" class="form-control" id="order_type" value="${ order.order_type }" ></td></tr>
						                	<tr><td>联系人：</td><td><input type="text" disabled="disabled" class="form-control" id="order_type" value="${ order.user_name }" ></td></tr>
						                	<tr><td>证件号码：</td><td><input type="text" disabled="disabled" class="form-control" id="order_type" value="${ order.certi_no }" ></td></tr>
						                	<tr><td>联系电话：</td><td><input type="text" disabled="disabled" class="form-control" id="order_type" value="${ order.phone }" ></td></tr>
						                	<tr><td>下单时间：</td><td><input type="text" disabled="disabled" class="form-control" id="order_type" value="${ order.create_date }" ></td></tr>
						                	<tr><td>描述：</td><td><textarea class="autogrow" disabled="disabled" cols="55" rows="20">&nbsp;${ order.item_desc }</textarea></td></tr>
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