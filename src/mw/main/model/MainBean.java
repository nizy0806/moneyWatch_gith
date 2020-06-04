package mw.main.model;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainBean {

	@RequestMapping("siteMap.mw")	
	public String siteMap() {
		return "/siteMap";
	}
	
	@RequestMapping("index.mw")	
	public String index() {
		return "/index";
	}
	
	@RequestMapping("main.mw")	
	public String aopmain() {
		return "/main/main";
	}
	
}
