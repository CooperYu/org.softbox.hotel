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
				<th width="100px;">姓名</th>
				<th width="200px;">证件号码</th>
				<th width="100px;">联系电话</th>
				<th width="100px;">订单状态</th>
				<th width="100px;">下单时间</th>
				<th width="250px;">备注</th>
				<th width="50px;">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="order" items="${ pageModel.dataResult }" >
				<tr>
					<td style="display: none;">${ order.order_id }</td>
					<td style="display: none;">${ order.order_type }</td>
					<td class="center">${ order.user_name }</td>
					<td class="center">${ order.certi_no }</td>
					<td class="center">${ order.phone }</td>
					<td class="center">${ order.order_state_name }</td>
					<td class="center">${ order.create_date }</td>
					<td class="center">${ order.order_desc }</td>
					<td class="center">
						<a class="btn btn-success btn-setting_${ order.order_id }" href="#"><i class="glyphicon glyphicon-zoom-in icon-white"></i>显示</a>
						<a class="btn btn-info" href="javascript:revert_repository('${ order.order_id }');" id=""><i class="glyphicon glyphicon-edit icon-white"></i>还原库存</a>
		            	<a class="btn btn-danger" href="#"><i class="glyphicon glyphicon-trash icon-white"></i>处理</a>
		            	<%-- 表单Form --%>
		            	<form action="${ adminCtxPath }/saveOrder.html" method="post" id="order_${ order.order_id }">
						<div class="modal fade" id="myModal_${ order.order_id }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						    <div class="modal-dialog">
						        <div class="modal-content">
						            <div class="modal-header">
						                <button type="button" class="close" data-dismiss="modal">×</button>
						                <h3>订单明细</h3>
						            </div>
						            <div class="modal-body">
						                <table>
						                	<tr><td>订单ID&nbsp;：</td><td><input type="text" disabled="disabled" class="form-control" id="order_type" value="${ order.order_id }" ></td></tr>
						                	<tr><td>订单类型：</td><td><input type="text" disabled="disabled" class="form-control" id="order_type" value="${ order.order_type }" ></td></tr>
						                	<tr><td>联&nbsp;系&nbsp;人：</td><td><input type="text" disabled="disabled" class="form-control" id="order_type" value="${ order.user_name }" ></td></tr>
						                	<tr><td>证件号码：</td><td><input type="text" disabled="disabled" class="form-control" id="order_type" value="${ order.certi_no }" ></td></tr>
						                	<tr><td>联系电话：</td><td><input type="text" disabled="disabled" class="form-control" id="order_type" value="${ order.phone }" ></td></tr>
						                	<tr><td>下单时间 ：</td><td><input type="text" disabled="disabled" class="form-control" id="order_type" value="${ order.create_date }" ></td></tr>
						                	<tr><td>描 &nbsp;&nbsp;&nbsp;&nbsp; 述：</td><td><textarea class="autogrow" disabled="disabled" cols="58" rows="20">&nbsp;${ order.order_desc }</textarea></td></tr>
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
							$('.btn-setting_'+ '${ order.order_id }').click(function (e) {
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

	/**还原库存 (ajax体积)**/
	function revert_repository(order_id){
		ajaxUpdateOrderState(order_id, "00S");
	}
	
	function ajaxUpdateOrderState(order_id,order_state){
		$.ajax({   
		    type : "POST",   
		    url : '${ adminCtxPath }/updateOrderState.html', 
		    data : {
		      'order_id' : order_id	,
		      'order_state':order_state
			},  
		    dataType: "json",   
		    success : function(data) {
				debugger;
		        if(data.success){   
		            alert("设置成功！");   
		        }   
		        else{   
		            alert("设置失败！");   
		        }   
		    }
		});   
	}
</script>