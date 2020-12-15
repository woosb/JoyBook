package com.joy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.joy.domain.BoardVO;
import com.joy.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@org.springframework.web.bind.annotation.RestController
@Log4j
public class RestController {
	
	@Setter(onMethod_ = @Autowired)
	BoardService service;
	
	@GetMapping(value="/getReply/{id}")
	public ResponseEntity<List<BoardVO>> getList(@PathVariable("id") String id){
		List<BoardVO> reply = service.selectReply(Integer.parseInt(id));
		log.info("getList..................");
		return new ResponseEntity<>(reply, HttpStatus.OK);
	}
	
	@PostMapping(value="/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody BoardVO vo){
		log.info(vo);
		int result = service.reply(vo);
		return result == 1 ? 
				new ResponseEntity<>("success", HttpStatus.OK) :
				new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
