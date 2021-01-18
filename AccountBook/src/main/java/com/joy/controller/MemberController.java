package com.joy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.joy.domain.MemberVO;
import com.joy.service.MemberService;
import com.joy.service.UserSha256;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping(value="/member")
public class MemberController {
	private MemberService service;
	
	@GetMapping(value = "/signIn")
	public void login(Model model) {
		model.addAttribute("pageName", "SIGNIN");	
	}
	
	@PostMapping(value = "/signIn")
	public String loginCheck(MemberVO vo, HttpSession session) {
		vo.setUserPw(UserSha256.encrypt(vo.getUserPw()));
		log.info(vo.toString());
		int result = service.signIn(vo, session);
		if(result == 1) {
			return "redirect:/";
		}else {
			return "redirect:/member/signIn";
		}
	}
	
	@GetMapping(value="/signOut")
	public String signOut(HttpSession session, Model model) {
		model.addAttribute("pageName", "SIGNOUT");	
		session.invalidate();
		return "redirect:/member/signIn";
	}
	
	@GetMapping(value = "/signUp")
	public void signUp(Model model) {
		model.addAttribute("pageName", "SIGNUP");	
	}
	
	@PostMapping(value = "/signUp")
	public String signUp(MemberVO member) {
		member.setUserPw(UserSha256.encrypt(member.getUserPw()));
		log.info(member);
		service.registerMember(member);
		return "redirect:/member/signIn";
	}
	
	@GetMapping(value= "/modify")
	public void modify(HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");
		MemberVO member = service.readMember(userId);
		model.addAttribute("member", member);
	}
	@PostMapping(value= "/modify")
	public String modify(MemberVO member) {
		log.info(member);
		service.modifyMember(member);
		return "redirect:/customer/list";
	}
}
