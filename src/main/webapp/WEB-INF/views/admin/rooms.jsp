<%-- 房间管理 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="${ adminResCtxPath }/js/adminRooms.js"></script>

<div class="box-header well" data-original-title="">
	<h2>
		<i class="glyphicon glyphicon-user"></i>房间管理
	</h2>
	<div class="box-icon">
		<%-- 
		<a href="#" class="btn btn-setting btn-round btn-default"><i class="glyphicon glyphicon-cog"></i></a>
		<a href="#" class="btn btn-minimize btn-round btn-default"><i class="glyphicon glyphicon-chevron-up"></i></a>
		<a href="#" class="btn btn-close btn-round btn-default"><i class="glyphicon glyphicon-remove"></i></a>
		 --%>
		<a href="javascript:newRooms();" title="新增房间" class="btn btn-round btn-default" data-toggle="tooltip">
			<i class="glyphicon glyphicon-plus"></i>
		</a>
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
				<th style="width: 100px;">状态</th>
				<th style="width: 100px;">关键字</th>
				<th style="width: 100px;">创建时间</th>
				<th style="width: 100px;">备注</th>
				<th style="width: 10px;">操作</th>
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
						<a id="view" class="btn " href="javascript:"><i class="glyphicon glyphicon-zoom-in icon-white"></i>明细</a>
						<a id="view" class="btn btn-danger" href="javascript:"><i class="glyphicon glyphicon-trash"></i>删除</a>
						--%>
						
						<button id="view" class="btn btn-info btn-sm" onclick="showDialog('${ category.category_id }');"><i class="glyphicon glyphicon-zoom-in icon-white"></i>明细</button>
						<button id="view" class="btn btn-danger btn-sm" onclick="deleteRooms('${ category.category_id }');"><i class="glyphicon glyphicon-trash"></i>删除</button>
            		</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<%-- 弹出的 Dialog --%>
<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
       <div class="modal-content">
           <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">×</button>
               <h3>房间明细</h3>
           </div>
           <div class="modal-body">
               <table>
               		<tr>
	               		<td>图片：</td>
	               		<td>
							<input id="file_upload" name="file_upload" class="form-control" type="file" multiple="true">
							<div id="queue"></div>
							<input type="hidden" id="info_path" name="info_path" />
							<input type="hidden" id="action" name="action" />
	               			<img src="" width="430px;" id="info_image" />
	               		</td>
	               	</tr>
	               	<tr id="label_category_id" style="display: none;">
	               		<td>房间编码：</td>
	               		<td><input type="text" class="form-control" id="info_category_id" ></td>
	               	</tr>
	               	<tr>
	               		<td>房间名称：</td>
	               		<td><input type="text" class="form-control" id="info_category_name"></td>
	               	</tr>
	               	<tr>
	               		<td>价格：</td>
	               		<td><input type="text" class="form-control" id="info_price" ></td></tr>
	               	<tr>
	               		<td>库存：</td>
	               		<td><input type="text" class="form-control" id="info_count"></td>
	               	</tr>
	               	<tr>
	               		<td>状态：</td>
	               		<td>
	               			<select id="info_category_state" cclass="form-control" >
	               				<option value="00A">有效</option>
	               				<option value="00X">无效</option>
	               			</select>
	               		</td>
	               	</tr>
	               	<tr>
	               		<td>关键字：</td>
	               		<td><input type="text" class="form-control" id="info_category_keyword" value="${ order.create_date }" ></td>
	               	</tr>
	               	<tr>
	               		<td>描述：</td>
	               		<td><textarea class="form-control" cols="58"  rows="5" id="info_category_desc">&nbsp;</textarea></td>
	               	</tr>
               </table>
           </div>
            <div class="modal-footer" style="display: none;">
			    <a href="javascript:$('#myModal').modal('hide');" class="btn btn-default">关闭</a>
			    <a href="javascript:saveRooms();" class="btn btn-default">保存</a>
			</div>
        </div>
    </div>
</div>