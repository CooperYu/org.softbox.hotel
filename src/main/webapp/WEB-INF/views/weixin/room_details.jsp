<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- MAIN CONTENT -->
<div id="outermain">
	<div id="maincontent">
		<section id="mainthecontent">

			<h1 class="pagetitle">${ category.category_name }</h1>
			<%--
			<div id="breadcrumb">
				You are here: <a href="index.html">Home</a> / <a
					href="accommodation.html">Accommodation</a> / Deluxe Room
			</div>
			--%>

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
		</section>
	</div>
</div>
<!-- END MAIN CONTENT -->