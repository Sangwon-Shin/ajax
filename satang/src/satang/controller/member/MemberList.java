package satang.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import satang.dao.MemberDao;
import satang.vo.MemberVO;

@WebServlet("/member/memberList.smart")
public class MemberList extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 할일
		// 이 함수는 /satang/member/memberList.smart 라고 클라이언트가 서버에게 요청하면 호출되는 함수이다.
		// 이 함수가 할일은
		// 데이터베이스 조회의 결과 리스트를 클라이언트에게 전달하면 된다.
		// 이때 전달할 데이터의 형식은 Json 형식이 되어야 한다.
		// 1. 데이터베이스에서 조회한 리스트를 받는다.
		MemberDao mDao = new MemberDao();
		ArrayList<MemberVO> list = mDao.getBlpkInfo();
		// 2. 전달받은 리스트를 응답문서로 변환해준다.
		// 		==> [데이터1, 데이터2, ...] ==> [{}, {}, {}]
		StringBuffer buff = new StringBuffer("{ \"result\": [");
		/*
		for(int i = 0 ; i < list.size(); i++ ) {
			MemberVO vo = list.get(i);
			buff.append("{ \"mno\": \"" + vo.getMno() + "\", ");
			buff.append(" \"name\": \"" + vo.getName() + "\" }");
			if(i < list.size() - 1) {
				buff.append(", ");
			}
		}
		buff.append("] }");
		 */
		for(int i = 0 ; i < list.size(); i++ ) {
			MemberVO vo = list.get(i);
			buff.append("{ \"name\": \"" + vo.getName() + "\", ");
			buff.append(" \"id\": \"" + vo.getId() + "\", ");
			buff.append(" \"mail\": \"" + vo.getMail() + "\" }");
			if(i < list.size() - 1) {
				buff.append(", ");
			}
		}
		buff.append("] }");
		
		
		resp.setCharacterEncoding("UTF-8");
		// 3. 변환된 문서로 응답해준다.
		// 응답문서 작성도구 준비하고
		PrintWriter pw = resp.getWriter();
		// 응답문서 작성하고
		pw.print(buff.toString());
		System.out.println(buff.toString());
	}
}