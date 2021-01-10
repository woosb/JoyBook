package com.spring.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.dto.User;
import com.spring.dto.UserDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "index";
	}
	
	@GetMapping(value="/ajax")
	@ResponseBody
	public String ajax(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(username);
		System.out.println(password);
		
//		PrintWriter out = response.getWriter();
//		out.print("ok");
//		out.flush();
		return username;
	}	
	
	@GetMapping(value="/getajax")
	public String getAjax() {
		return "getAjax";
	}	
	@GetMapping(value="/postajax")
	public String postAjax() {
		return "postAjax";
	}	
	
	@PostMapping(value="/postajax")
	public void postAjax(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(username);
		System.out.println(password);
		
		String jsonData = "{\"username\" : \"ssar\", \"password\" : \"1234\"}";
		PrintWriter out = response.getWriter();
		response.setContentType("application/json");
		out.print(jsonData);
		out.flush();
	}
	
	@GetMapping(value="/jsonajax")
	public String jsonajax() {
		return "jsonAjax";
	}
	
	@PostMapping(value="/jsonajax")
	@ResponseBody
	public User postJson(HttpServletRequest request, HttpServletResponse response) throws IOException {
		BufferedReader br = request.getReader(); //순수하게 http body데이터를 읽는다.
		String requestData = br.readLine();
		System.out.println(requestData);
		
		Gson gson = new Gson();
//		gson.fromJson() =>json을 자바 오브젝트로
//		gson.toJson() => 자바 오브젝트를 json으로
		UserDTO dto = gson.fromJson(requestData, UserDTO.class);
		System.out.println(dto.toString());
		
		User user = new User();
		user.setId(1);
		user.setUsername("love");
		user.setPhone("0102222");
		
//		response.setContentType("application/json; charset=utf-8");
//		PrintWriter out = response.getWriter();
//		out.print(gson.toJson(user));
//		out.flush();
		return user;
	}
}
