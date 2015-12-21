<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%
	Object create_flag_obj = session.getAttribute("create_flag");
	if(null != create_flag_obj){
		Boolean create_flag = Boolean.parseBoolean(create_flag_obj.toString());
		request.setAttribute("create_flag", create_flag);
		session.setAttribute("create_flag", null);
	}
%>

<script type="text/javascript">
	var create_flag = '${ create_flag }';
	if(create_flag){
		alert("预定成功");
	}
	
	$(document).ready(function() {
		$("#apply_date").datepicker();
    });
	
</script>

<!-- MAIN CONTENT -->
<div id="outermain">
	<div id="maincontent">
		<section id="mainthecontent">

			<h1 class="pagetitle">${ category.category_name }</h1>
			<div id="breadcrumb">
				You are here: <a href="index.html">Home</a> / <a
					href="accommodation.html">Accommodation</a> / Deluxe Room
			</div>

			<img src="${ ctxPath }/${ category.image_path }" alt="" /><br />
			<br />

			<p>
				${ category.category_desc }
			</p>
			
			<%--
			<p>
				Morbi fermentum sollicitudin aliquet. Ut sit amet egestas
				metus. Curabitur varius, nunc nec dictum tempus, est nisl rhoncus
				ligula, ac varius orci purus in nisi. Nullam mollis massa eget velit
				feugiat in ultrices metus ultricies.
			</p>
			<br />
			--%>

			<h3>Room Features:</h3>
			<div class="one_fourth firstcols">
				<ul class="bullet arrow2">
				<c:forEach var="attr" items="${ categoryAttrs }" begin="0" end="9">
					<li>${ attr.attr_name }</li>
				</c:forEach>
				</ul>
			</div>
			<div class="one_fourth ">
				<ul class="bullet arrow2">
				<c:forEach var="attr" items="${ categoryAttrs }" begin="10" end="19">
					<li>${ attr.attr_name }</li>
				</c:forEach>
				</ul>
			</div>
			<div class="one_fourth ">
				<ul class="bullet arrow2">
				<c:forEach var="attr" items="${ categoryAttrs }" begin="20" end="29">
					<li>${ attr.attr_name }</li>
				</c:forEach>
				</ul>
			</div>
			<div class="one_fourth lastcols">
				<ul class="bullet arrow2">
				<c:forEach var="attr" items="${ categoryAttrs }" begin="30" end="39">
					<li>${ attr.attr_name }</li>
				</c:forEach>
				</ul>
			</div>
			<div class="clear"></div>
			
			<hr/>
			<form id="contact" action="${ ctxPath }/booking.html" method="post" />
			<div id="contactform">
					<fieldset>
						<input type="hidden" id="category_id" name="category_id" value="${ category.category_id }"  >
						<input type="text" name="user_name" id="user_name" size="50" value="姓名" class="text-input" onblur="if (this.value == ''){this.value = '姓名'; }" onfocus="if (this.value == '姓名') {this.value = ''; }" />
						<input type="text" name="phone" id="phone" size="50" value="电话" class="text-input" onblur="if (this.value == ''){this.value = '电话'; }" onfocus="if (this.value == '电话') {this.value = ''; }" />
						<input type="text" name="certi_no" id="certi_no" value="身份证号" class="text-input" onblur="if (this.value == ''){this.value = '身份证号'; }" onfocus="if (this.value == '身份证号') {this.value = ''; }" />
						<input type="text" name="apply_date" id="apply_date" value="入住日期" class="text-input" readonly="readonly" />
						<textarea cols="60" rows="10" name="msg" id="msg" class="text-input">留言</textarea>
					</fieldset>
	      	</div><!-- end contactform -->
			<br /> <a href="#" class="button" onclick="document.getElementById('contact').submit();">预定</a>
			</form>

			<div class="clear"></div>
		</section>
	</div>
</div>
<!-- END MAIN CONTENT -->