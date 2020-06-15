package mw.moneyio.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

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
	
	
	
	@RequestMapping("moneyioList.mw")	
	public String moneyioList(/*String id, */Model model, HttpSession session) {
		
		String id = "minmingk1";
	/* String id = session.getAttribute("memId"); */

		List list = new ArrayList();
		list = dao.moneyioListAll(id);
		
		model.addAttribute("moneyioList", list);
		
		return "/moneyio/moneyioList";
	}
	
	@RequestMapping("ioList.mw")	
	public String ioList(String filter, Model model, HttpSession session) {
		
		List list = new ArrayList();
		
		String id = "minmingk1";
		/* String id = session.getAttribute("memId"); */
		
		if(filter.equals("all")) {
			list = dao.moneyioListAll(id);
		}else if (filter.equals("inMoney")) {
			list = dao.moneyioListIn(id);
		}else {
			list = dao.moneyioListOut(id);
		}

		model.addAttribute("id",id);
		model.addAttribute("moneyioList", list);
		
		return "/moneyio/ioList";
	}
	
	@RequestMapping("ioListDetail.mw")
	public String ioListDetail(int ioNum, Model model, HttpSession session) {
		
		System.out.println("bean : "+ioNum);
		
		String id = "minmingk1";
		/* String id = session.getAttribute("memId"); */
		
		MoneyioDTO dto = dao.moneyioListDetail(id, ioNum);
		
		return "/moneyio/ioListDetail";
	}
	
}
