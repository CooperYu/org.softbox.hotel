<%--
	获取的ID；
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ tag import="org.springframework.web.context.WebApplicationContext"%>
<%@ tag import="java.util.List"%>
<%@ tag import="org.hotel.com.bo.MenuBO"%>
<%@ tag import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ tag import="org.springframework.context.ApplicationContext"%>

<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ attribute name="root_menu_id" description="根目录ID" required="true" type="Integer" %>
<%@ attribute name="depth" description="深度" required="false" type="String" %>
<%@ attribute name="output_name" description="输出属性的名字" required="true" type="String" %>

<%
	ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
	MenuBO menuBO = (MenuBO) applicationContext.getBean("menuBO");
	List menuList = menuBO.findMenuByParentId(root_menu_id);
	request.setAttribute(output_name,menuList);
%>
<jsp:doBody />
