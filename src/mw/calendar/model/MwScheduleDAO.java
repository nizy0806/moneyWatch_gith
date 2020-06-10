package mw.calendar.model;

import org.mybatis.spring.SqlSessionTemplate;

public class MwScheduleDAO {

	private SqlSessionTemplate sqlSession = null;
	
	// sql문을 사용하기 위함
	public MwScheduleDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 일정추가	
	public void schedule_insert(MwScheduleDTO mwdto) {
		sqlSession.insert("calendar.schedule_insert",mwdto);
	}
}
