package mw.account_card.model;

import java.util.ArrayList;
import java.util.HashMap;
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
	
	// 카드회사  및 카드이름 가져오기 
	public List card_cn_select(String cardName) {
		
		List card_cn_list = new ArrayList();
		card_cn_list = sqlSession.selectList("account_card.card_cn",cardName);
		
		return card_cn_list;
	}
	
	// 카드사 가져오기
	public List card_company_select() {
		
		List card_company_list = new ArrayList();
		card_company_list = sqlSession.selectList("account_card.card_company");
		
		return card_company_list;
	}
	
	// 카드명에 따른 카드혜택 가져오기
	public List card_benefit_select(String cardName) {
		
		List card_benefit_list = new ArrayList();
		card_benefit_list = sqlSession.selectList("account_card.card_benefit",cardName);
		
		return card_benefit_list;
	}
	
	//카드 이미지
	public List card_img() {
		
		List card_img = new ArrayList();
		card_img = sqlSession.selectList("account_card.card_img");
		
		return card_img;
	}
	
	// 나의 카드 및 계좌정보 확인
	public List myCard(String id) {
		
		List mycard = new ArrayList();
		mycard = sqlSession.selectList("account_card.my_ac",id);
		
		return mycard;
	}
	
	// 나의 카드 및 계좌정보 삭제
	public void delMyCard(String id, int num) {
		
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("num",num);
		
		sqlSession.delete("account_card.my_ac_del",map);
	}

	// 나의 카드 혜택보기 
	public List mycard_benefit(String ca_name) {
		
		System.out.println(ca_name);
		List myBenefit = new ArrayList();
		myBenefit = sqlSession.selectList("account_card.my_ac_benefit",ca_name);
		
		return myBenefit;
	}
	
}
