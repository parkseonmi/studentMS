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
		
		
		// (7) jsp -> FrontController -> InsertPlayAction으로 request를 사용하여
		//	전송한 input태그들의 value를 꺼내서 sname, sage, smajor, sphone 변수에 각각 담음
		
		// form태그안의 input태그의 name값을 받아옴, id나 class명을 쓸 수 없음
		// 자바는 name값 밖에 못읽는다.
		// request.: 매개변수로 받아온 request에 있는 getParameter을 사용
		String sname = request.getParameter("input_name");
		int sage = Integer.parseInt(request.getParameter("input_age"));
		String smajor = request.getParameter("input_major");
		String sphone = request.getParameter("input_phone");
		
		
		// (8) MemberDAO 객체 빌림
		// static은 객체생성을 하지 않기 때문에 instance가 만들어지지 않아서 접근이 불가능하므로 클래스명을 적어준다.
		MemberDAO mDao = MemberDAO.getInstance(); // sqlSessionFactory 생성
		
		// (9) MemberDTO 객체 생성과 동시에 (이름, 나이, 전공, 번호) 값을 초기화
		// DTO에 값을 여러개 보내기 위해 mDto라는 변수에 넣음
		MemberDTO mDto = new MemberDTO(sname, sage, smajor, sphone);
		
		// (10) MemberDAO 클래스의 memInsert() 함수를 실행
		// 		매개변수로 (이름, 나이, 전공, 번호)가 담긴 mDto를 전송
		int result = mDao.memInsert(mDto); // sqlSession 생성
		// (16) MemberDAO의 memInsert() 메서드에서 보낸 return값을 result 변수에 담음
		
		// (17) result > 0 : 등록 성공
		//		else : 등록 실패
		//		등록 성공 시 이동하는 페이지를 welcome페이지로 설정
		//		등록 실패 시 이동하는 페이지를 학생등록페이지로 설정
		if (result > 0) {
			url = "welcome.shs";
		} else {
			url = "insert.shs";
		}
		
		// (18) ActionForward 객체를 생성 후 forward 인스턴스를 활용하여
		//		forward 인스턴스의 path변수에 "welcome.shs"를
		//		forward 인스턴스의 isRedirect변수에 true값을 각각 담음
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true); // sendRedirect 방식
		
		// (19) path와 isRedirect값을 담고 있는 forward를 return을 사용하여 호출한 곳(FrontController)으로 전송
		return forward;
	}
	
}
