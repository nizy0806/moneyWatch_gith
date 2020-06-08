package mw.member.model;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberDAO {
	
	
	private SqlSessionTemplate sqlSession = null;
	
	public MemberDAO(SqlSessionTemplate sqlSession) {	// 생성자
		this.sqlSession = sqlSession;	// 생성자를 통해서 SqlSessionTemplate 가져오기(생성)		
	}
	
	public int loginCheck(MemberDTO dto) {
		int check = (int)sqlSession.selectOne("member.loginCheck", dto);
		
		return check;
	}
	
	public void insert(MemberDTO dto) {
		sqlSession.insert("member.insert", dto);
	}
	
	public int confirmId(String id) {
		int check = sqlSession.selectOne("member.confirmId", id);
		
		return check;
	}
	
	
	
	
	
}
