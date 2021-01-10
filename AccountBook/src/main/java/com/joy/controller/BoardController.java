package com.joy.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.multipart.MultipartResolver;

import com.joy.domain.BoardVO;
import com.joy.domain.Criteria;
import com.joy.domain.DateIncomeVO;
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
	
	
	@Setter(onMethod_ = @Autowired)
	BoardService service;
	
	@Autowired
	IncomeService incomeService;

	@GetMapping("/list")
	public void boardList(Model model, Criteria cri) {
		model.addAttribute("pageName", "boardList");	
		log.info("list: "+ cri);

		int total = service.getTotal();

		model.addAttribute("list", service.selectList(cri));
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		log.info("total: " + total);
	}
	
	@GetMapping("/detail")
	public String selectDetail(HttpSession session,
			@RequestParam(value="id") String id ,
			Model model, 
			HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		
		service.setHitCookie(request, response, session, id);
		
		List<BoardVO> reply = service.selectReply(Integer.parseInt(id));
		model.addAttribute("reply", reply);
		
		BoardVO vo = service.selectDetail(Integer.parseInt(id));
		model.addAttribute("detail", vo);
		
		return "board/detail";
	}
	
	@GetMapping("/insert")
	public void insert() {
		
	}
	
	@PostMapping("/insert")
	public String insert(HttpSession session, BoardVO vo) {
		
		String userId = (String)session.getAttribute("userId");
		vo.setUserId(userId);
		service.insert(vo);
		return "redirect:/board/list";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam(value="ref") String ref) {
		BoardVO vo = new BoardVO();
		vo.setRef(Integer.parseInt(ref));
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
	public String recommend(HttpSession session,
			@RequestParam(value="id") String id, 
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		service.setRecCookie(request, response, session, id);

		return "redirect:/board/detail?id="+id;
	}
	
	@PostMapping("/reply")
	@ResponseBody
	public void reply(HttpSession session, BoardVO vo) {
		vo.setUserId( (String)session.getAttribute("userId"));
		service.reply(vo);
		log.info(vo);
	}
	
	@PostMapping(value="/rereply")
	public String rereply(HttpSession session, BoardVO vo, @RequestParam("detailId") String detailId) {
		vo.setUserId((String)session.getAttribute("userId"));
		vo.setId(vo.getParentNum());
		log.info(vo);
		service.reply(vo);
		return "redirect:/board/detail?id="+detailId;
	}
	
	@GetMapping
	public void rereply(BoardVO vo, Model model, @RequestParam("detailId") String detailId ) {
		model.addAttribute("vo", vo);
		model.addAttribute("detailId", detailId);
	}
	
	@GetMapping(value = "/dashboard")
	public void dashboard(Model model, HttpSession session) {
		model.addAttribute("pageName", "Dashboard");	

		Date date = new Date();
		
		String designer_id = (String)session.getAttribute("userId");
		
		List<DateIncomeVO> annualIncome = incomeService.getAnnualIncome(designer_id, date);
		model.addAttribute("annualIncome", annualIncome);
		
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
