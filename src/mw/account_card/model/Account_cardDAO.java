package mw.account_card.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class Account_cardDAO {

	private SqlSessionTemplate sqlSession = null;
	
	public Account_cardDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 회원이 등록하는 카드/계좌
	public void insert(Account_cardDTO acdto) {
		sqlSession.insert("account_card.ac_insert",acdto);
	}
	
	// 카드정보 이미지 등록		
	public void card_img_insert(Card_imgDTO cdto) {
		sqlSession.insert("account_card.card_img_insert",cdto);
	}
	
	// 카드정보 가져오기
	public List card_select() {
		
		List card_list = new ArrayList();
		card_list = sqlSession.selectList("account_card.card_select");
		
		return card_list;
	}
	
	// 카드회사 가져오기 
	public List card_company_select() {
		
		List card_company_list = new ArrayList();
		card_company_list = sqlSession.selectList("account_card.card_company");
		
		return card_company_list;
	}
	
	// 카드이름 가져오기 
	public List card_name_select() {
		
		List card_name_list = new ArrayList();
		card_name_list = sqlSession.selectList("account_card.card_name");
		
		return card_name_list;
	}
	
	
}
