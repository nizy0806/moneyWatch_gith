package mw.sense.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SenseBean {
	
	@Autowired
	private SenseDAO sensedao = null;
	
	//메인
	@RequestMapping("sense.mw")
	public String senseMain() {

		return "/sense/senseList";
	}
	
	//카테고리 선택
	@RequestMapping("category_select.mw")
	public String categorySelect(String category, Model model) {
		List<SenseDTO> select_list = sensedao.categorySelect(category);
		model.addAttribute("select_list", select_list);
		return "/sense/senseList";
	}
	
	//센스 임의 입력페이지
	@RequestMapping("senseWriteForm.mw")
	public String senseWrite() {
		return "/sense/senseWriteForm";
	}
	
	//센스 임의 입력 pro페이지
	@RequestMapping("senseWritePro.mw")
	public String senseWritePro(SenseDTO dto) {
		
		return "/sense/senseWritePro";
	}
	
}
