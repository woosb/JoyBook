package com.joy.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
	public void updateHit(int id) {
		mapper.updateHit(id);
	}

	@Override
	public void delete(BoardVO vo) {
		log.info(vo.toString());
		mapper.delete(vo);
	}

	@Override
	public void modify(BoardVO vo) {
		Date date = new Date();
		vo.setUpdateDate(date);
		mapper.modify(vo);
	}
	
	@Override
	public void recommend(int id) {
		mapper.recommend(id);
	}
	
	@Override
	public void reply(BoardVO vo) {
		updateAnswerNum(vo.getId());
		log.info(vo);
//		int MaxRefOrder = getMaxRefOrder(vo);
		updateRef(vo);
		vo.setRefOrder(vo.getRefOrder()+1);
		vo.setStep(vo.getStep()+1);
		vo.setParentNum(vo.getId());
		vo.setRegDate(new Date());
		mapper.reply(vo);
	}
	
	public void updateAnswerNum(int id) {
		mapper.updateAnswerNum(id);
	}

	@Override
	public List<BoardVO> selectReply(int ref) {
		return mapper.selectReply(ref);
	}

	@Override
	public Integer getTotal() {
		return mapper.getTotal();
	}
	
	@Override
	public void updateRef(BoardVO vo) {
		log.info(vo.getRef());
		log.info(vo.getRefOrder());
		mapper.updateRef(vo);
	}
}
