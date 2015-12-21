<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- MAIN CONTENT -->
<div id="outermain">
	<div id="maincontent">
		<section id="mainthecontent">
			<h1 class="pagetitle">房间类型</h1>
			<div id="breadcrumb">
				You are here: <a href="index.html">Home</a> / Accommodation
			</div>
			<ul class="ts-gallery-col3">
				<c:forEach items="${ categoryList }" var="category" varStatus="status">


					<li class='<c:if test="${ status.count % 3 == 0 }" >nomargin</c:if>'>
						<div class="ts-gallery-img">
							<a title="" data-rel="prettyPhoto[mixed]" href="${ category.image_path }" class="image">
								<span class="rollover"></span>
								<img class="scale-with-grid" alt="" src="${ category.image_path }" />
							</a>
						</div>
						<div class="ts-gallery-text ">
							<h2>${ category.category_name }(剩余${ category.count }间)</h2>
							<p>
								<c:choose>
									<c:when test="${fn:length(category.category_desc) >= 100 }">
										 <c:out value="${fn:substring(category.category_desc, 0, 98)}..." />  
									</c:when>
									<c:otherwise>
										${ category.category_desc }
									</c:otherwise>
								</c:choose>
							</p>
							<a href="room_details.html?category_id=${ category.category_id }" class="button">Read More</a>
						</div>
						<div class="ts-gallery-clear"></div>
					</li>

					<c:if test="${ status.count % 3 == 0 }">
						<li class="ts-gallery-clear"></li>
					</c:if>

				</c:forEach>
			</ul>
			<div class="clear"></div>
		</section>
	</div>
</div>
<!-- END MAIN CONTENT -->