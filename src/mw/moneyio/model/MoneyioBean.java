package mw.moneyio.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		dao.insert(dto);
		//model.addAttribute(attributeValue);
		return "/moneyio/moneyioPro";
	}
	
	
}
