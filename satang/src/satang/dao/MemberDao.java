package satang.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import satang.sql.*;
import satang.db.B15DBCP;

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

	// 아이디 카운트 조회 함수
	public int getIdCnt(String id) {
		// 작업순서
		// 1. 반환값 변수 만들고
		int cnt = 0;
		// 2. 커넥션 꺼내오고
		con = db.getCon();
		// 3. 쿼리 가져오고
		sql = mSQL.getSQL(mSQL.SEL_ID_CNT);
		// 4. 명령전달도구 준비하고
		pstmt = db.getPstmt(con, sql);
		try {
			// 5. 쿼리 완성하고
			pstmt.setNString(1, id);
			// 6. 쿼리 보내고 결과 받고
			rs = pstmt.executeQuery();
			// 7. 결과에서 데이터 꺼내고
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
}
