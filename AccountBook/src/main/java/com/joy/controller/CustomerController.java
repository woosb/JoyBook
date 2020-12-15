package com.joy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.joy.domain.Criteria;
import com.joy.domain.CustomerVO;
import com.joy.domain.MemberVO;
import com.joy.domain.PageDTO;
import com.joy.service.CustomerService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/customer/*")
@AllArgsConstructor
public class CustomerController {
	
	private CustomerService service;
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model, HttpSession session) {
		log.info("list: "+ cri);
		
		String userId = (String)session.getAttribute("userId");
		cri.setDesigner_id(userId);
		model.addAttribute("list", service.getAllCustomerWithPaging(cri));
		
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));

		log.info("total: " + total);
	}
	
	@GetMapping("/register")
	public void register(MemberVO member, Model model) {
		log.info("Get register....");
	}
	
	@PostMapping("/register")
	public String register(CustomerVO customer, RedirectAttributes rttr, HttpSession session) {
		log.info("=========================");
		log.info("register: " + customer);
		String designer_id = (String)session.getAttribute("userId");
		customer.setDesigner_id(designer_id);
		service.registerCustomer(customer);
		return "redirect:/customer/list";
	}
}
