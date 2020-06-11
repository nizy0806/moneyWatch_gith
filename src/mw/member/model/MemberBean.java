package mw.member.model;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import mw.member.model.MemberDAO;


@Controller


public class MemberBean {
	
	@Autowired
	private MemberDAO dao = null;
	
	@RequestMapping("loginForm.mw")
	public String mwloginform() {
		return "/member/loginForm";
	}

	@RequestMapping("loginPro.mw")
	public String mwloginPro(MemberDTO dto, HttpSession session, Model model) {
	
		int check=dao.loginCheck(dto);
		
		if(check==1) {
		session.setAttribute("memId", dto.getId());
	}
		model.addAttribute("check",check);
		return "/member/loginPro";
	}
	
	@RequestMapping("logout.mw")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "/member/logout";
	}
	
	
	
	@RequestMapping("registerForm.mw")	
	public String registerForm() {
		return "/member/registerForm";
	}
	@RequestMapping("registerPro.mw")	
	public String registerPro(MemberDTO dto) {
		
		dao.insert(dto);
		
		return "/member/registerPro";
	}
	@RequestMapping("confirmId.mw")
	public String confirmId(String id,Model model) {
		int checker=dao.memberCheck(id);
		model.addAttribute("checker",checker);
		
		return "/member/confirmId";
	}
	
	@RequestMapping("modify.mw")
	public String mwmodify(){
		
		return "/member/modify";
	}
	
	@RequestMapping("modifyForm.mw")
	public String mwmodifyForm(String id) {
		
		return "/member/modifyForm";
	}
	
	@RequestMapping("modifyPro.mw")
	public String mwmodifyPro(HttpSession session,MemberDTO dto) {
		String id=(String)session.getAttribute("memId");
		dto.setId(id);
		return "/member/modifyPro";
	}
	
	@RequestMapping("deleteForm.mw")
	public String mwdeleteForm() {
		return "/member/deleteForm";
	}
	
	@RequestMapping("deletePro.mw")
	public String mwdeletePro() {
		return "/member/deletePro";
	}
}
	
	

	
	

