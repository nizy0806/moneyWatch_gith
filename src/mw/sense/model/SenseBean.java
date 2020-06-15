package mw.sense.model;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SenseBean {
	
	@RequestMapping("sense.mw")
	public String senseMain() {
		return "/sense/senseList";
	}
	
}
