package mw.member.model;

import org.mybatis.spring.SqlSessionTemplate;
import java.util.HashMap;
import mw.member.model.*;

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
	
	public int memberCheck(String id) {
		int checker = sqlSession.selectOne("member.memberCheck", id);
		
		return checker;
	}
	
	public int deleteCheck(String id,String pw) { 
		HashMap map = new HashMap();
		map.put("id",id);
		map.put("pw",pw);
		
		int check = (int)sqlSession.selectOne("member.deleteCheck",map);
		return check;
	}
	
	public void deleteMem(String id) {
		sqlSession.delete("member.deleteMem", id);
	
	}
	
	public MemberDTO deleteSelect(String id) {
		MemberDTO dto1=(MemberDTO)sqlSession.selectOne("member.deleteSelect", id);
		return dto1;
	}
	
	public void deleteInsert(DeleteMemListDTO dto2) {
		sqlSession.insert("member.deleteMemList", dto2);
	}
	
	public MemberDTO modifyCheck(String id) {
		MemberDTO dto = (MemberDTO)sqlSession.selectOne("member.modifyCheck",id);
	    return dto;
	}

	public void updateMember(MemberDTO dto){
		sqlSession.update("member.updateMember", dto);

	}
}
