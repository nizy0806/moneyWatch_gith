package mw.member.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import mw.member.model.MemberDAO;


@Controller
public class MemberBean {
	
	@Autowired
	private MemberDAO dao = null;
	
	@RequestMapping("registerForm.mw")	
	public String registerForm() {
		return "/member/registerForm";
	}
	@RequestMapping("registerPro.mw")	
	public String registerPro() {
		return "/member/registerPro";
	}
	@RequestMapping("confirmId.mw")
	public String confirmId(String id,Model model) {
		int checker=dao.memberCheck(id);
		model.addAttribute("checker",checker);
		
		return "/member/confirmId";
	}
}
	
	

