<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="tablib.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>
<head>

<head>
	<!-- Basic Page Needs	================================================== -->
	<title><tiles:insertAttribute name="title" /></title>
    <meta name="robots" content="index, follow" />
    <meta name="keywords" content="" />
    <meta name="description" content="" />
	<meta name="author" content="" />
	
	<!--在html代码的<head>...</head>中嵌入下面代码-->
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=2.0, user-scalable= no" />  
	<meta content="yes" name="apple-mobile-web-app-capable" />  
	<meta content="black" name="apple-mobile-web-app-status-bar-style" />  
	<meta content="telephone=no" name="format-detection" />  

	<!-- CSS	================================================== -->
    <link rel="stylesheet" href="${ ctxPath }/styles/weixin_style.css" />
    <link rel="stylesheet" href="${ ctxPath }/styles/weixin_inner.css" />
    <link rel="stylesheet" href="${ ctxPath }/styles/weixin_prettyPhoto.css" media="screen" />
    <link rel="stylesheet" href="${ ctxPath }/styles/jquery-ui.css" type="text/css" />
    
    <script type="text/javascript" src="${ ctxPath }/js/jquery-1.6.4.min.js"></script>
    <script type="text/javascript" src="${ ctxPath }/js/jquery-ui-datepicker.js"></script>
    
	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<!-- Favicons	================================================== -->
	<link rel="shortcut icon" href="${ ctxPath }/images/favicon.ico" />

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>
	<div id="bodychild">
		<div id="outercontainer">
			<tiles:insertAttribute name="header" />
			<tiles:insertAttribute name="content" />
<%-- 			<tiles:insertAttribute name="footer" /> --%>
	        <div class="clear"></div>
		</div> <!-- end outercontainer -->
	</div> <!-- end bodychild -->

	<!-- Javascript
	================================================== -->
	
	<!-- jQuery Superfish -->
	<script type="text/javascript" src="${ ctxPath }/js/hoverIntent.js"></script> 
	<script type="text/javascript" src="${ ctxPath }/js/superfish.js"></script> 
	<script type="text/javascript" src="${ ctxPath }/js/supersubs.js"></script>
	
	<!-- Custom Script -->
	<script type="text/javascript" src="${ ctxPath }/js/custom.js"></script>
	
	<!-- Slider -->
	<script type="text/javascript" src="${ ctxPath }/js/jquery.jcarousel.pack.js"></script>
	<script type="text/javascript" src="${ ctxPath }/js/gallery.js"></script>
	<script type="text/javascript" src="${ ctxPath }/js/jquery.cycle.all.min.js"></script>



	<!-- jQuery PrettyPhoto -->
	<script type="text/javascript" src="${ ctxPath }/js/jquery.prettyPhoto.js"></script>
	<script type="text/javascript" src="${ ctxPath }/js/fade.js"></script>
	<!-- jQuery PrettyPhoto Config -->


</body>
</html>
