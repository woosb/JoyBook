package com.joy.service;

import java.security.Principal;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.joy.domain.Criteria;
import com.joy.domain.CustomerVO;
import com.joy.domain.MemberVO;

public interface CustomerService {
	public void registerCustomer(CustomerVO customer);
	
	public List<CustomerVO> getAllCustomerWithId(String userId);
	public List<CustomerVO> getAllCustomerWithPaging(Criteria cri);
	public Integer getTotal(Criteria cri);
	
	public List<CustomerVO> selectAll();
	public void modifyCustomer(CustomerVO customer);
	public void removeCustomer(CustomerVO customer);
}
