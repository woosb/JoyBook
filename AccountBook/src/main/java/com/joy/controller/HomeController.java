package com.joy.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.joy.domain.DateIncomeVO;
import com.joy.domain.MemberVO;
import com.joy.service.CustomerService;
import com.joy.service.IncomeService;
import com.joy.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Log4j
@Controller
@AllArgsConstructor
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	private MemberService service;
	private IncomeService incomeService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, Principal principal) {
//		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		SimpleDateFormat spdf1 = new SimpleDateFormat("YYYY MM dd");
		String formattedDate = spdf1.format(date);
		model.addAttribute("serverTime", formattedDate );
		
//		model.addAttribute("name", principal.getName());
		
		return "/index";
	}
	
	@GetMapping(value = "/member/signIn")
	public void login() {
	}
	@PostMapping(value = "/member/signIn")
	public void loginCheck() {
	}
	@GetMapping(value = "/member/signUp")
	public void signUp() {
	}
	@PostMapping(value = "/member/signUp")
	public String signUp(MemberVO member) {
		log.info(member);
		service.registerMember(member);
		return "redirect:/member/signIn";
	}
	@GetMapping(value= "/member/modify")
	public void modify(Principal principal, Model model) {
		String userId = principal.getName();
		MemberVO member = service.readMember(userId);
		model.addAttribute("member", member);
	}
	@PostMapping(value= "/member/modify")
	public String modify(MemberVO member) {
		log.info(member);
		service.modifyMember(member);
		return "redirect:/customer/list";
	}
	
	@GetMapping(value = "/member/dashboard")
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
