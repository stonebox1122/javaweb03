<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		//在JavaWeb规范中使用Cookie类表示cookie

		//3.获取Cookie
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 1) {
			for (Cookie cookie : cookies) {
				out.print(cookie.getName() + " : " + cookie.getValue());
				out.print("<br>");
			}
		} else {
			out.print("没有一个Cookie，正在创建并返回");
			//1.创建一个Cookie对象
			Cookie cookie = new Cookie("name", "stone");
			//设置Cookie的最大失效，以秒为单位，若为0表示立即删除该Cookie，若为负数，表示不存储该Cookie
			cookie.setMaxAge(30);

			//2.调用response的一个方法把Cookie传给客户端
			response.addCookie(cookie);
		}
	%>

</body>
</html>