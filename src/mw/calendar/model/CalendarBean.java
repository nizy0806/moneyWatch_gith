package mw.calendar.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CalendarBean {
	
	@Autowired
	private MwScheduleDAO mwscheduleDAO = null;
	
	@RequestMapping("Calendar.mw")
	public String cal(MwScheduleDTO mwdto) {
		//mwscheduleDAO.schedule_insert(mwdto); //ÀÏÁ¤Ãß°¡
		return "/calendar/calendar";
	}
	
	@RequestMapping("C_popUp.mw") //Ä¶¸°´õ ÆË¾÷Ã¢
	public String cal_pop() {
		return "/calendar/day";
	}
	
	@RequestMapping("C_insert.mw") //Ä¶¸°´õ ÆË¾÷Ã¢ ÀÔ·Â	
	public @ResponseBody List<MwScheduleDTO> cal_insert(MwScheduleDTO mwdto, Model model) {
		mwscheduleDAO.schedule_insert(mwdto);
		List<MwScheduleDTO> list = mwscheduleDAO.schedule_select(mwdto);	
		model.addAttribute("list", list);
		System.out.println(list.get(1).toString());


		return list;
	}

	
	
}
