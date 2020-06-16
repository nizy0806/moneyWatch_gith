package mw.sense.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class SenseDAO {

	//mybatis에 연결
	private SqlSessionTemplate sqlSession = null; 	
	
	//sqlSession을 이용한 SQL에 연결
	public SenseDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//메인
	
	//선택리스트
	public List<SenseDTO> categorySelect(String category) {
		return sqlSession.selectList("sense.categorySelect", category); //카테고리로 선택해서 불러옴
	}
	
	//센스 임의 입력과 입력 확인
	public int senseWrite(SenseDTO dto) {
		sqlSession.insert("sense.insert", dto); //데이터입력
		int check = sqlSession.selectOne("sense.insertCheck", dto); //입력확인
		return check;
	}
	
	
	
}
