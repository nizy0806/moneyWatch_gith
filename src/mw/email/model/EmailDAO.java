package mw.email.model;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import mw.email.model.EmailDTO;
import org.mybatis.spring.SqlSessionTemplate;

public class EmailDAO {
	private SqlSessionTemplate sqlSession = null;
	
	public EmailDAO(SqlSessionTemplate sqlSession) {	// 생성자
		this.sqlSession = sqlSession;	// 생성자를 통해서 SqlSessionTemplate 가져오기(생성)		
	}
	//아이디 유무 체크
	public int idFind(EmailDTO dto) {
		int check = sqlSession.selectOne("email.idFind", dto);
		return check;
	}
	//아이디 찾기
	public String idWhat(EmailDTO dto) {
		return sqlSession.selectOne("email.idWhat", dto);
	}
	public int pwFind(EmailDTO dto) {
		return sqlSession.selectOne("email.pwFind", dto);
	}
	
	public void pwUpdate(EmailDTO dto, String pw) {
		HashMap map1 = new HashMap();
		
		dto.setPw(pw);
		//System.out.println("dto : "+dto.getId());
		sqlSession.update("email.pwUpdate",dto);
	}
}
