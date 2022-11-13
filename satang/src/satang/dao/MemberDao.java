package satang.dao;

import java.sql.*;
import java.util.ArrayList;

import satang.db.B15DBCP;
import satang.sql.*;
import satang.vo.MemberVO;


public class MemberDao {
	private B15DBCP db;
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private MemberSQL mSQL;
	private String sql;
	
	public MemberDao() {
		db = new B15DBCP();
		mSQL = new MemberSQL();
	}

	// 아이디 카운트 조회 전담 처리함수
	public int getIdCnt(String id) {
		// 작업순서
		// 1. 반환값 변수 만들고
		int cnt = 0;
		// 2. 커넥션 꺼내오고
		con = db.getCon();
		// 3. 질의명령 가져오고
		sql = mSQL.getSQL(mSQL.SEL_ID_CNT);
		// 4. 명령전달도구 준비하고
		pstmt = db.getPstmt(con, sql);
		try {
			// 5. 질의명령 완성하고
			pstmt.setString(1, id);
			// 6. 질의명령 보내고 결과받고
			rs = pstmt.executeQuery();
			// 7. 결과에서 데이터꺼내고
			rs.next();
			cnt = rs.getInt("cnt");
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			db.close(rs);
			db.close(pstmt);
			db.close(con);
		}
		// 8. 반환값 반환해주고
		return cnt;
	}
	
	// 회원 이름 리스트 조회 전담 처리함수
	public ArrayList<MemberVO> getNameList(){
		// 할일
		// 1. 반환값 변수 만들고
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		// 2. 커넥션 꺼내오고
		con = db.getCon();
		// 3. 질의명령 가져오고
		sql = mSQL.getSQL(mSQL.SEL_ALL_MEMB);
		// 4. 명령전달도구 준비하고
		stmt = db.getStmt(con);
		try {
			// 5. 질의명령 보내고 결과받고
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				// 6. 반복해서 데이터꺼내서 VO 담고
				// VO 만들고
				MemberVO vo = new MemberVO();
				int mno = rs.getInt("mno");
				String name = rs.getNString("name");
				vo.setMno(mno);
				vo.setName(name);
				// 7. list에 VO 담고
				list.add(vo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			db.close(rs);
			db.close(stmt);
			db.close(con);
		}
		// 8. list 반환해주고
		return list;
	}
	
	// jennie 계정 blackpink 테이블 정보 가져오기
	public ArrayList<MemberVO> getBlpkInfo(){
		// 할일
		// 1. 반환값 변수 만들고
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		// 2. 커넥션 꺼내오고
		con = db.getCon();
		// 3. 질의명령 가져오고
		sql = mSQL.getSQL(mSQL.SEL_BLPK_MEMB);
		// 4. 명령전달도구 준비하고
		stmt = db.getStmt(con);
		try {
			// 5. 질의명령 보내고 결과받고
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				// 6. 반복해서 데이터꺼내서 VO 담고
				// VO 만들고
				MemberVO vo = new MemberVO();
				String name = rs.getNString("name");
				String id = rs.getNString("id");
				String mail = rs.getNString("mail");
				vo.setName(name);
				vo.setId(id);
				vo.setMail(mail);
				// 7. list에 VO 담고
				list.add(vo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			db.close(rs);
			db.close(stmt);
			db.close(con);
		}
		// 8. list 반환해주고
		return list;
	}
}
