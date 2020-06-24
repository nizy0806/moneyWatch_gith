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

import mw.moneyio.model.MoneyioDTO;

@Controller
public class CalendarBean {

	@Autowired
	private MwScheduleDAO dao = null;

	@RequestMapping("Calendar.mw")
	public String cal(MwScheduleDTO mwdto, Model model) throws Exception {
		
		// DB뿌려주기 필요
		String id = "tempid";
		List<MwScheduleDTO> slist = dao.schedule_select(id); // 일정가져오기
		List<MoneyioDTO> olist = dao.money_out("crong"); // 지출내역가져오기
		List<MoneyioDTO> ilist = dao.money_in("crong"); // 수입내역가져오기
		
		model.addAttribute("listview", slist);
		model.addAttribute("olist",olist);
		model.addAttribute("ilist",ilist);
		
		return "/calendar/calendar";
	}

	@RequestMapping(value = "Calendar.mw", method = RequestMethod.POST)
	public String cal(HttpServletRequest request) {

		return "/calendar/calendar";
	}

	@RequestMapping("C_popUp.mw") // 캘린더 팝업창
	public String cal_pop() {
		return "/calendar/day";
	}

	@RequestMapping("C_insert.mw") // 캘린더 팝업창 입력
	public String cal_insert(MwScheduleDTO mwdto, Model model) throws Exception {

		dao.schedule_insert(mwdto); // 캘린더 일정 DB입력

		//Map<Object, Object> map = new HashMap<Object, Object>(); // 반환할 객체 생성 @ResponseBody Map<Object, Object>

		// List<MwScheduleDTO> list = dao.schedule_select(mwdto);
		// model.addAttribute("list", list);
		System.out.println("DBinsert");

		return "/calendar/day";
	}

	/*
	 * @RequestMapping("C_insert.mw") //캘린더 팝업창 입력 public @ResponseBody
	 * List<MwScheduleDTO> cal_insert(MwScheduleDTO mwdto, Model model) {
	 * dao.schedule_insert(mwdto); List<MwScheduleDTO> list =
	 * dao.schedule_select(mwdto); model.addAttribute("list", list);
	 * System.out.println(list.get(1).toString());
	 * 
	 * 
	 * return list; }
	 */

	/*
	 * @RequestMapping("C_insert.mw") //캘린더 팝업창에서 일정 입력 public Map<Object,Object>
	 * cal_insert(MwScheduleDTO mwdto, Model model) throws Exception {
	 * 
	 * Map<Object,Object>map = new HashMap<Object, Object>(); //반환할 객체 생성
	 * 
	 * dao.schedule_insert(mwdto); //일정 입력
	 * 
	 * System.out.print("인서트!!"); // List<MwScheduleDTO> list =
	 * dao.schedule_select(mwdto); // model.addAttribute("list", list); //
	 * System.out.println(list.get(1).toString());
	 * 
	 * 
	 * return map; }
	 * 
	 */

}
