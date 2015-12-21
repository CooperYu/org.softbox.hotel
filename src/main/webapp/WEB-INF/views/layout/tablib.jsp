<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<%
	String ctxPath = request.getContextPath();
	String currentPage =  pageContext.getRequest().getAttribute("javax.servlet.forward.request_uri").toString();
	String forwardPath = currentPage.substring(ctxPath.length() + 1 ,currentPage.length());
	
	request.setAttribute("forwardPath", forwardPath);//前台转发的上下文路径

	request.setAttribute("ctxPath",ctxPath);//前台上下文路径
	
	request.setAttribute("adminCtxPath", ctxPath + "/admin");//后台上下文路径；
	request.setAttribute("adminResCtxPath", ctxPath + "/adminRes");//后台图片资源上下文路径
%>