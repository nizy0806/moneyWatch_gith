package mw.faqboard.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import mw.faqboard.model.FaqBoardDAO;



@Controller
public class FaqBoardBean {
	@Autowired
	private FaqBoardDAO dao=null;
	
	@RequestMapping("faqContent.mw")
	public String faqContent() {
		return "/faqboard/faqContent";
	}
	
	@RequestMapping("faqList.mw")
	public String faqList() {
		return "/faqboard/faqList";
	}
	
	@RequestMapping("faqWriteForm.mw")
	public String faqWriteForm() {
		return "/faqboard/faqWriteForm";
	}
	
	@RequestMapping("faqWritePro.mw")
	public String faqWritePro() {
		return "/faqboard/faqWritePro";
	}
	
	@RequestMapping("faqUpdateForm.mw")
	public String faqUpdateForm() {
		return "/faqboard/faqUpdateForm";
	}
	
	@RequestMapping("faqUpdatePro.mw")
	public String faqUpdatePro() {
		return "/faqboard/faqUpdatePro";
	}
	
	
	@RequestMapping("myList.mw")
	public String myList() {
		return "/faqboard/myList";
	}
	
	
	
	
}