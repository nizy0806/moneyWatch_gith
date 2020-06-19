package mw.faqboard.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
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
	
	@RequestMapping("test.mw") 
	public String test() {
		return "/faqboard/test"; 
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
	public String faqWritePro(HttpServletRequest request, HttpSession session, FaqBoardDTO dto) {
		
		FaqBoardDTO article=new FaqBoardDTO();
		
		String writer=request.getParameter("writer");
		String subject=request.getParameter("subject");
		String email=request.getParameter("email");
		String content=request.getParameter("content");
		String pw=request.getParameter("pw");
		
		int num=Integer.parseInt(request.getParameter("num"));
		int ref=Integer.parseInt(request.getParameter("ref"));
		int re_step=Integer.parseInt(request.getParameter("re_step"));
		int re_level=Integer.parseInt(request.getParameter("re_level"));
		
		article.setReg(new Timestamp(System.currentTimeMillis()));
		article.setWriter(writer);
		article.setSubject(subject);
		article.setFaq_email(email);
		article.setContent(content);
		article.setPw(pw);
		article.setFaq_num(num);
		article.setRe_step(re_step);
		article.setRe_level(re_level);
		article.setRef(ref);
		
		dao.insertBoard(dto);
		
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