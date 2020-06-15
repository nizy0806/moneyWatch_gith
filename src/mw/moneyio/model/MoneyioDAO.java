package mw.moneyio.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class MoneyioDAO {
	private SqlSessionTemplate sqlSession = null;
	
	public MoneyioDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List bankName(String id) {
		List bank = sqlSession.selectList("moneyio.bankName", id);
		return bank;
	}
	
	public List bankAccount(MoneyioDTO dto) {
		List account = sqlSession.selectList("moneyio.bankAccount", dto);
		return account;
	}
	
	public void insert(MoneyioDTO dto) {
//		System.out.println("id : " + dto.getId());
//		System.out.println("category : " + dto.getIo_category());
//		System.out.println("detail : " + dto.getIo_detail());
//		System.out.println("reg_date : " + dto.getIo_reg_date());
//		System.out.println("price : " + dto.getIo_price());
//		System.out.println("remain : " + dto.getIo_remain());
//		System.out.println("bank : " + dto.getIo_bank());
//		System.out.println("account : " + dto.getIo_account());
//		System.out.println("n_div : " + dto.getIo_N_div());
//		System.out.println("set : " + dto.getIo_set());
		
		sqlSession.insert("moneyio.insert", dto);
	}
}
