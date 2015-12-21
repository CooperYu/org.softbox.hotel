<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="tablib.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>
<head>

<head>
	<!-- Basic Page Needs	================================================== -->
	<title><tiles:insertAttribute name="title" /></title>
	
	<!--在html代码的<head>...</head>中嵌入下面代码-->
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=2.0, user-scalable= no" />  
	<meta content="yes" name="apple-mobile-web-app-capable" />  
	<meta content="black" name="apple-mobile-web-app-status-bar-style" />  
	<meta content="telephone=no" name="format-detection" />  

	<link rel="shortcut icon" href="${ ctxPath }/images/favicon.ico" />

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>
	<tiles:insertAttribute name="content" />
</body>
</html>
