<%--
	通过categoryId获取Category对象
--%>
<%@ tag language="java" pageEncoding="UTF-8"%>

<%@tag import="java.util.Map"%>
<%@tag import="org.hotel.com.bo.CategoryBO"%>
<%@tag import="org.springframework.web.context.WebApplicationContext"%>
<%@tag import="java.util.List"%>
<%@tag import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@tag import="org.springframework.context.ApplicationContext"%>



<%@ attribute name="category_id" description="类型ID" required="true" type="String" %>
<%@ attribute name="output_name" description="输出属性的名字" required="true" type="String" %>

<%
	ApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getSession().getServletContext());
	CategoryBO categoryBO = (CategoryBO) applicationContext.getBean("categoryBO");
	Map categoryMap = categoryBO.findCategoryByCategoryId(category_id);
	request.setAttribute(output_name,categoryMap);
%>
<jsp:doBody />
