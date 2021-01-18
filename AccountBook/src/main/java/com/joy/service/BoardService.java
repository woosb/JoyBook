package com.joy.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.joy.domain.BoardVO;
import com.joy.domain.Criteria;

public interface BoardService {
	public List<BoardVO> selectList(Criteria cri);
	public BoardVO selectDetail(int id);
	public void insert(BoardVO vo);
	
	public int delete(BoardVO vo);
	public Integer getRef(int id);
	
	public void modify(BoardVO vo);
	public void recommend(int id);
	public Integer getTotal();
	
	public void updateRef(BoardVO vo);
	
	public List<BoardVO> selectReply(int parentNum);
	
	public int reply(BoardVO vo);
	
	public List<BoardVO> getIndexArticle();
	public List<BoardVO> searchList(String keyword);
	
	
	public void setHitCookie(HttpServletRequest request, HttpServletResponse response, HttpSession session, String id) throws UnsupportedEncodingException;
	public void setRecCookie(HttpServletRequest request, HttpServletResponse response, HttpSession session, String id) throws UnsupportedEncodingException;
}
