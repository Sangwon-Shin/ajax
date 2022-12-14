package satang.sql;

public class MemberSQL {
	public final int SEL_ID_CNT 	=		1001;
	public final int SEL_ALL_MEMB	= 		1002;
	public final int SEL_BLPK_MEMB	=		1003;
	
	public String getSQL(int code) {
		StringBuffer buff = new StringBuffer();
		switch(code) {
		case SEL_ID_CNT:
			buff.append("SELECT ");
			buff.append("	COUNT(*) cnt ");
			buff.append("FROM ");
			buff.append("	member ");
			buff.append("WHERE ");
			buff.append("	id = ? ");
			break;
		case SEL_ALL_MEMB:
			buff.append("SELECT ");
			buff.append("	mno, name ");
			buff.append("FROM ");
			buff.append("	member ");
			buff.append("WHERE ");
			buff.append("	isShow = 'Y' ");
			break;
		case SEL_BLPK_MEMB:
			buff.append("SELECT ");
			buff.append("	name, id, mail ");
			buff.append("FROM ");
			buff.append("	blackpink ");
			break;
		}
		return buff.toString();
	}
}
