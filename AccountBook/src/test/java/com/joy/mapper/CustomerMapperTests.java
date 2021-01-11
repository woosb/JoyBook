package com.joy.mapper;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.SimpleFormatter;

import org.junit.Test;	
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.joy.domain.CustomerVO;
import com.joy.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class CustomerMapperTests {
	
	@Autowired
	private CustomerMapper mapper;
	
	@Test
	public void register() throws Exception{
		for(int j = 0; j < 10; j ++) {
			for(int i = 1; i < 13; i ++) {
				CustomerVO customer = new CustomerVO();
//		SimpleDateFormat simpl = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//		Date date1 = new Date();
//		simpl.format(date1);
				int year = 2025;
				Calendar cal = Calendar.getInstance();
				cal.set(year-j, i, (int)(Math.random()*12+1));
//		Date date = new Date();
//		customer.setDate(date);
				Date date = cal.getTime();
				String visitType = "재방문";
				String content = "커트";
				String sex = "여자";
				int randNum = (int)(Math.random()*10+1);
				int price = 100000 * randNum;
				String ReservationRoute = "카카오";
				int ticket = 1;
				customer.setDate(date);
				customer.setDesigner_id("f@f");
				customer.setVisitType(visitType);
				customer.setContent(content);
				customer.setSex(sex);
				customer.setDate(date);
				customer.setPrice(price);
				customer.setReservationRoute(ReservationRoute);
				customer.setTicket(ticket);
				log.info(customer);
				mapper.registerCustomer(customer);
			}
		}
	}
	
//	@Test
//	public void getAllCustomerWithId() throws Exception{
//		String userId = "f@f";
//		List<CustomerVO> arr = mapper.getAllCustomerWithId(userId);
//		for(CustomerVO vo : arr) {
//			log.info(vo);
//		}
//	}
}
