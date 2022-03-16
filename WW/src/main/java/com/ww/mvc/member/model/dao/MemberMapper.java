package com.ww.mvc.member.model.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ww.mvc.member.model.vo.Member;

@Mapper
@Repository
public interface MemberMapper {
	
	// 회원가입
	int insertMember(Member member);

	// 아이디 찾기
	Member findMemberById(@Param("id") String id);

	// 회원정보 수정
	int updateMember(Member member);
	
	// 아이디 검색해서 찾기
	String findId(Member member);

	// 회원 정보 삭제
	int deleteMember(String userId);
	
	// 비밀번호 변경
	int updatePwd(Member member);



}
