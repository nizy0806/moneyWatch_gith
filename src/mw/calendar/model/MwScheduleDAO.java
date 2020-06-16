package mw.calendar.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class MwScheduleDAO {

	private SqlSessionTemplate sqlSession = null; //mybatis를 사용하기 위한 작업 - 연결
	
	// sql문을 사용하기 위함
	public MwScheduleDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 일정추가	
	public void schedule_insert(MwScheduleDTO mwdto) {
		System.out.println("insert 실행!!");
		sqlSession.insert("calendar.schedule_insert", mwdto);
	}
	
	// 일정출력	
	public List<MwScheduleDTO> schedule_select(MwScheduleDTO mwdto) throws Exception {
		System.out.println("select 실행!!");
		return sqlSession.selectList("calendar.schedule_select", mwdto);
	}
}
