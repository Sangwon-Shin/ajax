package satang.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.InitialContext;
/**
 *  이 클래스는 커넥션 풀에 있는 커넥션을 이용해서
 *  데이터베이스 작업을 할 유틸리티 클래스이다.
 *  @author 신상원
 *  @since 2022/11/10
 *  
 */
import javax.sql.DataSource;

public class B15DBCP {
	// 커넥션 풀 관리할 변수
	public DataSource ds;
	/*
		이 클래스를 누군가 new 시키면 ajax server-config/context.xml 
		파일에 등록된 자원을 가지고 와야 한다.
		이처럼 context.xml 파일에 등록된 자원을 가지고 오는 기법을
		JNDI(Java Naming and Directory Interface) 라고 한다. 
	 */
	public B15DBCP() {
		try {
			// 1. context.xml 에 등록된 자원을 알아낸다.
			InitialContext context = new InitialContext();
			// 2. 그중에 필요한 자원을 꺼내온다.
			ds = (DataSource) context.lookup("java:/comp/env/jdbc/TestDB");
			/*
				찾을 이름을 정하는 규칙
					java:/comp/env/찾을이름
				comp == computer
				이 경우 찾을이름 == jdbc/TestDB
			 */
		} catch(Exception e) {
			System.out.println(e);
		}
	}
	/*
	 * 필요한 순간에 커넥션 풀에 있는 커넥션을 하나 꺼내서 반환해주는 함수
	 */
	public Connection getCon() {
		Connection con = null;
		try {
			// DataSource 에서 하나 꺼내온다.
			con = ds.getConnection();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	// 필요한 순간에 Statement 를 반환해주는 함수
	public Statement getStmt(Connection con) {
		Statement stmt = null;
		try {
			stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return stmt;
	}
	
	// PreparedStatement 반환해주는 함수
	public PreparedStatement getPstmt(Connection con, String sql) {
		PreparedStatement pstmt = null;
		try {
			pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return pstmt;
	}
	
	// 사용하지 않는 자원 반환해주는 함수
	public void close(Object o) {
		// 어떤 자원을 반환해줘야할지 모르므로 입력받아서 형변환해서 반환
		try {
			if(o instanceof Connection) {
				((Connection) o).close();
			} else if(o instanceof Statement) {
				((Statement) o).close();
			} else if(o instanceof PreparedStatement) {
				((PreparedStatement) o).close();
			} else if(o instanceof ResultSet) {
				((ResultSet) o).close();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
