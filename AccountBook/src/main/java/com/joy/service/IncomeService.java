package com.joy.service;

import java.util.Date;
import java.util.List;

import com.joy.domain.DateIncomeVO;

public interface IncomeService {
	public List<DateIncomeVO> getMonthlyIncomeList(String designer_id, Date date);
	public List<DateIncomeVO> getOldCus(String designer_id, Date date);
	public List<DateIncomeVO> getNewCus(String designer_id, Date date);
	public List<DateIncomeVO> getAnnualIncomeList(String designer_id, Date date);
	public List<DateIncomeVO> getMonthIncome(String designer_id, Date date);
	public List<DateIncomeVO> getAnnualIncome(String designer_id, Date date);
	public List<DateIncomeVO> getIncomeByReservationRoute(String designer_id, Date date);
}
