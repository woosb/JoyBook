package com.joy.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joy.domain.Criteria;
import com.joy.domain.CustomerVO;
import com.joy.domain.MemberVO;
import com.joy.mapper.CustomerMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CustomerServiceImpl implements CustomerService {

	@Setter(onMethod_=@Autowired)
	private CustomerMapper mapper;
	
	@Override
	public void registerCustomer(CustomerVO customer) {
		log.info("register........." + customer);
		Date date = new Date();
		customer.setDate(date);
		mapper.registerCustomer(customer);
	}

	
	@Override
	public List<CustomerVO> selectAll() {
		// TODO Auto-generated method stub
		log.info("selectAll .... ");
		List<CustomerVO> list= mapper.selectAll();
		for(CustomerVO vo : list) {
			log.info(vo);
		}
		return list;
	}

	@Override
	public void modifyCustomer(CustomerVO customer) {
		log.info("modifyCUstomer ......"  + customer);
		mapper.modifyCustomer(customer);
	}

	@Override
	public void removeCustomer(CustomerVO customer) {
		log.info("removeCustomer ..... " + customer);
		mapper.removeCustomer(customer);
	} 
	
	@Override
	public List<CustomerVO> getAllCustomerWithId(String userId) {
		log.info("getAllCustomerWithId .... " + userId);
		List<CustomerVO> list= mapper.getAllCustomerWithId(userId);
		for(CustomerVO vo : list) {
			log.info(vo);
		}
		return list;
	}

	@Override
	public List<CustomerVO> getAllCustomerWithPaging(Criteria cri) {
		log.info("getAllCustomerWith paging .... " + cri.getDesigner_id());
		cri.setLimitStart((cri.getPageNum()-1)*10);
		List<CustomerVO> list= mapper.getAllCustomerWithPaging(cri);
		for(CustomerVO vo : list) {
			log.info(vo);
		}
		return list;
	}


	@Override
	public Integer getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);		
	}
}
