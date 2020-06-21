package mw.sense.model;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class SenseBean {
	
	@Autowired
	private SenseDAO dao = null;
	
	/*
	//R - 메인 
	@RequestMapping("sense.mw")
	public String senseMain(Model model, String category) {
		
		if(category == null) {
			
			SenseDTO video = dao.mainVideo(); //오늘의 영상
			List<SenseDTO> mainlist = dao.mainList(); //메인 리스트
			
			model.addAttribute("video", video); //오늘의 영상 url 보내기
			model.addAttribute("list", mainlist); //메인 리스트			

			return "/sense/senseMain";
			
		}else{
			
			SenseDTO video = dao.mainVideo(); //오늘의 영상
			List<SenseDTO> category_select_list = dao.mainCategorySelect(category); //리스트 출력		
			
			model.addAttribute("video", video); //오늘의 영상 url 보내기
			model.addAttribute("list", category_select_list);
			return "/sense/senseMain";
			
		}
	}
	*/
	//R - 메인 
	@RequestMapping("sense.mw")
	public String senseMain(Model model) {
	
		SenseDTO video = dao.mainVideo(); //오늘의 영상
		List<SenseCategoryDTO> category = dao.category(); //카테고리 리스트
		List<SenseDTO> mainlist = dao.mainList(); //메인 리스트
				
		model.addAttribute("video", video); //오늘의 영상 url 보내기
		model.addAttribute("category", category); //카테고리 리스트
		model.addAttribute("list", mainlist); //메인 리스트			

		return "/sense/senseMain";
		
	}
	
	/*
	//R - 메인 / 카테고리 선택 시 리스트
	@RequestMapping("senseSelect.mw")
	public @ResponseBody Model senseCategorySelect(Model model, int num) {
		System.out.println(num);
		List<SenseDTO> category_select_list = dao.mainCategorySelect(num); //리스트 출력				
		return 	model.addAttribute("list", category_select_list);
		
	}
	*/
	
	//R - 메인 / 카테고리 선택 시 리스트
	@RequestMapping("senseSelect.mw")
	public String senseCategorySelect(Model model, int num) {
		
		List<SenseDTO> category_select_list = dao.mainCategorySelect(num); //리스트 출력		
		model.addAttribute("list", category_select_list);
		
		return "/sense/mainList";		
	}
	
	//R - 디테일 페이지
	@RequestMapping("senseDetail.mw")
	public String senseDetail(int num, Model model) { //시퀀스 번호를 매개변수로 받음
		
		SenseDTO dto = dao.senseDetail(num);
		model.addAttribute("detail", dto); //디테일 페이지의 정보를 가져옴
		return "/sense/detail";
		
	}
	
	//R - 디테일 main video url 변경
	@RequestMapping("senseDetailVideo.mw")
	public @ResponseBody String senseDetailVideo(int num) {
		String url = dao.senseDetailVideo(num);		
		return url;
	}
	
	
	//C - 센스 직접 입력 form - 카테고리 selectbox
	@RequestMapping("senseWriteForm.mw")
	public String categorySelect(Model model) {
		
		List<SenseCategoryDTO> list = dao.category(); //카테고리 리스트
		model.addAttribute("list", list);
		return "/sense/senseWriteForm";
		
	}
	
	//C - 센스 직접 입력 pro페이지 
	@RequestMapping("senseWritePro.mw")
	public String senseWritePro(SenseDTO dto, Model model) {

		dao.senseInsert(dto); //입력		
		int check = dao.senseInsertCheck(dto); //입력확인
		
		model.addAttribute("check", check); //check 반환
		return "/sense/senseWritePro";
	}
	
	
//	//센스 직접 입력 pro페이지 
//	@RequestMapping("senseWritePro.mw")
//	public String senseWritePro(SenseDTO dto, MultipartHttpServletRequest request, Model model) {
//									//파일을 업로드 하기 위해 MultipartHttpServletRequest로 매개변수를 받음
//		
//		int max = dao.getMaxNum() + 1; //파일번호 부여를 위해 DB 마지막 num을 가져와 +1 더해줌
//		//파일 덮어쓰기 방지 이름 부여하기
//		
//		//form에서 전달된 파일 처리
//		MultipartFile mf = request.getFile("save"); //"save"로 전달된 파일을 꺼냄
//		String orgName = mf.getOriginalFilename(); //파일 원본이름 - 확장자 포함		
//		//test.aaa.png 확장자 자름
//		String ext = orgName.substring(orgName.lastIndexOf(".")+1);
//		
//		
//		//저장할 이름을 지정해줌
//		String sysName = "file_" + max + "." + ext; 
//		
//		dto.setSense_thumbnail(sysName); //확장자를 자른 파일명을 dto에 넣음
//		
//		
//		//파일업로드
//		String path = "d://save//"; //원본을 복사해 넣을 파일경로		
//		File fileCopy = new File(path+sysName); //경로와 만든 이름으로		
//		try {
//			mf.transferTo(fileCopy); //파일 복사 실행
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		
//		dao.senseInsert(dto); //입력
//		
//		int check = dao.senseInsertCheck(dto); //입력확인
//		
//		model.addAttribute("check", check); //check 반환
//		return "/sense/senseWritePro";
//	}
	
	//U - 센스 수정 form페이지
	@RequestMapping("senseModify.mw")
	public String senseModifySelect(int num, Model model) {
		
		List<SenseCategoryDTO> category = dao.category(); //카테고리 리스트 가져오기
		SenseDTO dto = dao.senseModifySelect(num); //시퀀스 값으로 게시글 내용 호출
		
		model.addAttribute("category", category); //카테고리 리스트
		model.addAttribute("modify", dto); //게시글 내용
		return "/sense/senseModify";
		
	}
	
	//U - 센스 수정 pro페이지
	@RequestMapping("senseModifyPro.mw")
	public String senseModify(SenseDTO dto, Model model) {
		
		dao.senseModify(dto);
		int check = dao.senseModifyCheck(dto);
		
		model.addAttribute("check", check); // 수정 확인 check 반환
		return "/sense/senseModifyPro";
	}
	
	
	//D - 센스 삭제를 위한 PW확인
	@RequestMapping("senseDeletePro.mw")
	public String confirmPassword(HttpSession session, String password, int num, Model model) {
		
		String id = "admin";
		// String id = session.getAttribute("memId");
		int check = dao.confirmPassword(id, password); //id와 pw를 확인함
		
		if (check == 1) { // id/pw가 맞을 때
			
			dao.senseDelete(num); // 센스 게시글 삭제			
			int deleteCheck = dao.senseDeleteCheck(num); // 게시글 삭제 확인 
			
			if(deleteCheck == 0) { // 제대로 삭제 되었을 때
				model.addAttribute("check",check); // 1을 반환
			}else {
				check = -1;
				model.addAttribute("check", check); // -1을 반환
			}
			
		}else {	// id/pw가 틀릴 때
			model.addAttribute("check",check); // 0을 반환
		}
		
		return "/sense/senseDeletePro";
	}
	
}
