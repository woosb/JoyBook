package com.joy.service;

import javax.servlet.http.HttpSession;

import com.joy.domain.MemberVO;

public interface MemberService {
	public void registerMember(MemberVO member);
	public void modifyMember(MemberVO member);
	public MemberVO readMember(String userId);
	public int signIn(MemberVO vo, HttpSession session);
}
