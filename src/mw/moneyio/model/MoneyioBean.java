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
	
	private List list = new ArrayList();
	
	@RequestMapping("moneyioForm.mw")
	public String moneyioForm() {
		
		return "/moneyio/moneyioForm";
	}
	
/*	
	@RequestMapping("moneyioPro.mw")
	public String moneyioPro(MoneyioDTO dto, NbreadDTO ndto) {
//		System.out.println("id : " + dto.getId());
		dao.insert(dto, ndto);
		return "/moneyio/moneyioPro";
	}
*/
	@RequestMapping("moneyioPro.mw")
	public String moneyioPro(MoneyioDTO dto, NbreadDTO ndto, HttpServletRequest request) {
		/* dao.insert(dto, ndto); */
		String[] n_debtor = request.getParameterValues("n_debtor");
		String[] n_price = request.getParameterValues("n_price");
		
		for(int i = 0; i < n_debtor.length; i++) {
			ndto.setN_debtor(n_debtor[i]);
			ndto.setN_price(n_price[i]);
			
			/////// dao���� �ڵ� �ۼ��ϱ�
			
			System.out.println(ndto.getN_debtor());
		}
		
		
		//System.out.println(ndto.getN_debtor());
		
		return "/moneyio/moneyioPro";
	}
	
	@RequestMapping("ioUpdateForm.mw")
	public String ioUpdateForm(int io_num, int n_num, Model model) {
		List list = dao.ioUpdateForm(io_num);
		List n_list = dao.ioNbreadForm(n_num);
		model.addAttribute("list", list);
		model.addAttribute("n_list", n_list);
		
		return "/moneyio/ioUpdateForm";
	}
	
	@RequestMapping("ioUpdatePro.mw")
	public String ioUpdatePro(int io_num, int n_num) {
		dao.ioUpdatePro(io_num);
		dao.ioNbreadPro(n_num);
		return "/moneyio/ioUpdatePro";
	}	
	
	@RequestMapping("ageChart.mw")
	public String ageChart20(Model model, MoneyioDTO dto) {
		
		List chart_list = new ArrayList();
		
		chart_list = dao.ageChart20();
		
		model.addAttribute("chart_list", chart_list);
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
	
	@RequestMapping("nbreadForm.mw")
	public String nbreadForm(int nPeople, Model model) {

		model.addAttribute("nPeople", nPeople);
		
		return "/moneyio/nbreadForm";
	}
	
}
