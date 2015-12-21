<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags/nav" prefix="nav"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<style type="text/css">
	.content{
		position: relative;
    	padding: 0px 15px 0px;
    	height: 100%;
	}
</style>

<!-- HEADER -->
<div id="outerheader">
	<header id="top">
		<section id="navigation">
			<%--
			<nav>
				<ul id="topnav" class="sf-menu">
					<nav:getMenuByMenuParentId root_menu_id="0" output_name="menus">
						<c:forEach items="${ menus }" var="menu" varStatus="menu_index">
							<c:choose>
								<c:when test="${ empty forwardPath && (menu_index.index == 0) }">
									<li><a href="${ ctxPath }${ menu.menu_url }" class="current">${ menu.menu_name }</a></li>
								</c:when>
								<c:when test="${ fn:contains(forwardPath,menu.menu_code) }">
									<li><a href="${ ctxPath }${ menu.menu_url }" class="current">${ menu.menu_name }</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="${ ctxPath }${ menu.menu_url }">${ menu.menu_name }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</nav:getMenuByMenuParentId>
				</ul>
				<!-- topnav -->
			</nav>
			--%>
			<!-- nav -->
			<!--
			    <ul id="sn">
			    	<li><a href="http://www.cssmoban.com" title="Twitter"><span class="icon-img" style="background:url(images/social/twitter.png)"></span></a></li>
			        <li><a href="https://sc.cssmoban.com" title="Google+"><span class="icon-img" style="background:url(images/social/google.png)"></span></a></li>
			        <li><a href="http://www.cssmoban.com" title="Facebook"><span class="icon-img" style="background:url(images/social/facebook.png)"></span></a></li>
			        <li><a href="http://www.cssmoban.com" title="pinterest"><span class="icon-img" style="background:url(images/social/pinterest.png)"></span></a></li>
			    </ul>	
			-->
			<div class="clear"></div>
		</section>
		<div class="nav-shadow"></div>
		<!--
		<div id="logo" class="frontpage"><a href="default.html"><img src="images/logo.png" alt="" /></a></div>               
		-->
		<div class="clear"></div>
	</header>
</div>
<!-- END HEADER -->
