package com.joy.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.joy.domain.BoardVO;
import com.joy.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = 
{"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class BoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	BoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	BoardService service;
	
	@Test
	public void register()throws Exception{
		BoardVO vo = new BoardVO();
		vo.setTitle("제목");
		vo.setContent("내용");
		service.insert(vo);
	}
}
