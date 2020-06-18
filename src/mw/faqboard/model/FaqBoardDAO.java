package mw.faqboard.model;

import org.mybatis.spring.SqlSessionTemplate;
import java.util.HashMap;
import mw.faqboard.model.*;


public class FaqBoardDAO {
	
	private SqlSessionTemplate sqlSession = null;
	
		public FaqBoardDAO(SqlSessionTemplate sqlSession) {	// 생성자
			this.sqlSession = sqlSession;	// 생성자를 통해서 SqlSessionTemplate 가져오기(생성)		
	}
}
