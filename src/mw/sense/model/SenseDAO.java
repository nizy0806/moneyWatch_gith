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
	
	//메인 비디오
	public SenseDTO mainVideo() {
		return sqlSession.selectOne("sense.mainVideo"); //
	}
	
	//메인 리스트
	public List<SenseDTO> mainList(){
		return sqlSession.selectList("sense.mainList"); //메인페이지에 리스트를 출력
	}
	
	//메인 카테고리 선택시 리스트
	public List<SenseDTO> mainCategorySelect(int num){
		return sqlSession.selectList("sense.categorySelect", num); //메인페이지 카테고리 선택시 리스트 출력
	}
	
	//디테일 페이지
	public SenseDTO senseDetail(int num) {
		return sqlSession.selectOne("sense.detail", num); //디테일 페이지에 해당 정보를 보여줌
	}
	
	
	//센스 입력 폼에 카테고리 셀렉트 리스트
	public List<SenseCategoryDTO> category() {
		return sqlSession.selectList("sense.category"); //카테고리로 선택해서 불러옴
	}
	
	//센스 직접 입력
	public void senseInsert(SenseDTO dto) {
		sqlSession.insert("sense.insert", dto); //데이터입력
	}
	
	//센스 입력 확인
	public int senseInsertCheck(SenseDTO dto) {
		int check = sqlSession.selectOne("sense.insertCheck", dto);
		System.out.println(check);
		return check;
	}
	
//	//이미지파일 num값 가져오기
//	public int getMaxNum() {
//		int num = sqlSession.selectOne("sense.maxNum");
//		return num;
//	}
	
	
	
}
