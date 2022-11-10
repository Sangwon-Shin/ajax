package satang.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *  회원가입 폼보기 요청 처리 서블릿 클래스
 */
@WebServlet("/member/join.smart")
public class Join extends HttpServlet {
	/** 
	 *  회원가입 폼보기 요청
	 */
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 이 함수는 /member/join.smart 로 요청하면 회원가입 페이지를 보여주는 요청 처리 함수
		String path = "/WEB-INF/views/member/join.jsp";
		RequestDispatcher dispatch = req.getRequestDispatcher(path);
		dispatch.forward(req, resp);
	}




}
