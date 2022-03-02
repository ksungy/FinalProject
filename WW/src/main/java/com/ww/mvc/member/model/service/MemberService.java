package com.ww.mvc.member.model.service;

import org.springframework.stereotype.Component;

import com.ww.mvc.member.model.vo.Member;

@Component
public interface MemberService {
	
	Member findMemberById(String id);
	
	int save(Member member);

	Member login(String id, String password);

	Boolean isDuplicateID(String userId);
	

}