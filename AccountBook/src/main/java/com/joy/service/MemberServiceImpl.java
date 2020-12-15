package com.joy.service;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joy.domain.MemberVO;
import com.joy.mapper.CustomerMapper;
import com.joy.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{
	
	@Setter(onMethod_=@Autowired)
	private MemberMapper mapper;
	
	
	@Override
	public void registerMember(MemberVO member) {
		Date date = new Date();
		member.setRegDate(date);
		String userPw = member.getUserPw();
		member.setUserPw(userPw);
//		log.info(member);
		mapper.signUp(member);
		setAuth(1, member);
	}
	public void setAuth(int auth , MemberVO member) {
		if(auth == 1) {
			mapper.setAuth(member);
		}else if(auth == 2) {
			
		}
	}
	@Override
	public void modifyMember(MemberVO member) {
		
	}
	@Override
	public MemberVO readMember(String userId) {
		MemberVO user = mapper.read(userId);
		return user;
	}
	
	@Override
	public int signIn(MemberVO vo, HttpSession session) {
		MemberVO user = null;
		user = mapper.signIn(vo);
		if(user != null) {
			if( user.getUserPw().equals(vo.getUserPw()) ) {
				session.setAttribute("userId", user.getUserId());
				return 1;
			}else {
				return 0;
			}
		}else {
			return -1;
		}
	}
}
