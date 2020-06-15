package mw.moneyio.model;

import java.util.ArrayList;
import java.util.List;

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
		dao.insert(dto);
		return "/moneyio/moneyioPro";
	}
	
	@RequestMapping("moneyModal.mw")
	public String moneyModal() {
		return "/moneyio/moneyModal";
	}
	
	
	@RequestMapping("moneyioList.mw")	
	public String moneyioList(/*String id, */Model model) {
		String id = "minmingk1";

		List list = new ArrayList();
		list = dao.moneyioListAll(id);
		
		model.addAttribute("moneyioList", list);
		
		return "/moneyio/moneyioList";
	}
	
	@RequestMapping("ioList.mw")	
	public String moneyioList(String id, String filter, Model model) {
		
		List list = new ArrayList();
		
		System.out.println(id);
		System.out.println(filter);
		
		
		if(filter == "all") {
			list = dao.moneyioListAll(id);
		}else if (filter == "inMoney") {
			list = dao.moneyioListIn(id);
		}else {
			list = dao.moneyioListOut(id);
		}

		model.addAttribute("moneyioList", list);
		
		return "/moneyio/ioList";
	}
	
}
