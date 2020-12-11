package com.joy.controller;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.joy.domain.DateIncomeVO;
import com.joy.domain.MemberVO;
import com.joy.service.IncomeService;
import com.joy.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping(value="/member")
public class MemberController {
	private MemberService service;
	private IncomeService incomeService;
	
	@GetMapping(value = "/signIn")
	public void login() {
	}
	@PostMapping(value = "/signIn")
	public void loginCheck() {
	}
	@GetMapping(value = "/signUp")
	public void signUp() {
	}
	@PostMapping(value = "/signUp")
	public String signUp(MemberVO member) {
		log.info(member);
		service.registerMember(member);
		return "redirect:/member/signIn";
	}
	@GetMapping(value= "/modify")
	public void modify(Principal principal, Model model) {
		String userId = principal.getName();
		MemberVO member = service.readMember(userId);
		model.addAttribute("member", member);
	}
	@PostMapping(value= "/modify")
	public String modify(MemberVO member) {
		log.info(member);
		service.modifyMember(member);
		return "redirect:/customer/list";
	}
	
	@GetMapping(value = "/dashboard")
	public void dashboard(Model model, Principal principal) {
//		Calendar cal = Calendar.getInstance();
//		cal.set(2015, 01, 11);
//		Date date = cal.getTime();
		
		Date date = new Date();
//		log.info(date);
		
		String designer_id = principal.getName();
		
		List<DateIncomeVO> annualIncome = incomeService.getAnnualIncome(designer_id, date);
		model.addAttribute("annualIncome", incomeService.getAnnualIncome(designer_id, date));
		
		List<DateIncomeVO> AnnualIncomeList = incomeService.getAnnualIncomeList(designer_id, date);
		model.addAttribute("AnnualIncomeList", AnnualIncomeList);
		
		List<DateIncomeVO> MonthIncome = incomeService.getMonthIncome(designer_id, date);
		model.addAttribute("MonthIncome", MonthIncome);
		
		List<DateIncomeVO> MonthlyIncomeList = incomeService.getMonthlyIncomeList(designer_id, date);
		model.addAttribute("MonthlyIncomeList", MonthlyIncomeList);
		
		List<DateIncomeVO> IncomeByReservationRoute = incomeService.getIncomeByReservationRoute(designer_id, date);
		model.addAttribute("IncomeByReservationRoute", IncomeByReservationRoute);
		
	}
}
