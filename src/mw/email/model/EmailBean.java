package mw.email.model;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import mw.email.model.EmailDTO;
import mw.email.model.EmailDAO;

@Controller
public class EmailBean {
	@Autowired
	private EmailDAO dao = null;

	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping("idFindForm.mw")
	public String idFindForm() {
		return "/member/idFindForm";
	}
	
	@RequestMapping("idFindPro.mw")
	public String idFindPro(EmailDTO dto, Model model, HttpServletRequest request) {
		
		String name= request.getParameter("name") ;
		int check = (int)dao.idFind(dto);

		String id="";
		
		if(check==1) {
			id = dao.idWhat(dto);
			model.addAttribute("id", id);
		}
		model.addAttribute("name", name);
		model.addAttribute("check", check);
		
		return "/member/idFindPro";
	}
	
	@RequestMapping("pwFindForm.mw")
	public String pwFindForm() {
		return "/member/pwFindForm";
	}
	
	// mailSending 코드
	@RequestMapping("pwFindPro.mw")
	public String pwFindPro(EmailDTO dto, Model model, HttpServletRequest request) {
		
		String name = request.getParameter("name");
		int pw_check = (int)dao.pwFind(dto);
		System.out.println("pw_check"+pw_check);
		
		//인증 번호 생성기
        StringBuffer temp = new StringBuffer();
        Random rnd = new Random();
        for(int i=0;i<10;i++)
        {
            int rIndex = rnd.nextInt(3);
            switch (rIndex) {
            case 0:
                // a-z
                temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                break;
            case 1:
                // A-Z
                temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                break;
            case 2:
                // 0-9
                temp.append((rnd.nextInt(10)));
                break;
            }
        }
        String AuthenticationKey = temp.toString();
        
		
		if(pw_check == 1) {
			String setfrom = "ADMIN";
			String tomail1 = request.getParameter("email1"); // 받는 사람 이메일
			String tomail2 = request.getParameter("email2"); // 받는 사람 이메일
			String title = "[moneyWatch 임시 비밀번호 전송] "; // 제목
			String content = name+"님의 임시 비밀번호는 "+AuthenticationKey+" 입니다."; // 내용
			String content2 = "개인 정보 보호를 위해 비밀번호를 변경해주세요";
			
			//dto.setPw(AuthenticationKey);
			dao.pwUpdate(dto,AuthenticationKey);
			
			try {
				
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				
				System.out.println(content);
				messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
				messageHelper.setTo(tomail1+"@"+tomail2); // 받는사람 이메일
				messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
				messageHelper.setText(content+"\n"+content2); // 메일 내용
	
	
				mailSender.send(message);	
				
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		model.addAttribute("pw_check", pw_check);
		return "/member/pwFindPro";
	}
	
}
