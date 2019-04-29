package com.shs.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shs.dao.MemberDAO;
import com.shs.dto.MemberDTO;

/**
 * Servlet implementation class SHSUpdate
 */
@WebServlet("/SHSUpdate")
public class SHSUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SHSUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GET: 학생수정페이지 출력");
		
		// request.getParameter: 값을 갖고옴, ()안은 보내주는 jsp의 변수명이랑 같아야함
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println("id=" + id);
		
		MemberDAO mDao = MemberDAO.getInstance();
		MemberDTO mDto = mDao.memInfo(id);
		
		// response.sendRedirect: 가서 출력해라
		// forward방식으로 데이터를 보내는 법
		// request로 id값과 mDto값을 받음(덮어씌웠기 때문에 자신도 받아야 함)
		request.setAttribute("memInfo", mDto);
		RequestDispatcher dis = request.getRequestDispatcher("shs_update.jsp");
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("POST: 학생수정 ACTION 동작");
		
		request.setCharacterEncoding("UTF-8");
		
		int sid = Integer.parseInt(request.getParameter("input_id"));
		String sname = request.getParameter("input_name");
		int sage = Integer.parseInt(request.getParameter("input_age"));
		String smajor = request.getParameter("input_major");
		String sphone = request.getParameter("input_phone");
		
		// System.out.println(sid + ", " + sname + ", " + sage + ", " + smajor + ", " + sphone);
		
		MemberDTO mDto = new MemberDTO(sid, sname, sage, smajor, sphone);
		// System.out.println(mDto.toString());
		
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.memUpdate(mDto);
		
		if (result > 0) {
			response.sendRedirect("SHSSelect");
		} else {
			response.sendRedirect("SHSUpdate");
		}
		
	}
}
