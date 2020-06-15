package mw.member.model;

import javax.servlet.http.HttpServletRequest;
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
	public String loginform() {
		return "/member/loginForm";
	}

	@RequestMapping("loginPro.mw")
	public String loginPro(MemberDTO dto, HttpSession session, Model model, HttpServletRequest request) {
		String id=(String)session.getAttribute(dto.getId());
		String pw=request.getParameter(dto.getPw());
		int check=dao.loginCheck(dto);
		
		System.out.println(check);
		
		if(check==1) {
		session.setAttribute("memId", dto.getId());
	}
		model.addAttribute("check",check);
		return "/member/loginPro";
	}
	
	@RequestMapping("logout.mw")
	public String aoplogout(HttpSession session) {
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
	public String aopmodify(MemberDTO dto, HttpSession session){		

		return "/member/modify";
	}
	
	@RequestMapping("modifyForm.mw")
	public String aopmodifyForm(HttpSession session,Model model) {
		String id=(String)session.getAttribute("memId");
		MemberDTO dto =dao.modifyCheck(id);
		model.addAttribute("dto",dto);
	
		
		return "/member/modifyForm";
	}
	
	
	@RequestMapping("modifyPro.mw")
	public String aopmodifyPro(MemberDTO dto) {
		dao.updateMember(dto);
		
		
		return "/member/modifyPro";
	}
	

	
	
	
	
	
	@RequestMapping("memOutForm.mw")
	public String aopmemOutForm() {
		return "/member/memOutForm";
	}
	
	@RequestMapping("memOutPro.mw")
	public String aopmemOutPro(MemberDTO dto , Model model, HttpServletRequest request, HttpSession session) {
		String pw = request.getParameter("pw");
		String id = (String)session.getAttribute("memId");
		System.out.println(id);
		dto.setId(id);
		dto.setPw(pw);
		
		int check = dao.deleteCheck(dto);
		model.addAttribute("check",check);
		
		if(check==1) {
			dao.deleteMem(id);
			session.invalidate();
		}
		
		return "/member/memOutPro";
	}
	
	
}
	

	
	

