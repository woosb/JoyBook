package com.joy.mapper;

import com.joy.domain.MemberVO;

public interface MemberMapper {
	public void signUp(MemberVO member);
	public MemberVO read(String userId);
	public void setAuth(MemberVO member);
}
