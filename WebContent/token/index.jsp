<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		//在原表单页面, 生成一个随机值 token
		String tokenValue = new Date().getTime() + "";
		//在原表单页面, 把 token 值放入 session 属性中
		session.setAttribute("token", tokenValue);
	%>
	
	<form action="<%= request.getContextPath() %>/tokenServlet" method="post">
		//在原表单页面, 把 token 值放入到 隐藏域 中
		<input type="hidden" name="token" value="<%= tokenValue %>">
		name: <input type="text" name="name">
		<input type="submit" value="Submit">
	</form>

</body>
</html>