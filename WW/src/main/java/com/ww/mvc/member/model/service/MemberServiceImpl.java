package com.ww.mvc.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ww.mvc.member.model.dao.MemberMapper;
import com.ww.mvc.member.model.vo.Member;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public Member findMemberById(String id) {
	
		return mapper.findMemberById(id);
	}
	
	// 로그인
	@Override
	public Member login(String id, String password) {
		Member member = null;
		
		member = this.findMemberById(id);
		
		return member != null && 
				passwordEncoder.matches(password, member.getPassword()) ? member : null;
	}
	
	// 회원가입 및 업데이트
	@Override
	@Transactional
	public int save(Member member) {
		int result = 0;
		
		if(member.getNo() != 0) {
			// update
		} else {
			result = mapper.insertMember(member);
		}
		return result;
	}

	@Override
	public Boolean isDuplicateID(String userId) {
		
		return this.findMemberById(userId) != null;
	}



}
