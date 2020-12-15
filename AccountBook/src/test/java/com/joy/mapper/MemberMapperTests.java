package com.joy.mapper;

import java.util.Date;
import java.util.List;

import org.junit.Test;	
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.joy.domain.MemberVO;
import com.joy.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class MemberMapperTests {
	
	@Setter(onMethod_ = {@Autowired})
	private MemberMapper mapper;
	
	@Setter(onMethod_ = {@Autowired})
	private MemberService memberService;

	
	@Test
	public void register() throws Exception{
		MemberVO member = new MemberVO();
		String userId = "asd@naver.com";
		String userPw = "asd";
		String userName = "asd";
		Date regDate = new Date();
		Date updateDate = new Date();
		
		member.setUserId(userId);
		member.setUserPw(userPw);
		member.setUserName(userName);
		member.setRegDate(regDate);
		member.setUpdateDate(updateDate);
		
		memberService.registerMember(member);
	}
	
//	@Test
//	public void read () throws Exception{
//		
//		MemberVO vo = mapper.read("asd");
//		
//		log.info(vo);
//		vo.getAuthList().forEach(authVO -> log.info(authVO));
//	}
}



