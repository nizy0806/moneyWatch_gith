package mw.moneyio.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MoneyioBean {
	@Autowired
	private MoneyioDAO dao = null;
	@RequestMapping("moneyioForm.mw")
	public String moneyioForm() {
		
		return "/moneyio/moneyioForm";
	}
	
	
	@RequestMapping("moneyioPro.mw")
	public String moneyioPro(MoneyioDTO dto) {
		dao.insert(dto);
		return "/moneyio/moneyioPro";
	}
	
	@RequestMapping("moneyModal.mw")
	public String moneyModal() {
		return "/moneyio/moneyModal";
	}
	
}
