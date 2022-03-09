package com.ww.mvc.cmt.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.ww.mvc.cmt.model.service.CmtService;
import com.ww.mvc.cmt.model.vo.Cmt;
import com.ww.mvc.cmt.model.vo.Rest;
import com.ww.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/cmt")
public class CmtController {
	@Autowired
	private CmtService service;
    

    @GetMapping("/dashboard")
    public String cmtdb() {
        
        return "/cmt/dashboard";
    }

    @GetMapping("/modify")
    public String cmtModify() {
        
        return "/cmt/modify";
    }
    
    @GetMapping("/monthly")
    public String cmtMonthly() {
        
        return "/cmt/monthly";
    }
	// 개인 근무관리 메인페이지 - 초기 정보 세팅
	@RequestMapping(value = "attmaingetdata", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String attMainGetDataMethod(HttpSession session) {
		Gson gson = new Gson();
		Map<String, Object> mapM = new HashMap<String, Object>();

		// emp_no 받아오기
		Member loginMember = (Member) session.getAttribute("loginMember");

		int emp_no = loginMember.getNo();

		// 오늘 날짜 Attendance 테이블 읽어오기 + 총 휴식시간 포함
		Cmt cmt = null;
		cmt = service.getTodayAttendance(emp_no);
		System.out.println("화면진입 시 cmt폼의 결과는?: " + cmt);
		mapM.put("cmt", cmt);

		Rest wb = null;
		if (cmt != null) {
			// cmt_no 설정하기
			int thisAttNo = cmt.getCmt_no();

			// 매개변수로 사용할 cmt_no, emp_no 매핑
			Map<String, Object> mapMS = new HashMap<String, Object>();
			mapMS.put("emp_no", emp_no);
			mapMS.put("thisAttNo", thisAttNo);

			// setInterval용도 date 읽어오기
			String attStartDateTime = service.getAttStartDateTime(mapMS);
			mapM.put("attStartDateTime", attStartDateTime);

			// 출퇴근 경과시간 읽어오기
			Map<String, Object> elapsedWTime = new HashMap<String, Object>();
			if (cmt.getCmt_end() != null) {
				elapsedWTime = service.getElapsedWTime(mapMS);
				String hours = String.valueOf(elapsedWTime.get("EH"));
				String minutes = String.valueOf(elapsedWTime.get("EM"));
				String seconds = String.valueOf(elapsedWTime.get("ES"));
				String elapsedWTBefore = hours + ":" + minutes + ":" + seconds;
				String elapsedWTAfter = elapsedWTBefore.replace(" ", "");
				mapM.put("elapsedWTime", elapsedWTAfter);
			}

			// 오늘 날짜 WORK_BREAK 읽어오기
			wb = service.getLatestWB(mapMS);

		}
		if (wb != null) {
			mapM.put("wb", wb);
		}

		String result = gson.toJson(mapM);
		return result;
	}
	
	// 출근등록 ajax
	@RequestMapping(value = "checkin", method = RequestMethod.POST)
	@ResponseBody
	public String checkinMethod(@RequestParam(value = "emp_no") int emp_no) throws IOException {

		String result = "";

		// 동일 날짜 출근 여부 확인
		int resultOfExist = service.countAttStart(emp_no);

		String attStartFormat = service.getAttStart(emp_no);
		System.out.println("출근함?");
		
		if (attStartFormat == null) {
			int resultOfCheckin = service.insertCheckin(emp_no); // 출근등록
			if (resultOfCheckin > 0) {
				attStartFormat = service.getAttStart(emp_no); // 출근시각 읽어오기
				result = attStartFormat;
				System.out.println("출근 등록 완료");
			} else {
				System.out.println("출근 등록 실패");
				result = ""; // 출근 insert 실패
			}
		} else {
			result = attStartFormat;
		}

		return result;
	}
	
	// 퇴근 등록
	@RequestMapping(value = "checkout", method = RequestMethod.POST)
	@ResponseBody
	public String checkoutMethod(@RequestParam(value = "emp_no") String empno) {

		int emp_no = Integer.parseInt(empno);
		String result = "";

		// 퇴근시간 update + 휴식 강제 종료도 함께하기
		int resultOfCheckout = service.updateCheckout(emp_no);

		// 퇴근시각 읽어오기
		if (resultOfCheckout > 0) {
			String attEndFormat = service.getAttEnd(emp_no);
			result = attEndFormat;
		}

		return result;
	}

	// 휴식시작 ajax
	@RequestMapping(value = "restin", method = RequestMethod.POST)
	@ResponseBody
	public String restinMethod(@RequestParam(value = "emp_no") String empno) {

		int emp_no = Integer.parseInt(empno);
		String result = "";

		// 휴식시작 insert
		int resultOfRestin = service.insertRestin(emp_no);

		if (resultOfRestin > 0) {
			Rest wb = service.getRestStart(emp_no);
			Gson gson = new Gson();
			result = gson.toJson(wb);
		}

		return result;
	}

	// 휴식종료 ajax
	@RequestMapping(value = "restout", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String restoutMethod(@RequestParam(value = "rs_no") String rsno, HttpSession session) {
		Map<String, Object> mapM = new HashMap<String, Object>();

		int rs_no = Integer.parseInt(rsno);

		int resultOfRestout = service.updateBrEnd(rs_no);

		String restEndFormat = "00:00:00";
		Rest wb = null;
		if (resultOfRestout > 0) {
			// restEndFormat = service.getBrEnd(brNo);
			wb = service.getWorkBreak(rs_no);
			restEndFormat = wb.getRs_end();
			mapM.put("restEndFormat", restEndFormat);
		}

		// 총 휴식 시간 계산하기
		Map<String, Object> elapsedRTime = new HashMap<String, Object>();
		if (restEndFormat != null && !restEndFormat.equals("00:00:00")) {
			Member loginMember = (Member) session.getAttribute("loginMember");
			int emp_no = loginMember.getNo();

			String elapsedRTAfter = calRestTime(emp_no, wb.getCmt_no());
			mapM.put("elapsedRTime", elapsedRTAfter);
		}

		// 총 휴식 시간 계산하기
//		Map<String, Object> elapsedRTime = new HashMap<String, Object>();
//		 if() {
//			 elapsedRTime = service.getElapsedRTime(mapMS);
//			 System.out.println("화면진입 시 elapsedRTime: "+elapsedRTime);
//			 String hours = String.valueOf(elapsedRTime.get("EH"));
//			 String minutes = String.valueOf(elapsedRTime.get("EM"));
//			 String seconds = String.valueOf(elapsedRTime.get("ES"));
//			 String elapsedRTBefore = hours + ":" + minutes + ":" + seconds;
//			 String elapsedRTAfter = elapsedRTBefore.replace(" ", "");
//			 System.out.println("elapsedRTime: "+elapsedRTAfter);
//			 mapM.put("elapsedRTime", elapsedRTAfter);			 
//		 }

		Gson gson = new Gson();
		String r = gson.toJson(mapM);
		return r;
	}

	// 근무내역 ajax
	@RequestMapping(value = "getattlist", method = RequestMethod.GET, produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getAttListMethod(@RequestParam(value = "emp_no") String empno,
			@RequestParam(value = "currentPage", required = false) String currentpage) {
		Map<String, Object> mapM = new HashMap<String, Object>();

		int emp_no = Integer.parseInt(empno);
		int currentPage = 1;
		int limitInOnePage = 5;
		if (currentpage != null) {
			currentPage = Integer.parseInt(currentpage);
		}
		// 전체 게시글 수
		int attListCount = service.countAttList(emp_no);
		// 총 페이지 수 계산
		int maxPage = (int) ((double) attListCount / limitInOnePage + 0.9);
		// 현재 페이지에 보여줄 시작 페이지 번호
		int startPage = (((int) ((double) currentPage / limitInOnePage + 0.9)) - 1) * limitInOnePage + 1;
		int endPage = startPage + limitInOnePage - 1;
		if (maxPage < endPage) {
			endPage = maxPage;
		}

//		// 근무내역 상세내역
		List<Cmt> attList = null;
		attList = service.getAttList(emp_no, currentPage, limitInOnePage);
		
		mapM.put("attList", attList);
		mapM.put("currentPage", currentPage);
		mapM.put("maxPage", maxPage);
		mapM.put("startPage", startPage);
		mapM.put("endPage", endPage);

		Gson gson = new Gson();
		String r = gson.toJson(mapM);
		return r;
	}
	
	private String calRestTime(int emp_no, int cmt_no) {
		// parameter map형태로 만들기
		Map<String, Object> mapS = new HashMap<String, Object>();
		mapS.put("emp_no", emp_no);
		mapS.put("thisAttNo", String.valueOf(cmt_no));

		// 총 휴식시간 DB에서 계산해 오기
		Map<String, Object> elapsedRTime = service.getElapsedRTime(mapS);

		// 결과를 보기 좋게 바꾸기
		String elapsedRTAfter = myFormatedTime(elapsedRTime);

		return elapsedRTAfter;
	}
	
	private String myFormatedTime(Map<String, Object> elapsedTime) {
		String hours = String.valueOf(elapsedTime.get("EH"));
		String minutes = String.valueOf(elapsedTime.get("EM"));
		String seconds = String.valueOf(elapsedTime.get("ES"));
		String elapsedTBefore = hours + ":" + minutes + ":" + seconds;
		String elapsedTAfter = elapsedTBefore.replace(" ", "");
		System.out.println("elapsedRTime: " + elapsedTAfter);
		return elapsedTAfter;
	}	
	
	@GetMapping("/cmtsrt")
	public ModelAndView cmtsrt(ModelAndView model, 
							   @SessionAttribute("loginMember") Member loginMember,
							   @RequestParam("cmt_no") int cmt_no) {
		int result = 0;
		
		Cmt cmt = service.getTodayAttendance(cmt_no);
		
		if(cmt.getEmp_no() == loginMember.getNo()) {
			
			if(result > 0) {
				model.addObject("msg", "게시글이 정상적으로 삭제되었습니다.");
				model.addObject("location", "/cmt/dashboard");				
			} else {
				model.addObject("msg", "게시글 삭제에 실패하였습니다.");
				model.addObject("location", "/cmt/dashboard");			
			}
			
		} else {
			model.addObject("msg", "안된다");
			model.addObject("location", "/cmt/dashboard");
		}
		return model;
		
	}
	
	
	
	
	
	
	
	// 메인 컨트롤러
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv, HttpSession session) {
		String viewpage = "main";
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		try {
			//setInterval용도 date 읽어오기
			String attStart = null;
			attStart = service.getAttStart(loginMember.getNo());
			mv.addObject("attStart", attStart);
			
			//퇴근시각 읽어오기
			String attEndFormat = null;
			attEndFormat = service.getAttEnd(loginMember.getNo());
			mv.addObject("attEndFormat", attEndFormat);
			
			// 오늘 날짜 Attendance 테이블 읽어오기 + 총 휴식시간 포함
			Cmt cmt = null;
			cmt = service.getTodayAttendance(loginMember.getNo());
			mv.addObject("cmt", cmt);
			System.out.println("cmt_srt" + cmt.getCmt_srt());
			
			Rest wb = null;
			if (cmt != null) {
				// attNo설정하기
				int thisAttNo = cmt.getCmt_no();

				// 매개변수로 사용할 attNo&stfNo 매핑
				Map<String, Object> mapMS = new HashMap<String, Object>();
				mapMS.put("emp_no", loginMember.getNo());
				mapMS.put("thisAttNo", thisAttNo);

				// 출퇴근 경과시간 읽어오기
				Map<String, Object> elapsedWTime = new HashMap<String, Object>();
				if (cmt.getCmt_end() != null) {
					elapsedWTime = service.getElapsedWTime(mapMS);
					String todayHours = String.valueOf(elapsedWTime.get("EH"));
					String todayMinutes = String.valueOf(elapsedWTime.get("EM"));
					mv.addObject("todayHours", todayHours);
					mv.addObject("todayMinutes", todayMinutes);
				}

				// 오늘 날짜 WORK_BREAK 읽어오기
				wb = service.getLatestWB(mapMS);
				mv.addObject("wb", wb);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mv;
	}
}