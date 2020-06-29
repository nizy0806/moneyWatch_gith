package mw.main.model;

import org.mybatis.spring.SqlSessionTemplate;

public class MainDAO {
		
	//mybatis에 연결
	private SqlSessionTemplate sqlSession = null; 	
	
	//sqlSession을 이용한 SQL에 연결
	public MainDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//메인 영상 url 출력
	public MainDTO video_url() {
		return sqlSession.selectOne("main.video_url");
	}
}
