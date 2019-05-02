package com.shs.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WelcomeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "welcome.jsp";
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false); // DB를 타지 않으면 false -> forward
		
		// 페이지 넘길 때 2가지 방법
		// 1) sendRedirect
		// 2) forward
		// true -> sendRedirect
		// false -> forward
		
		return forward;
	}

}
