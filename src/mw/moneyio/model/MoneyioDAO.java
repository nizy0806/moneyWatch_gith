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
		sqlSession.insert("moneyio.insert", dto);
	}
	
	public List moneyioListAll(String id) {
		
		return sqlSession.selectList("moneyio.moneyioListAll", id);
	}
	public List moneyioListIn(String id) {
		
		return sqlSession.selectList("moneyio.moneyioListIn", id);
	}
	public List moneyioListOut(String id) {
		
		return sqlSession.selectList("moneyio.moneyioListOut", id);
	}
}
