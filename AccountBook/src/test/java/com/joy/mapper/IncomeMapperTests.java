package com.joy.mapper;

import java.util.Date;
import java.util.List;

import org.junit.Test;	
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.joy.domain.DateIncomeVO;
import com.joy.domain.MemberVO;
import com.joy.service.IncomeService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import sun.java2d.pipe.SpanShapeRenderer.Simple;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class IncomeMapperTests {
	
	@Setter(onMethod_ = {@Autowired})
	private IncomeMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private IncomeService service;

	@Test
	public void getMonthIncome() {
		log.info("getMonthIncome");
		String designer_id = "woosb0115@naver.com";
//		String date = "2020 11";
//		List<DateIncomeVO> income = mapper.getMonthIncome(designer_id, date);
		Date date = new Date();
		List<DateIncomeVO> income = service.getMonthIncome(designer_id, date);
		for(DateIncomeVO vo : income) {
			log.info(vo);
		}
	}

	@Test
	public void getAnnualIncome() {
		log.info("getAnnualIncome");
		String designer_id = "woosb0115@naver.com";
//		String date = "2020";
//		List<DateIncomeVO> income = 	mapper.getAnnualIncome(designer_id, date);
		Date date = new Date();
		List<DateIncomeVO> income = service.getAnnualIncome(designer_id, date);
		for(DateIncomeVO vo : income) {
			log.info(vo);
		}
	}
	
	@Test
	public void getMonthlyIncomeList() {
		log.info("getMonthlyIncomeList");
		String designer_id = "woosb0115@naver.com";
//		String date = "2020";
//		List<DateIncomeVO> income = mapper.getMonthlyIncomeList(designer_id, date);
		Date date = new Date();
		List<DateIncomeVO> income = service.getMonthlyIncomeList(designer_id, date);
		for(DateIncomeVO vo : income) {
			log.info(vo);
		}
	}
	
	@Test
	public void getAnnualIncomeList() {
		log.info("getAnnualIncomeList");
		String designer_id = "woosb0115@naver.com";
//		String date = "2020";
//		List<DateIncomeVO> income = mapper.getAnnualIncomeList(designer_id, date);
		Date date = new Date();
		List<DateIncomeVO> income = service.getAnnualIncomeList(designer_id, date);
		for(DateIncomeVO vo : income) {
			log.info(vo);
		}
	}
	
	@Test
	public void getIncomeByReservationRoute() {
		log.info("getIncomeByReservationRoute");
		String designer_id = "woosb0115@naver.com";
//		String date = "2020 11";
//		List<DateIncomeVO> income = mapper.getIncomeByReservationRoute(designer_id, date);
		Date date = new Date();
		List<DateIncomeVO> income = service.getIncomeByReservationRoute(designer_id, date);
		for(DateIncomeVO vo : income) {
			log.info(vo);
		}
	}
}