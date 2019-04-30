package com.shs.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shs.dao.MemberDAO;
import com.shs.dto.MemberDTO;

public class InsertPlayAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "";
		
		// form태그안의 input태그의 name값을 받아옴, id나 class명을 쓸 수 없음
		// 자바는 name값 밖에 못읽는다.
		// request.: 매개변수로 받아온 request에 있는 getParameter을 사용
		String sname = request.getParameter("input_name");
		int sage = Integer.parseInt(request.getParameter("input_age"));
		String smajor = request.getParameter("input_major");
		String sphone = request.getParameter("input_phone");
		
		// static은 객체생성을 하지 않기 때문에 instance가 만들어지지 않아서 접근이 불가능하므로 클래스명을 적어준다.
		MemberDAO mDao = MemberDAO.getInstance(); // sqlSessionFactory 생성
		
		// DTO에 값을 여러개 보내기 위해 mDto라는 변수에 넣음
		MemberDTO mDto = new MemberDTO(sname, sage, smajor, sphone);
		int result = mDao.memInsert(mDto); // sqlSession 생성
		
		if (result > 0) {
			url = "welcome.shs";
		} else {
			url = "insert.shs";
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true); // sendRedirect 방식
		
		return forward;
	}
	
}
