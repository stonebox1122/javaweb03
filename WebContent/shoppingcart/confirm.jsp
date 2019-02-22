<%@page import="com.stone.bean.Customer"%>
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
		Customer customer = (Customer)session.getAttribute("customer");
		String[] books = (String[])session.getAttribute("books");
	%>

	<h4>Step3: 确认用户信息</h4>
	<table>
		<tr>
			<td>顾客姓名：</td>
			<td><%= customer.getName() %>
		</tr>
		<tr>
			<td>地址：</td>
			<td><%= customer.getAddress() %>
		</tr>
		<tr>
			<td>卡类型：</td>
			<td><%= customer.getCardType() %>
		</tr>
		<tr>
			<td>卡号：</td>
			<td><%= customer.getCard() %>
		</tr>
		<tr>
			<td>Books: </td>
			<td>
				<%
					for(String book:books){
						out.print(book);
						out.print("<br>");
					}
				%>
			</td>
		</tr>
	</table>

</body>
</html>