package com.triquang.controller.frontend;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@WebFilter("/*")
public class AccountLoginFilter implements Filter {

	public AccountLoginFilter() {
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpSession session = httpRequest.getSession(false);

		boolean loggedIn = session != null && session.getAttribute("loggedAccount") != null;
		String loginURI = httpRequest.getContextPath() + "/login";
		boolean loginRequest = httpRequest.getRequestURI().equals(loginURI);
		boolean loginPage = httpRequest.getRequestURI().endsWith("frontend/login.jsp");

		if (loggedIn && (loginRequest || loginPage)) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("");
			dispatcher.forward(request, response);

		} else if (loggedIn || loginRequest) {
			System.out.println("User logged in");
			chain.doFilter(request, response);
		} else {
			System.out.println("User not logged in");
			RequestDispatcher dispatcher = request.getRequestDispatcher("frontend/login.jsp");
			dispatcher.forward(request, response);

		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
