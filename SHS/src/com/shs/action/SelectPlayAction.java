package com.shs.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shs.dao.MemberDAO;
import com.shs.dto.MemberDTO;

public class SelectPlayAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "shs_select.jsp";
		
		// 학생목록 DB에서 가져와서 View로 보냄
		MemberDAO mDao = MemberDAO.getInstance();
		List<MemberDTO> list = mDao.memSelect();
		request.setAttribute("shslist", list);
		
		// 총 인원 수 계산 후 보내줌
		int cnt = list.size();
		request.setAttribute("cnt", cnt);
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false); // forward 방식으로 보냄
		
		return forward;
	}

}
