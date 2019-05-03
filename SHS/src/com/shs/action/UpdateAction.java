package com.shs.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shs.dao.MemberDAO;
import com.shs.dto.MemberDTO;

public class UpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "shs_update.jsp";
		
		// request.getParameter: 값을 갖고옴, ()안은 보내주는 jsp의 변수명이랑 같아야함
		int id = Integer.parseInt(request.getParameter("id"));
		// System.out.println("id=" + id);
		
		MemberDAO mDao = MemberDAO.getInstance();
		MemberDTO mDto = mDao.memInfo(id);
		
		// response.sendRedirect: 가서 출력해라
		// forward방식으로 데이터를 보내는 법
		// request로 id값과 mDto값을 받음(덮어씌웠기 때문에 자신도 받아야 함)
		request.setAttribute("memInfo", mDto);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false); // forward 방식으로 보냄
		
		return forward;
	}

}
