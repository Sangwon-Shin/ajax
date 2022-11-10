package satang.controller.member;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import satang.dao.MemberDao;

/**
 * Servlet implementation class IdCheck
 */
@WebServlet("/IdCheck")
public class IdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// 할 일
    	// 1. 파라미터 꺼내고
    	String id = req.getParameter("id");
    	System.out.println("받은 데이터" + id);
    	// 2. 데이터베이스 작업 요청하고 결과 받고
    	MemberDao mDao = new MemberDao();
    	int cnt = mDao.getIdCnt(id);
    	StringBuffer buff = new StringBuffer("{ \"result\": ");
    	// 3. 결과에 따른 처리하고
    	if(cnt == 0) {
    		// 사용가능한 아이디인 경우
    		buff.append("\"OK\"");
    	} else {
    		// 사용불가능한 아이디인 경우
    		buff.append("\"NO\"");
    	}
    	buff.append("}");
    	// 4. 응답문서 보내주고
    	PrintWriter pw = resp.getWriter();
    	pw.println(buff.toString());
	}

}
