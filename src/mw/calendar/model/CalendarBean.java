package mw.calendar.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CalendarBean {
	
	@Autowired
	private MwScheduleDAO mwscheduleDAO = null;
	
	@RequestMapping("Calendar.mw")
	public String cal(MwScheduleDTO mwdto) {
		//mwscheduleDAO.schedule_insert(mwdto); //일정추가
		return "/calendar/calendar";
	}
	
	@RequestMapping("C_popUp.mw")
	public String cal_pop() {
		//mwscheduleDAO.schedule_insert(mwdto); //일정추가
		return "/calendar/pop_up";
	}
	
	/*
	 * @RequestMapping("Calendarinsert.mw") public @ResponseBody String
	 * calinsert(MwScheduleDTO mwdto) { //mwscheduleDAO.schedule_insert(mwdto);
	 * //일정추가 System.out.println("=============="+mwdto.getStart_time()); return
	 * "okok"; }
	 */
	
	
}
