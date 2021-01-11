package com.joy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.joy.domain.BoardVO;
import com.joy.domain.Criteria;

public interface BoardMapper {
	public List<BoardVO> selectList(Criteria cri);
	public BoardVO selectDetail(@Param("id") int id);
	public void insert(BoardVO vo);
	public void updateHit(@Param("id") int id);
	public int delete(BoardVO vo);
	public void modify(BoardVO vo);
	public void recommend(int id);
	public int reply(BoardVO vo);
	public List<BoardVO> selectReply(int ref);
	public Integer getTotal();
	
	public void updateRef(BoardVO vo);
	
	public Integer getMaxRef();
//	public BoardVO getParentInfo(int id);
//	public Integer getRefOrder(BoardVO vo);
	public void updateAnswerNum(int id);
	
	public Integer getRef(int id);
	
}
