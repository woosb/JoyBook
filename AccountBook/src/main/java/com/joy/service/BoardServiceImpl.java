package com.joy.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joy.domain.BoardVO;
import com.joy.domain.Criteria;
import com.joy.domain.PageDTO;
import com.joy.mapper.BoardMapper;
import com.joy.mapper.CustomerMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{
	
	@Setter(onMethod_=@Autowired)
	BoardMapper mapper;
	
	@Override
	public List<BoardVO> selectList(Criteria cri) {		
		cri.setLimitStart((cri.getPageNum()-1)*10);
		return mapper.selectList(cri);
	}

	@Override
	public BoardVO selectDetail(int id) {
		return mapper.selectDetail(id);
	}
	
	@Override
	public void insert(BoardVO vo) {
		Date regDate = new Date();
		vo.setRegDate(regDate);
		Integer ref = getMaxRef();
		if(ref == null) {
			ref = 0;
		}
		if(ref != 0) {
			vo.setRef(ref+1);
		}else if(ref == 0){
			vo.setRef(1);
		}
		mapper.insert(vo);
		
	}
	
	public Integer getMaxRef() {
		return mapper.getMaxRef();
	}

	@Override
	public int delete(BoardVO vo) {
		log.info(vo.toString());
		return mapper.delete(vo);
	}
	
	@Override
	public Integer getRef(int id) {
		return mapper.getRef(id);
	}
	
	@Override
	public void modify(BoardVO vo) {
		mapper.modify(vo);
	}
	
	@Override
	public void recommend(int id) {
		mapper.recommend(id);
	}
	
	@Override
	public int reply(BoardVO vo) {
		updateAnswerNum(vo.getId());
		log.info(vo);
//		int MaxRefOrder = getMaxRefOrder(vo);
		updateRef(vo);
		vo.setRefOrder(vo.getRefOrder()+1);
		vo.setStep(vo.getStep()+1);
		vo.setParentNum(vo.getId());
		vo.setRegDate(new Date());
		return mapper.reply(vo);
	}
	
	public void updateAnswerNum(int id) {
		mapper.updateAnswerNum(id);
	}

	@Override
	public List<BoardVO> selectReply(int id) {
		int ref = mapper.getRef(id);
		return mapper.selectReply(ref);
	}

	@Override
	public Integer getTotal() {
		return mapper.getTotal();
	}
	
	@Override
	public void updateRef(BoardVO vo) {
		mapper.updateRef(vo);
	}

//	final int cookieAge = 1*24*60*60;
	final int cookieAge = 10;
	@Override
	public void setHitCookie(HttpServletRequest request, HttpServletResponse response, HttpSession session, String id) throws UnsupportedEncodingException {
		String userId = (String)session.getAttribute("userId");
		Cookie viewCookie = null;
		Cookie[] cookies = request.getCookies();
		if(cookies != null && cookies.length > 0) {
			for(Cookie c : cookies) {
				if(c.getName().equals(URLEncoder.encode("boardId"+id+userId, "UTF-8"))) {
                    log.info("처음 쿠키가 생성한 뒤 들어옴.");
					viewCookie = c;
				}
			}
		}
		
		if(viewCookie == null) {
			mapper.updateHit(Integer.parseInt(id));
			Cookie newCookie = new Cookie(URLEncoder.encode("boardId"+id+userId,"UTF-8"),"hit");
			newCookie.setMaxAge(cookieAge);
			newCookie.setPath("/");
			response.addCookie(newCookie);
		}
	}

	@Override
	public void setRecCookie(HttpServletRequest request, HttpServletResponse response, HttpSession session, String id)
			throws UnsupportedEncodingException {
		Cookie viewCookie = null;
		Cookie[] cookies = request.getCookies();
		if(cookies != null && cookies.length > 0) {
			for(Cookie c : cookies) {
				if(c.getName().equals(URLEncoder.encode("recommend"+id+(String)session.getAttribute("userId"), "UTF-8"))) {
                    log.info("처음 쿠키가 생성한 뒤 들어옴.");
					viewCookie = c;
				}
			}
		}
		
		if(viewCookie == null) {
			mapper.recommend(Integer.parseInt(id));
			Cookie newCookie = new Cookie(URLEncoder.encode("recommend"+id+(String)session.getAttribute("userId"), "UTF-8"),"recommend");
			newCookie.setMaxAge(cookieAge);
			newCookie.setPath("/");
			response.addCookie(newCookie);
		}
		log.info("추천버튼 눌림");
	}
}
