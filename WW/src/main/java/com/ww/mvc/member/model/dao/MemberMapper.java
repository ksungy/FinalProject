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


}
