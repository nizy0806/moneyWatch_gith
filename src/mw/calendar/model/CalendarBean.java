package mw.calendar.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CalendarBean {
	
	@Autowired
	private MwScheduleDAO dao = null;
	
	@RequestMapping("Calendar.mw")
	public String cal(MwScheduleDTO mwdto, Model model) throws Exception {
		//DB뿌려주기 필요

		return "/calendar/calendar";
	}
	
	// 저장된 스케줄 불러오기 
	@RequestMapping(value = "eventAll.mw", method = RequestMethod.POST,  produces = "application/json")
	public @ResponseBody HashMap<String,String> getPlan(HttpSession session) throws Exception {
		
		HashMap<String,String> map = new HashMap<String,String>();
		
		/* String id = (String)session.getAttribute("memId"); */
		String id = "tempid";
		
		List<MwScheduleDTO> list = dao.schedule_select(id);
		
		for(int i=0; i<list.size();i++) {
			map.put(list.get(i).getTitle(),list.get(i).getStart_time());
		}
		
		return map; 
	}

	@RequestMapping(value = "Calendar.mw", method=RequestMethod.POST)
	public String cal(HttpServletRequest request) {
		
		return "/calendar/calendar";
	}
	
	@RequestMapping("C_popUp.mw") //캘린더 팝업창
	public String cal_pop() {
		return "/calendar/day";
	}
	
	@RequestMapping("C_insert.mw") //캘린더 팝업창 입력	
	public @ResponseBody Map<Object, Object> cal_insert(MwScheduleDTO mwdto, Model model)throws Exception {
		
		dao.schedule_insert(mwdto); //캘린더 일정 DB입력

		Map<Object,Object> map = new HashMap<Object, Object>(); //반환할 객체 생성
			
		//List<MwScheduleDTO> list = dao.schedule_select(mwdto);	
		//model.addAttribute("list", list);
		System.out.println("DBinsert");
		
		return map;
	}
	
	
	/*
	@RequestMapping("C_insert.mw") //캘린더 팝업창 입력	
	public @ResponseBody List<MwScheduleDTO> cal_insert(MwScheduleDTO mwdto, Model model) {
		dao.schedule_insert(mwdto);
		List<MwScheduleDTO> list = dao.schedule_select(mwdto);	
		model.addAttribute("list", list);
		System.out.println(list.get(1).toString());


		return list;
	}
	*/
		 
	
/*	@RequestMapping("C_insert.mw") //캘린더 팝업창에서 일정 입력	
	public Map<Object,Object> cal_insert(MwScheduleDTO mwdto, Model model) throws Exception {
		
		Map<Object,Object>map = new HashMap<Object, Object>(); //반환할 객체 생성

		dao.schedule_insert(mwdto); //일정 입력
		
		System.out.print("인서트!!");
//		List<MwScheduleDTO> list = dao.schedule_select(mwdto);	
//		model.addAttribute("list", list);
//		System.out.println(list.get(1).toString());


		return map;
	}
	
	*/
	
	
	
	
	
	
}
