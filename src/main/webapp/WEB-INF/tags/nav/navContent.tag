<%@tag import="java.util.Map"%>
<%@tag import="org.hotel.com.bo.MenuBO"%>
<%@tag import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@tag import="org.springframework.context.ApplicationContext"%>
<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ attribute name="menu_id" description="菜单ID" required="true" type="String" %>

<%
	ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
	MenuBO menuBO = (MenuBO) applicationContext.getBean("menuBO");
	Map currentMenu = menuBO.findMenuByMenuId(menu_id);
%>
