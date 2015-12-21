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
				<th style="display: none;">房间ID</th>
				<th style="width: 100px;">房间名称</th>
				<th style="width: 100px;">价格</th>
				<th style="width: 100px;">库存</th>
				<th style="width: 100px;">房间状态</th>
				<th style="width: 100px;">关键字</th>
				<th style="width: 100px;" >添加时间</th>
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
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>


