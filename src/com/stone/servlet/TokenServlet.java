package com.stone.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/tokenServlet")
public class TokenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();
		//获取 session的 token 值
		Object token = session.getAttribute("token");
		//获取 隐藏域 中的 token 值
		String tokenValue = request.getParameter("token");
		System.out.println(token);
		System.out.println(tokenValue);
		//比较两个值是否一致: 若一致, 受理请求, 且把 session 域中的 token 属性清除
		if (token != null && token.equals(tokenValue)) {
			session.removeAttribute("token");
		} else {
			//若不一致, 则直接响应提示页面: "重复提交"
			response.sendRedirect(request.getContextPath() + "/token/token.jsp");
			return;
		}
		
		String name = request.getParameter("name");
		System.out.println(name);
		request.getRequestDispatcher("/token/success.jsp").forward(request, response);
	}
}