package mw.moneyio.model;

import java.util.HashMap;
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
	//지출/수입 내역 입력
	public void insert(MoneyioDTO dto, NbreadDTO ndto) {  
//		System.out.println("id : " + dto.getId());
		
		sqlSession.insert("moneyio.insert", dto);
		if(dto.getIo_n_div() > 0) {
			sqlSession.insert("moneyio.n_insert", ndto );
		}
	}
	//지출/수입 내역 수정 페이지
	public List ioUpdateForm(int io_num) {
		return sqlSession.selectList("moneyio.updateForm", io_num);
	}
	//지출/수입 내역 n빵 수정 페이지
	public List ioNbreadForm(int n_num) {
		return sqlSession.selectList("moneyio.n_updateForm", n_num);
	}
	//지출/수입 내역 수정
	public void ioUpdatePro(int io_num) {
		sqlSession.update("moneyio.update", io_num);
	}
	//지출/수입 내역 n빵 수정
	public void ioNbreadPro(int n_num) {
		sqlSession.update("moneyio.n_update", n_num);
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
	
	public MoneyioDTO moneyioListDetail(String id, int ioNum) {
		
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("ioNum", ioNum);
		
		return sqlSession.selectOne("moneyio.moneyioListDetail", map);
	}
}
