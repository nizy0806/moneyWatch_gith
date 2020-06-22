package mw.moneyio.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class MoneyioDAO {
	
	private SqlSessionTemplate sqlSession = null;
	
	public MoneyioDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List bankName() {
		
		return sqlSession.selectList("moneyio.bankName");
	}
	
	public List bankAccount(String ca_company) {
		//System.out.println(ca_company);
		return sqlSession.selectList("moneyio.bankAccount", ca_company);
	}

	public void insert(MoneyioDTO dto) {
//		System.out.println("id : " + dto.getId());
		sqlSession.insert("moneyio.insert", dto);
		
	}
	public void n_insert(NbreadDTO ndto) {

		sqlSession.insert("moneyio.n_insert", ndto);
	}

	public MoneyioDTO ioUpdateForm(int io_num) {

		return sqlSession.selectOne("moneyio.updateForm", io_num);
	}

	public void ioUpdatePro(int io_num) {
		sqlSession.update("moneyio.update", io_num);
	}

	public List ageChart20() {
		return sqlSession.selectList("moneyio.chart20");
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
