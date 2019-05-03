package com.shs.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "shs_insert.jsp";
		
//		7. ActionForward 객체를 생성 후 forward 인스턴스를 활용하여
//		forward 인스턴스의 path변수에 "shs_insert.jsp"를
//		forward 인스턴스의 isRedirect변수에 false값을 각각 담음
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
//		8. path와 isRedirect값을 담고 있는 forward를
//		return을 사용하여 호출한 곳(FrontController)으로 전송
		return forward;
	}

}
