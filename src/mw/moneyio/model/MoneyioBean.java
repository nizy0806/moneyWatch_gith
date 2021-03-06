package mw.moneyio.model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MoneyioBean {
	
	SimpleDateFormat formatDate = new SimpleDateFormat("yyyy.MM.dd");
	
	@Autowired
	private MoneyioDAO dao = null;
	
	ArrayList list = new  ArrayList();
	//지출/수입 입력 페이지
		@RequestMapping("moneyioForm.mw")
		public String moneyioForm(MoneyioDTO dto, Model model) {
			String id= "nahui068";
			dto.setId(id);

			List<My_cardDTO> card_list = dao.card(id);
			//System.out.println("card_list: "+card_list);
			
			//System.out.println(card_list.get(0));
			//System.out.println(card_list.get(1));
			model.addAttribute("id", id);
			model.addAttribute("card_list", card_list);

			return "/moneyio/moneyioForm";
		}
		
		@RequestMapping("bankSelect.mw")
		public String bankSelect(My_cardDTO mdto, Model model/* , HttpServletRequest request */) {
			//System.out.println("id: "+mdto.getId());
			//System.out.println("mdtoCard_name() : " + mdto.getCard_name());
							
			List<My_cardDTO> card_Account = dao.card_Account(mdto);
			//System.out.println("card_Account: "+card_Account);
			model.addAttribute("card_Account", card_Account);

			return "/moneyio/bankSelect";
		}
		
		@RequestMapping("remain.mw")
		public String remain(MoneyioDTO dto, Model model) {
			
			//System.out.println("dto.io_account : " + dto.getIo_account());
			//System.out.println("dto.io_id : " + dto.getId());
			
			int io_remain = dao.allMoney(dto);
			//System.out.println("io_remain: "+io_remain);
			model.addAttribute("io_remain", io_remain);
			return "/moneyio/remain";
		}
		
		@RequestMapping("nbreadForm.mw")
		public String nbreadForm(int nPeople, Model model) {

			model.addAttribute("nPeople", nPeople);
			
			return "/moneyio/nbreadForm";
		}
		
		//지출/수입 입력 페이지 입력
		@RequestMapping("moneyioPro.mw")
		public String moneyioPro(MoneyioDTO dto, NbreadDTO ndto, My_cardDTO mdto, HttpServletRequest request) {
			int io_old_remain = Integer.parseInt(request.getParameter("io_old_remain"));
			
			if(dto.getIo_set()==1) {
				dto.setIo_remain(io_old_remain-dto.getIo_price());
			}else {
				dto.setIo_remain(io_old_remain+dto.getIo_price());
			}
		
			dao.insert(dto);
			dao.balanceUpdate(mdto);
			//System.out.println("dto io_num : "+dto.getIo_num());	
			//ndto.setIo_num(dto.getIo_num());
			//System.out.println("ndto io_num"+ndto.getIo_num());
			
			if(dto.getIo_N_div()>0) {
				String[] n_debtor = request.getParameterValues("n_debtor");
				String[] n_price = request.getParameterValues("n_price");
				
				for(int i = 0; i < n_debtor.length; i++) {
					ndto.setN_debtor(n_debtor[i]);
					ndto.setN_price(n_price[i]);
					dao.n_insert(ndto);
					//System.out.println("ndto get n debtor"+ndto.getN_debtor());
				}
			}	
			System.out.println(ndto.getN_debtor());
			return "/moneyio/moneyioPro";
		}

		//지출/수입 입력 페이지 수정 페이지
		@RequestMapping("ioUpdateForm.mw")
		public String ioUpdateForm(Model model, HttpServletRequest request) {
			
			//String id="nahui068";
			String id = "minmingk1";
			//int io_num=905;
			int io_num = Integer.parseInt(request.getParameter("ioNum"));

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
			int io_old_price = Integer.parseInt(request.getParameter("io_old_price"));
			int io_price = dto.getIo_price() - io_old_price; 
						// 39000 - 40000 // 지출 // -1000
			System.out.println("dto.getIo_remain()"+dto.getIo_remain());
			System.out.println("dto.getIo_price()"+dto.getIo_price());
			
			if(dto.getIo_set()==1) {
				dto.setIo_remain(dto.getIo_remain()-io_price);
			}else {
				dto.setIo_remain(dto.getIo_remain()+io_price);
			}
			
			
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
		
		//연령대별 지출 chart 페이지 
		@RequestMapping("ageChart.mw")
		public String ageChart20(Model model, MoneyioDTO dto) {
			List<MoneyioDTO> chart_list20 = new ArrayList<MoneyioDTO>();
			List<MoneyioDTO> chart_list30 = new ArrayList<MoneyioDTO>();
			List<MoneyioDTO> chart_list40 = new ArrayList<MoneyioDTO>();
			
			chart_list20 = dao.ageChart20();
			chart_list30 = dao.ageChart30();
			chart_list40 = dao.ageChart40();

			model.addAttribute("chart_list20", chart_list20);
			model.addAttribute("chart_list30", chart_list30);
			model.addAttribute("chart_list40", chart_list40);
			return "/moneyio/ageChart";
		}
		
		//개인소비패턴분석
		@RequestMapping("ptEstimate.mw")
		public String ptEstimate(/*String id,*/ Model model) {

			String id = "nahui068";
			int sum = 0;
			int sum1 = dao.sum5(id);
			int sum2 = dao.sum6(id);
			int sum3 = dao.sum7(id);
			
			List<MoneyioDTO> list1 = dao.ptEstimate5(id);
			List<MoneyioDTO> list2 = dao.ptEstimate6(id);
			List<MoneyioDTO> list3 = dao.ptEstimate7(id);
			
			List<MoneyioDTO> next_list = dao.nextMonth(id);
			for(int i=0; i<next_list.size();i++) {
				if(next_list.get(i).getCount3()==3) {
					int next = next_list.get(i).getIo_price()/3;
					//System.out.println("next3: "+next);
					sum = sum+next;
					//System.out.println("sum3: "+sum);
				}
				System.out.println();
				if(next_list.get(i).getCount3()==2) {
					int next = next_list.get(i).getIo_price()/2;
					//System.out.println("next2: "+next);
					sum = sum + next;
					//System.out.println("sum2: "+sum);
				}
				if(next_list.get(i).getCount3()==1) {
					int next = next_list.get(i).getIo_price();
					sum = sum + next;
					//System.out.println("sum1"+sum);
				}
			}
			
			if(sum3-sum2 > 0) {
				int differ = sum3- sum2;
				sum = sum+ differ;
			}
			int estimate  = sum;
			System.out.println("sum_all: "+ estimate);
			//MoneyioDTO dtoT = next_list.get(next_list.size()-1);
			//System.out.println("next_list: "+ dtoT.getCount3());
			
			model.addAttribute("id", id);
			model.addAttribute("list1", list1);
			model.addAttribute("sum1", sum1);
			model.addAttribute("list2", list2);
			model.addAttribute("sum2", sum2);
			model.addAttribute("list3", list3);
			model.addAttribute("sum3", sum3);
			model.addAttribute("estimate", estimate);
			
			return "/moneyio/ptEstimate";
		}
		
		@RequestMapping("nbreadList.mw")
		public String nbreadList(/*int io_num,*/ Model model) {
			int io_num=911;
			
			List<NbreadDTO> nlist = dao.nList(io_num);
			String category = nlist.get(1).getN_category();
			String nSum = dao.nSum(io_num);
			
			model.addAttribute("category", category);
			model.addAttribute("nlist", nlist);
			model.addAttribute("nSum", nSum);
			
			return "/moneyio/nbreadList";
		}
	
	
	@RequestMapping("moneyioList.mw")	
	public String moneyioList(/*String id, */Model model, HttpSession session) {
		Date date = new Date();
		String nowDate = formatDate.format(date);
		
		String id = "minmingk1";
	/* String id = session.getAttribute("memId"); */

		List list = dao.moneyioListAll(id);
		
		model.addAttribute("moneyioList", list);
		model.addAttribute("nowDate", nowDate);
		
		return "/moneyio/moneyioList";
	}
	
	@RequestMapping("ioList.mw")	
	public String ioList(String filter, Model model, HttpSession session) {
			
		String id = "minmingk1";
		/* String id = session.getAttribute("memId"); */
		List list = new ArrayList();
		
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
	
	@RequestMapping("ioDeletePro.mw")
	public String ioDeletePro(int io_num) {
		System.out.println(io_num);
		dao.io_delete(io_num);
		return "redirect:moneyioList.mw";
	}
	
	
}
