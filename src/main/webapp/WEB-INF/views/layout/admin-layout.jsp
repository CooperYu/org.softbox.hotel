<%-- 
	后台页面布局；
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="tablib.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>井庭酒店后台管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
    <meta name="author" content="Muhammad Usman">

    <!-- The styles -->
    <link href="${ adminResCtxPath }/css/bootstrap-cerulean.min.css" rel="stylesheet">
    <link href="${ adminResCtxPath }/css/charisma-app.css" rel="stylesheet">
    <link href='${ adminResCtxPath }/bower_components/fullcalendar/dist/fullcalendar.css' rel='stylesheet'>
    <link href='${ adminResCtxPath }/bower_components/fullcalendar/dist/fullcalendar.print.css' rel='stylesheet' media='print'>
    <link href='${ adminResCtxPath }/bower_components/chosen/chosen.min.css' rel='stylesheet'>
    <link href='${ adminResCtxPath }/bower_components/colorbox/example3/colorbox.css' rel='stylesheet'>
    <link href='${ adminResCtxPath }/bower_components/responsive-tables/responsive-tables.css' rel='stylesheet'>
    <link href='${ adminResCtxPath }/bower_components/bootstrap-tour/build/css/bootstrap-tour.min.css' rel='stylesheet'>
    <link href='${ adminResCtxPath }/css/jquery.noty.css' rel='stylesheet'>
    <link href='${ adminResCtxPath }/css/noty_theme_default.css' rel='stylesheet'>
    <link href='${ adminResCtxPath }/css/elfinder.min.css' rel='stylesheet'>
    <link href='${ adminResCtxPath }/css/elfinder.theme.css' rel='stylesheet'>
    <link href='${ adminResCtxPath }/css/jquery.iphone.toggle.css' rel='stylesheet'>
    <link href='${ adminResCtxPath }/css/uploadify.css' rel='stylesheet'>
    <link href='${ adminResCtxPath }/css/animate.min.css' rel='stylesheet'>

    <!-- jQuery -->
    <script src="${ adminResCtxPath }/bower_components/jquery/jquery.min.js"></script>

    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- The fav icon -->
    <link rel="shortcut icon" href="${ adminResCtxPath }/img/favicon.ico">



	<script src="${ adminResCtxPath }/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- library for cookie management -->
	<script src="${ adminResCtxPath }/js/jquery.cookie.js"></script>
	<!-- calender plugin -->
	<script src='${ adminResCtxPath }/bower_components/moment/min/moment.min.js'></script>
	<script src='${ adminResCtxPath }/bower_components/fullcalendar/dist/fullcalendar.min.js'></script>
	<!-- data table plugin -->
	<script src='${ adminResCtxPath }/js/jquery.dataTables.min.js'></script>
	<!-- select or dropdown enhancer -->
	<script src="${ adminResCtxPath }/bower_components/chosen/chosen.jquery.min.js"></script>
	<!-- plugin for gallery image view -->
	<script src="${ adminResCtxPath }/bower_components/colorbox/jquery.colorbox-min.js"></script>
	<!-- notification plugin -->
	<script src="${ adminResCtxPath }/js/jquery.noty.js"></script>
	<!-- library for making tables responsive -->
	<script src="${ adminResCtxPath }/bower_components/responsive-tables/responsive-tables.js"></script>
	<!-- tour plugin -->
	<script src="${ adminResCtxPath }/bower_components/bootstrap-tour/build/js/bootstrap-tour.min.js"></script>
	<!-- star rating plugin -->
	<script src="${ adminResCtxPath }/js/jquery.raty.min.js"></script>
	<!-- for iOS style toggle switch -->
	<script src="${ adminResCtxPath }/js/jquery.iphone.toggle.js"></script>
	<!-- autogrowing textarea plugin -->
	<script src="${ adminResCtxPath }/js/jquery.autogrow-textarea.js"></script>
	<!-- multiple file upload plugin -->
	<script src="${ adminResCtxPath }/js/jquery.uploadify-3.1.min.js"></script>
	<!-- history.js for cross-browser state change on ajax -->
	<script src="${ adminResCtxPath }/js/jquery.history.js"></script>
	<!-- application script for Charisma demo -->
	<script src="${ adminResCtxPath }/js/charisma.js"></script>

</head>
<body>
	<%-- 头部文件，包含Banner --%>
	<tiles:insertAttribute name="header" />
    <!-- topbar ends -->
	<div class="ch-container">
	
		<div class="row">
		    <%-- 左导航栏{ --%>
			<%@ include file="admin/left_menu.jspf" %>
			<%-- }左导航栏 --%>
			
			<%-- 内容 --%>
			<div id="content" class="col-lg-10 col-sm-10">
			    <!-- content starts -->
			    <%--
	            <div>
				    <ul class="breadcrumb">
				        <%-- <li><a href="#">Home</a></li> --%
				        <li><a href="admin/index.html">Home</a></li>
				    </ul>
	            </div>
			    --%>
	            <div class="row">
                    <div class="box col-md-12">
                        <div class="box-inner">
                            <tiles:insertAttribute name="content" />
                        </div>
                    </div>
                </div>                        
	        </div>
        </div>
		
		<%-- 脚步文件； --%>
		<footer class="row">
			<tiles:insertAttribute name="footer" />
		</footer>
	</div>
	
</body>
</html>
