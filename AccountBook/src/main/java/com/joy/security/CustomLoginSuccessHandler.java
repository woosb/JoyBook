package com.joy.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		log.warn("Login Success");
		
		List<String> roleNames = new ArrayList<>();
		
		authentication.getAuthorities().forEach(authroty -> {
			roleNames.add(authroty.getAuthority());
		});
		
		log.warn("ROLE NAMES: " + roleNames);
		
//		if(roleNames.contains("ROLE_ADMIN")) {
//			response.sendRedirect("/customer/list");
//			return;
//		}
		if(roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect("/");
			return;
		}
		response.sendRedirect("/");
	}
}