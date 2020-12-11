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
}
