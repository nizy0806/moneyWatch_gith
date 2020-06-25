package mw.calendar.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jboss.netty.handler.codec.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.vertx.java.core.http.impl.HttpReadStreamBase;

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

	/*
	 * @RequestMapping(value = "Calendar.mw", method = RequestMethod.POST) public
	 * String cal(HttpServletRequest request) {
	 * 
	 * return "/calendar/calendar"; }
	 */

	@RequestMapping("C_popUp.mw") // 캘린더 팝업창
	public String cal_pop(Model model,HttpServletRequest request) {
		
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("date");
		String date = year + "-" + month + "-" + day;

		model.addAttribute("date",date);

		return "/calendar/day";
	}

	@RequestMapping("C_insert.mw") // 캘린더 팝업창 입력
	public String cal_insert(MwScheduleDTO mwdto, Model model) {

		dao.schedule_insert(mwdto); // 캘린더 일정 DB입력

		return "/calendar/day";
	}
	
	// 일정 세부내용 
	@RequestMapping("day_detail.mw")
	public String day_detail(HttpServletRequest request, Model model) {

		List detail = new ArrayList();
		
		/* String id = request.getSession("memId"); */
		String id = "tempid";
		String title = request.getParameter("title");
		String start_time = request.getParameter("start_time");
			
		detail = dao.day_detail(id,title,start_time);
		model.addAttribute("detail",detail);

		return "/calendar/day_detail";
	}
	
	@RequestMapping("out_detail.mw")
	public String out_detail(HttpServletRequest request, Model model) {
		
		List outlist = new ArrayList();
		
		/* String id = request.getSession("memId"); */
		String id = "crong";
		String io_reg_date = request.getParameter("io_reg_date");
		
		outlist = dao.out_detail(id,io_reg_date);
		
		model.addAttribute("outlist",outlist);
		
		return "/calendar/out_detail";
	}
	
	@RequestMapping("in_detail.mw")
	public String in_detail(HttpServletRequest request, Model model) {
		
		List inlist = new ArrayList();
		
		/* String id = request.getSession("memId"); */
		String id = "crong";
		String io_reg_date = request.getParameter("io_reg_date");
		
		inlist = dao.in_detail(id,io_reg_date);
		
		model.addAttribute("inlist",inlist);
		
		return "/calendar/in_detail";
	}
}
