package com.joy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.joy.domain.Criteria;
import com.joy.domain.CustomerVO;
import com.joy.domain.DateIncomeVO;

public interface CustomerMapper {
	public void registerCustomer(CustomerVO customer);
	public List<CustomerVO> getAllCustomerWithId(String userId);
	public List<CustomerVO> selectAll();
	public void modifyCustomer(CustomerVO customer);
	public void removeCustomer(CustomerVO customer);
	
	public Integer getTotalCount(Criteria cri);
	public List<CustomerVO> getAllCustomerWithPaging(Criteria cri);
	
	public CustomerVO getDetail(int cus_no);
}
