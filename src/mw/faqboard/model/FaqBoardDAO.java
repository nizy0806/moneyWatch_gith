package mw.faqboard.model;

import org.mybatis.spring.SqlSessionTemplate;
import java.util.HashMap;
import java.util.List;

import mw.faqboard.model.*;


public class FaqBoardDAO {
	
	private SqlSessionTemplate sqlSession = null;
	
		public FaqBoardDAO(SqlSessionTemplate sqlSession) {	
			this.sqlSession = sqlSession;		
		}
		public void insertBoard(FaqBoardDTO dto) {
			sqlSession.insert("faqboard.insertBoard", dto);
		}
		
	/*
	 * public void selectBoard(int start,int end,FaqBoardDTO dto){ HashMap map=new
	 * HashMap(); map.put("start",start); map.put("end",end);
	 * 
	 * sqlSession.selectOne("faqboard.seletBoard",dto); }
	 */
}