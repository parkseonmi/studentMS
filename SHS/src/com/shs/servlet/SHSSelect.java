package com.shs.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shs.dao.MemberDAO;
import com.shs.dto.MemberDTO;

/**
 * Servlet implementation class SHSSelect
 */
@WebServlet("/SHSSelect")
public class SHSSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SHSSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GET:출석부 페이지 출력");
		
		// DAO에서 DB를 가져와야함
		MemberDAO mDao = MemberDAO.getInstance();
		List<MemberDTO> list = mDao.memSelect();
		
		// servlet에서 페이지 이동방법 2가지
		// 1. redirect: 페이지를 새로 만들어서 이동함, url주소 변환,
		//				데이터를 가져오기 힘듦(DB를 타서 페이지의 변화가 생기는 경우)
		// 2. forward: 페이지를 덮어씌움, url주소 바뀌지 않음
		//				데이터를 가지고 갈 수 있음(DB를 타지만 변화가 없거나 그대로 가져오는 경우)
		
		
		request.setAttribute("shslist", list);
		
		RequestDispatcher dis = request.getRequestDispatcher("shs_select.jsp");
		dis.forward(request, response);
		
		// response.sendRedirect("shs_select.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
