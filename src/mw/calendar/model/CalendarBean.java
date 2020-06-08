package mw.calendar.model;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalendarBean {

	@RequestMapping("Calendar.mw")
	public String cal() {
		return "/calendar/calendar";
	}
}
