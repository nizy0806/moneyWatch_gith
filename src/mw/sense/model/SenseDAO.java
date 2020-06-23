package mw.sense.model;

import java.util.HashMap;
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
	
	//디테일 메인 비디오
	public String senseDetailVideo(int num) {
		String url = sqlSession.selectOne("sense.senseDetailVideo", num); //메인 리스트에서 선택시 비디오 url 변경
		return url;
	}
	
	
	//디테일 페이지
	public SenseDTO senseDetail(int num) {
		SenseDTO dto = sqlSession.selectOne("sense.select", num);
		return dto; //디테일 페이지에 해당 정보를 보여줌
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
		return check;
	}
	
	// ID confirm	
	
	
	// PW confirm
	public int confirmPassword(String id, String password) {
		
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("pw", password);
		int check = sqlSession.selectOne("sense.confirmPassword", map);
		
		return check;
	}
	
	
	// 센스 수정 페이지 불러오기
	public SenseDTO senseModifySelect(int num) {
		SenseDTO dto = (SenseDTO)sqlSession.selectOne("sense.select", num);
		return dto; //센스 수정 페이지에 해당 정보를 보여줌
	}
	
	// 센스 수정하기
	public void senseModify(SenseDTO dto) {
		sqlSession.update("sense.senseModify",dto);
	}
	
	// 센스 수정 확인
	public int senseModifyCheck(SenseDTO dto) {
		int check = sqlSession.selectOne("sense.modifyCheck", dto);
		return check;
	}
	
	// 센스 삭제
	public void senseDelete(int num) {
		sqlSession.delete("senseDelete", num);
	}
	
	// 센스 삭제 확인
	
	public int senseDeleteCheck(int num) {
		int deleteCheck = sqlSession.selectOne("senseDeleteCheck", num);
		return deleteCheck;
	}
	
}
