package com.joy.service;

import java.util.List;

import com.joy.domain.BoardVO;
import com.joy.domain.Criteria;

public interface BoardService {
	public List<BoardVO> selectList(Criteria cri);
	public BoardVO selectDetail(int id);
	public void insert(BoardVO vo);
	public void updateHit(int id);
	public void delete(BoardVO vo);
	public void modify(BoardVO vo);
	public void recommend(int id);
	public Integer getTotal();
	
	public void updateRef(BoardVO vo);
	
	public List<BoardVO> selectReply(int parentNum);
	
	public void reply(BoardVO vo);
}
