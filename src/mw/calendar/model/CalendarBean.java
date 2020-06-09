package mw.calendar.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalendarBean {
	
	@Autowired
	private MwScheduleDTO mwscheduleDTO = null;

	@RequestMapping("Calendar.mw")
	public String cal() {
		return "/calendar/calendar";
	}
}
