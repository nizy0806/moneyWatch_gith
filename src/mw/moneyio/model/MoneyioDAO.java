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

	//지출/수입 내역 수정
	public void ioUpdatePro(MoneyioDTO dto) {
		sqlSession.update("moneyio.update", dto);
	}
	
	public void n_UpdatePro(NbreadDTO ndto) {
		sqlSession.update("moneyio.n_update", ndto);
	}
	public void n_delete(int io_num) {
		sqlSession.delete("moneyio.n_delete", io_num);
	}
	public void n_insert2(NbreadDTO ndto) {
		sqlSession.insert("moneyio.n_insert2", ndto);
	}

	//연령대별 지출 chart 페이지 -20
	public List ageChart20() {
		return sqlSession.selectList("moneyio.chart20");
	}
	
	//연령대별 지출 chart 페이지 -30
	public List ageChart30() {
		return sqlSession.selectList("moneyio.chart30");
	}
	
	//연령대별 지출 chart 페이지 -40
	public List ageChart40() {
		return sqlSession.selectList("moneyio.chart40");
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
