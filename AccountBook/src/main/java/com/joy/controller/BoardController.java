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
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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

	@GetMapping(value="/search/{keyword}", produces="application/json; charset=utf-8")
	@ResponseBody
	public List<BoardVO> searchBoard(@PathVariable("keyword") String keyword){		
		List<BoardVO> list = service.searchList(keyword);
		return list;
	}
	
	@GetMapping(value="/search")
	public void serchBoard(@RequestParam("keyword") String keyword, Model model) {
		model.addAttribute("keyword", keyword);
	}
	
	@GetMapping(value="/getIndexArticle", produces="application/json; charset=utf-8")
	@ResponseBody
	public List<BoardVO> getIndexArticle(){
		List<BoardVO> list = service.getIndexArticle();
		
		return list;
	}
	
	@GetMapping("/list")
	public void boardList(Model model, Criteria cri) {
		model.addAttribute("pageName", "boardList");	
		log.info("list: "+ cri);
		int total = service.getTotal();
		model.addAttribute("list", service.selectList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		log.info("total: " + total);
	}
	
	@GetMapping(value= "/contents/{pageNum}", produces="application/json; charset=utf-8")
	@ResponseBody
	public List<BoardVO> getList(@PathVariable("pageNum") Integer pageNum, Criteria cri) {
		cri.setLimitStart(pageNum);
		log.info(cri.toString());
		List<BoardVO> list = service.selectList(cri);
		return list;
	}
	
	@GetMapping(value= "/contents", produces="application/json; charset=utf-8")
	@ResponseBody
	public List<BoardVO> getList(Criteria cri) {
		List<BoardVO> list = service.selectList(cri);
		return list;
	}
	
	@GetMapping("/detail/{id}")
	public String selectDetail(HttpSession session,
			@PathVariable(value="id") String id ,
			HttpServletRequest request,
			HttpServletResponse response,
			Model model) throws UnsupportedEncodingException {
		service.setHitCookie(request, response, session, id);
		model.addAttribute("id", Integer.parseInt(id) );
		return "/board/detail";
	}
	
	@GetMapping(value="/detailContents/{id}", produces="application/json; charset=utf-8")
	@ResponseBody
	public BoardVO getDetail(@PathVariable("id") String id) {
		BoardVO vo = service.selectDetail(Integer.parseInt(id));		
		return vo;
	}
	
	@GetMapping(value="/reply/{id}", produces="application/json; charset=utf-8")
	@ResponseBody
	public List<BoardVO> getReply(@PathVariable("id") String id){
		List<BoardVO> reply = service.selectReply(Integer.parseInt(id));
		return reply;
	}
	
	@PostMapping(value="/reply")
	@ResponseBody
	public int updateReply(@RequestBody BoardVO vo, HttpSession session) {
		vo.setUserId((String)session.getAttribute("userId"));
		log.info(vo.toString());
		return service.reply(vo);
	}
	
	@GetMapping("/insert")
	public void insert() {}
	
	@PostMapping("/insert")
	public String insert(HttpSession session, BoardVO vo) {
		String userId = (String)session.getAttribute("userId");
		vo.setUserId(userId);
		service.insert(vo);
		return "redirect:/board/list";
	}
	
	@DeleteMapping("/delete/{id}")
	@ResponseBody
	public int delete(@PathVariable(value="id") String id) {
		BoardVO vo = new BoardVO();
		vo.setRef(service.getRef(Integer.parseInt(id)));
		return service.delete(vo);
	}
	
	@GetMapping("/modify/{id}")
	public String modify(@PathVariable(value="id") String id, Model model) {
		model.addAttribute("id", id);
		return "/board/modify";
	}
	
	@PostMapping("/modify")
	public String modify(BoardVO vo) {
		service.modify(vo);
		return "redirect:/board/list";
	}
	
	@PutMapping(value="/recommend/{id}")
	@ResponseBody
	public void recommend(HttpSession session,
			@PathVariable(value="id") String id, 
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		service.setRecCookie(request, response, session, id);
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
		
		List<DateIncomeVO> getNewCus = incomeService.getNewCus(designer_id, date);
		model.addAttribute("getNewCus", getNewCus);
		
		List<DateIncomeVO> getOldCus = incomeService.getOldCus(designer_id, date);
		model.addAttribute("getOldCus", getOldCus);
		
		List<DateIncomeVO> IncomeByReservationRoute = incomeService.getIncomeByReservationRoute(designer_id, date);
		model.addAttribute("IncomeByReservationRoute", IncomeByReservationRoute);
		
	}
}
