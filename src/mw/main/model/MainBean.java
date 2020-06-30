package mw.main.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class MainBean {
	
	@Autowired
	private MainDAO dao = null; //메인 영상을 출력하기 위한 DAO
	
	@RequestMapping("siteMap.mw")	
	public String siteMap() {
		return "/siteMap";
	}
	
	@RequestMapping("index.mw")	
	public String index() {
		return "/index";
	}
	
	@RequestMapping("main.mw")	
	public String main(Model model) {
		
		MainDTO video = dao.video_url(); //오늘의 영상
		model.addAttribute("video", video); //오늘의 영상 url 보내기
		return "/main/main";
	}
	@RequestMapping("myPage.mw")	
	public String myPage() {
		return "/main/myPage";
	}
	
}
