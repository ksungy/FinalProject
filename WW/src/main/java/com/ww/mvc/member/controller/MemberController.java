package com.ww.mvc.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.ww.mvc.member.model.vo.Member;
import com.ww.mvc.member.model.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member")
@SessionAttributes("loginMember") // session 범위까지 확장!
public class MemberController {
	
	@Autowired
	@Qualifier("memberService")
	private MemberService service;
	
	// 로그인 페이지 이동
	@GetMapping("/login")
	public String login() {
		
		log.info("로그인 페이지 요청");
		
		return "member/login";
	};
	
	// 로그인 처리
	@RequestMapping(value="/login", method = {RequestMethod.POST})
	public ModelAndView login(
			ModelAndView model,
			@RequestParam("id") String id, @RequestParam("password") String password) {
		
		Member loginMember = service.login(id, password);
		
		if (loginMember != null) {
			
			model.addObject("loginMember", loginMember);
			model.setViewName("redirect:/");
		} else {
			// 로그인 실패
			model.addObject("msg", "아이디나 비밀번호가 일치하지 않습니다.");
			
			model.addObject("location", "/");
			model.setViewName("common/msg");
		}
			
		return model;
	}
	
	// 이용약관 페이지 열기!
	@GetMapping("/joinTerms")
	public String joinTerms() {
		
		return "member/joinTerms";
	}
	
	// 로그아웃 처리
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		
		status.setComplete();
		
		return "redirect:/"; 
	}
	
	// 회원가입 페이지 이동
	@GetMapping("/enroll")
	public String enroll() {
		
		log.info("회원 가입 페이지 요청");
		
		return "member/enroll";
	}
	
	@PostMapping("/enroll")
	public ModelAndView enroll(ModelAndView model, @ModelAttribute Member member) {
		
		log.info("회원가입 으로 넘어가나?");
		
		
		int result = service.save(member); // 정수값 리턴
		
		if (result > 0) {
			model.addObject("msg", "회원가입이 정상적으로 완료되었습니다.");
			model.addObject("location", "/");
		} else {
			model.addObject("msg", "회원가입을 실패하였습니다.");
			model.addObject("location", "/member/enroll");
		}
		
		model.setViewName("common/msg");
		
		log.info(member.toString());
		
		return model;
	}
	
	@PostMapping("/idCheck")
	@ResponseBody
	public Object idCheck(@RequestParam("userId") String userId) {
		Map<String, Boolean> map = new HashMap<>();
		
		log.info("{}", userId);
		
		map.put("duplicate", service.isDuplicateID(userId));
		
		return map;
	}

}
