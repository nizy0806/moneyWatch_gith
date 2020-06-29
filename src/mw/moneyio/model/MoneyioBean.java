package mw.moneyio.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MoneyioBean {
	
	@Autowired
	private MoneyioDAO dao = null;
	
	//private List list = new ArrayList();
	
	@RequestMapping("moneyioForm.mw")
	public String moneyioForm(My_cardDTO dto, Model model) {
		String id= "nahui068";
		List<My_cardDTO> bank_list = dao.bankName(id);
		
		model.addAttribute("id", id);
		model.addAttribute("bank_list", bank_list);
		return "/moneyio/moneyioForm";
	}
	

	@RequestMapping("bankSelect.mw")
	public String bankSelect(My_cardDTO mdto, Model model) {
		//System.out.println("bean: "+ca_company);
		List<My_cardDTO> bankAccount = dao.bankAccount(mdto);
		model.addAttribute("bankAccount", bankAccount);
		return "/moneyio/bankSelect";
	}
	
	@RequestMapping("nbreadForm.mw")
	public String nbreadForm(int nPeople, Model model) {

		model.addAttribute("nPeople", nPeople);
		
		return "/moneyio/nbreadForm";
	}
	
	@RequestMapping("moneyioPro.mw")
	public String moneyioPro(MoneyioDTO dto, NbreadDTO ndto, HttpServletRequest request) {
			
		System.out.println("dto io_num : "+dto.getIo_num());
		
		ndto.setIo_num(dto.getIo_num());
		
		System.out.println("ndto io_num"+ndto.getIo_num());
		
		dao.insert(dto);
		
		
		if(dto.getIo_N_div()>0) {
			String[] n_debtor = request.getParameterValues("n_debtor");
			String[] n_price = request.getParameterValues("n_price");
			
			for(int i = 0; i < n_debtor.length; i++) {
				ndto.setN_debtor(n_debtor[i]);
				ndto.setN_price(n_price[i]);
				dao.n_insert(ndto);
				System.out.println("ndto get n debtor"+ndto.getN_debtor());
			}
			
		}	
		
		//System.out.println(ndto.getN_debtor());
		return "/moneyio/moneyioPro";
	}
	
	//지출/수입 입력 페이지 수정 페이지
	@RequestMapping("ioUpdateForm.mw")
	public String ioUpdateForm(Model model) {
		
		String id="nahui068";
		int io_num=905;

		MoneyioDTO dto = dao.ioUpdateForm(io_num);
		if(dto.getIo_N_div() == 0) {
			dto.setIo_N_div(0);
		}

		model.addAttribute("id", id);
		model.addAttribute("dto", dto);
		
		return "/moneyio/ioUpdateForm";
	}
	
	//지출/수입 입력 페이지 update
	@RequestMapping("ioUpdatePro.mw")
	public String ioUpdatePro(MoneyioDTO dto, NbreadDTO ndto, HttpServletRequest request) {
		//int io_num = 905;
		dao.ioUpdatePro(dto);
		
		if(dto.getIo_N_div()>0) {
			dao.n_delete(ndto.getIo_num());
			String[] n_debtor = request.getParameterValues("n_debtor");
			String[] n_price = request.getParameterValues("n_price");
			
			for(int i = 0; i < n_debtor.length; i++) {
				ndto.setN_debtor(n_debtor[i]);
				ndto.setN_price(n_price[i]);
				dao.n_insert2(ndto);
				System.out.println("ndto get n debtor"+ndto.getN_debtor());
			}
			
		}else {
			dao.n_delete(ndto.getN_num());
		}
		
		return "/moneyio/ioUpdatePro";
	}
	
	@RequestMapping("ageChart.mw")
	public String ageChart20(Model model, MoneyioDTO dto) {
		
		List chart_list20 = new ArrayList();
		List chart_list30 = new ArrayList();
		List chart_list40 = new ArrayList();
		
		chart_list20 = dao.ageChart20();
		chart_list30 = dao.ageChart30();
		chart_list40 = dao.ageChart40();

		model.addAttribute("chart_list20", chart_list20);
		model.addAttribute("chart_list30", chart_list30);
		model.addAttribute("chart_list40", chart_list40);
		return "/moneyio/ageChart";
	}
	
	
	@RequestMapping("moneyioList.mw")	
	public String moneyioList(/*String id, */Model model, HttpSession session) {
		
		String id = "minmingk1";
	/* String id = session.getAttribute("memId"); */

		list = dao.moneyioListAll(id);
		
		model.addAttribute("moneyioList", list);
		
		return "/moneyio/moneyioList";
	}
	
	@RequestMapping("ioList.mw")	
	public String ioList(String filter, Model model, HttpSession session) {
				
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
		
		String id = "minmingk1";
		/* String id = session.getAttribute("memId"); */
		
		MoneyioDTO dto = dao.moneyioListDetail(id, ioNum);
		model.addAttribute("dto", dto);
		
		return "/moneyio/ioListDetail";
	}
	
	
}
