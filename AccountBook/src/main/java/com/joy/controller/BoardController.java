package com.joy.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.joy.domain.BoardVO;
import com.joy.domain.Criteria;
import com.joy.domain.PageDTO;
import com.joy.service.BoardService;
import com.joy.service.IncomeService;
import com.joy.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
//	final int cookieAge = 1*24*60*60;
	final int cookieAge = 10;
	
	@Setter(onMethod_ = @Autowired)
	BoardService service;
	
	@GetMapping("/list")
	public void boardList(Model model, Criteria cri) {
		log.info("list: "+ cri);

		int total = service.getTotal();

		model.addAttribute("list", service.selectList(cri));
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		log.info("total: " + total);
	}
	
	@GetMapping("/detail")
	public String selectDetail(Principal principal,
			@RequestParam(value="id") String id ,
			@RequestParam(value="ref") String ref ,
			Model model, 
			HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		
		Cookie viewCookie = null;
		Cookie[] cookies = request.getCookies();
		if(cookies != null && cookies.length > 0) {
			for(Cookie c : cookies) {
				if(c.getName().equals(URLEncoder.encode("boardId"+id+principal.getName(), "UTF-8"))) {
                    log.info("처음 쿠키가 생성한 뒤 들어옴.");
					viewCookie = c;
				}
			}
		}
		
		if(viewCookie == null) {
			service.updateHit(Integer.parseInt(id));
			Cookie newCookie = new Cookie(URLEncoder.encode("boardId"+id+principal.getName(),"UTF-8"),"hit");
			newCookie.setMaxAge(cookieAge);
			newCookie.setPath("/");
			response.addCookie(newCookie);
		}
		
		List<BoardVO> reply = service.selectReply(Integer.parseInt(ref));
		model.addAttribute("reply", reply);
		
		
		BoardVO vo = service.selectDetail(Integer.parseInt(id));
		model.addAttribute("detail", vo);
		return "board/detail";
	}
	
	@GetMapping("/insert")
	public void insert() {
		
	}
	@PostMapping("/insert")
	public String insert(Principal principal, BoardVO vo) {
		String userId = principal.getName();
		vo.setUserId(userId);
		service.insert(vo);
		return "redirect:/board/list";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam(value="id") String id) {
		BoardVO vo = new BoardVO();
		vo.setId(Integer.parseInt(id));
		service.delete(vo);
		return "redirect:/board/list";
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam(value="id") String id, Model model) {
		BoardVO vo = service.selectDetail(Integer.parseInt(id));
		model.addAttribute("vo", vo);
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO vo) {
		service.modify(vo);
		return "redirect:/board/list";
	}
	
	@GetMapping("/recommend")
	public String recommend(Principal principal,
			@RequestParam(value="id") Integer id, 
			@RequestParam(value="ref") Integer ref, 
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		Cookie viewCookie = null;
		Cookie[] cookies = request.getCookies();
		if(cookies != null && cookies.length > 0) {
			for(Cookie c : cookies) {
				if(c.getName().equals(URLEncoder.encode("recommend"+id+principal.getName(), "UTF-8"))) {
                    log.info("처음 쿠키가 생성한 뒤 들어옴.");
					viewCookie = c;
				}
			}
		}
		
		if(viewCookie == null) {
			service.recommend(id);
			Cookie newCookie = new Cookie(URLEncoder.encode("recommend"+id+principal.getName(), "UTF-8"),"recommend");
			newCookie.setMaxAge(cookieAge);
			newCookie.setPath("/");
			response.addCookie(newCookie);
		}
		log.info("추천버튼 눌림");
		return "redirect:/board/detail?id="+id+"&ref="+ref;
	}
	
	@PostMapping("/reply")
	public String reply(Principal principal, BoardVO vo) {
		vo.setUserId(principal.getName());
		service.reply(vo);
		log.info(vo);
		return "redirect:/board/detail?id="+vo.getId()+"&ref="+vo.getRef();
	}
	
	@PostMapping("/rereply")
	public String rereply(Principal principal, BoardVO vo, @RequestParam("detailId") String detailId) {
		vo.setUserId(principal.getName());
		vo.setId(vo.getParentNum());
		log.info(vo);
		service.reply(vo);
		log.info("redirect:/board/detail?id="+detailId+"&ref="+vo.getRef());
		return "redirect:/board/detail?id="+detailId+"&ref="+vo.getRef();
	}
	
	@GetMapping
	public void rereply(BoardVO vo, Model model, @RequestParam("detailId") String detailId ) {
		model.addAttribute("vo", vo);
		model.addAttribute("detailId", detailId);
	}
}
