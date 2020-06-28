package mw.account_card.model;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jboss.netty.handler.codec.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Account_cardBean {

	@Autowired
	private Account_cardDAO acdao= null;
	
	// 카드/계좌 등록 form
	@RequestMapping("account_cardForm.mw")
	public String Account_cardForm(Model model, HttpSession session) {
		
		/* String id = (String)session.getAttribute("memId"); */
		String id = "nahui068";

		model.addAttribute("memId",id);
		
		return "/account_card/account_cardForm";
	}
	
	// 카드사에 따른 카드이름 선택
	@RequestMapping("select_card.mw")
	public String select_cardName(String cardCompany, Model model){
		
		List card_cn_list = acdao.card_cn_select(cardCompany); // 카드명,카드회사 리스트
	
		model.addAttribute("cardCompany", cardCompany); // 카드회사
		model.addAttribute("cardList", card_cn_list);
		
		return "/account_card/select_card";
	}
	
	// 은행선택 및 계좌번호 선택하는 칸 
	@RequestMapping("bank.mw")
	public String select_bank(String bank_num, Model model) {
		
		model.addAttribute("bank_num",bank_num);
		return "/account_card/bank";
	}
	
	// 카드사 및 카드명 선택하는 칸
	@RequestMapping("card.mw")
	public String select_card(String card_num, Model model) {
		
		List card_company_list = acdao.card_company_select(); // 카드회사 리스트

		model.addAttribute("card_company_list",card_company_list);
		model.addAttribute("card_num",card_num);
		return "/account_card/card";
	}
	
	// 카드 및 계좌등록
	@RequestMapping("account_cardPro.mw")
	public String account_cardPro(HttpServletRequest request,Reg_CardDTO cdto,Reg_AccountDTO adto) {

		String ca_set = request.getParameter("ca_set");
		
		if(ca_set.equals("0")) { // 카드등록일 경우 
			acdao.card_insert(cdto); // 카드등록
			acdao.account_insert(adto); // 계좌등록
		}
			
		if(ca_set.equals("1")){ // 계좌등록일 경우
			acdao.account_insert(adto);
		}
		
		return "/account_card/account_cardPro";
	}
	
	
	// 카드 이미지 삽입
	@RequestMapping("card_img_insert.mw")
	public String card_img_insert(Card_imgDTO cdto) {
		
		File dir = null;
		String [] path = new String[7];
		path[0] = "C:\\Users\\pc\\Desktop\\image_ibk";
		path[1] = "C:\\Users\\pc\\Desktop\\image_samsung";
		path[2] = "C:\\Users\\pc\\Desktop\\image_hyundai";
		path[3] = "C:\\Users\\pc\\Desktop\\image_shinhan";
		path[4] = "C:\\Users\\pc\\Desktop\\image_woori";
		path[5] = "C:\\Users\\pc\\Desktop\\image_kb";
		path[6] = "C:\\Users\\pc\\Desktop\\image_lotte";
		
		//String path="C:\\Users\\pc\\Desktop\\image_ibk";
		for(int i=0; i<path.length; i++) {
			dir = new File(path[i]);
		
			File [] fileList = dir.listFiles(); // 해당경로에 존재하는 파일 저장	
		
			for(File file : fileList) {// 저장된 파일만큼 for문 돌려서 값 가져오기	
				if(file.isFile()) {
					String fileName = file.getName();
					int index = fileName.lastIndexOf(".");
					int f = Integer.parseInt(fileName.substring(0,index)); // 파일이름(파일이름이 곧 이미지번호)
				
					cdto.setImg_cnt(f);
					if(i==0) {
						cdto.setCompany("기업카드");
					}else if(i==1) {
						cdto.setCompany("삼성카드");
					}else if(i==2) {
						cdto.setCompany("현대카드");
					}else if(i==3) {
						cdto.setCompany("신한카드");
					}else if(i==4) {
						cdto.setCompany("우리카드");
					}else if(i==5) {
						cdto.setCompany("국민카드");
					}else if(i==6) {
						cdto.setCompany("롯데카드");
					}
					cdto.setPath(file.getPath());
				}
				acdao.card_img_insert(cdto);
			}
		
		}
		
		return "/account_card/card_img_insert";
	}
	
	// 카드사 선택(혜택보기 위한 것)
	@RequestMapping("card_benefit.mw")
	public String card_benefit(String cardCompany, Model model) {
		
		List card_company_list = acdao.card_company_select(); // 카드회사 리스트

		model.addAttribute("card_company_list",card_company_list);
		
		return "/card_benefit/card_benefit";
	}
	
	// 카드명 선택(혜택보기 위한 것)
	@RequestMapping("benefit_select.mw")
	public String benefit_select(String cardCompany, Model model) {
		
		List card_cn_list = acdao.card_cn_select(cardCompany); // 카드명,카드회사 리스트
		//List card_img = acdao.card_img();
		
		model.addAttribute("cardCompany", cardCompany); // 카드회사
		model.addAttribute("cardList", card_cn_list);
		//model.addAttribute("cardImg",card_img); // 카드이미지
		
		return "/card_benefit/benefit_select";
	}
	
	// 카드에 대한 혜택
	@RequestMapping("benefit.mw")
	public String benefit(String cardName, Model model) {
		
		List card_benefit_list = acdao.card_benefit_select(cardName);
		
		model.addAttribute("benefitList",card_benefit_list);
		return "/card_benefit/benefit";
		
	}
	
	// 나의 카드 및 계좌 정보
	@RequestMapping("myCard.mw")
	public String myAccountCardForm(HttpSession session, Model model) {
		
		/* String id = (String)session.getAttribute("memId"); */
		String id = "nahui068";
		
		List mycard_list = (List) acdao.myCard(id).get("mycard");
		List myaccount_list = (List) acdao.myCard(id).get("myaccount");
		
		model.addAttribute("myCardList",mycard_list);
		model.addAttribute("myAccountList",myaccount_list);
		
		return "/account_card/myAccountCardForm";
	}
	
	// 나의 카드삭제
	@RequestMapping("myCardDel.mw")
	public String myCardDel(int num){
		/* String id = (String)session.getAttribute("memId"); */
		String id = "nahui068";
		
		acdao.delMyCard(id, num);
		
		return "/account_card/myCardDelete";
	}
	
	// 나의 계좌 삭제
	@RequestMapping("myAccountDel.mw")
	public String myAccountDel(int num){
		/* String id = (String)session.getAttribute("memId"); */
		String id = "nahui068";
		
		acdao.delMyAccount(id, num);
		
		return "/account_card/myAccountDelete";
	}
	
	// 나의 카드 혜택보기
	@RequestMapping("mycardBenefit.mw")
	public String mycardBenefit(String card_name, Model model) {
		
		List myBenefit = acdao.mycard_benefit(card_name);
		
		model.addAttribute("myBenefit",myBenefit); 
		model.addAttribute("card_name",card_name); // 카드이름
		
		return "/card_benefit/MycardBenefit";
	}
	
	
	
	
	
}
