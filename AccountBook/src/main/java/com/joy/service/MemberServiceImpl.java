package com.joy.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.joy.domain.MemberVO;
import com.joy.mapper.CustomerMapper;
import com.joy.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor// ��� �ʵ尪�� �Ķ���ͷ� �޴� �����ڸ� ������ �ش�.
public class MemberServiceImpl implements MemberService{
	
	@Setter(onMethod_=@Autowired)
	private MemberMapper mapper;
	
	//security-contex.xml
	@Setter(onMethod_=@Autowired)
	private PasswordEncoder pwencoder;
	
	@Override
	public void registerMember(MemberVO member) {
		Date date = new Date();
		member.setRegDate(date);
		String userPw = member.getUserPw();
		member.setUserPw(pwencoder.encode(userPw));
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
}
