package com.joy.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joy.domain.DateIncomeVO;
import com.joy.mapper.CustomerMapper;
import com.joy.mapper.IncomeMapper;
import com.joy.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class IncomeServiceImpl implements IncomeService{
	
	@Setter (onMethod_=@Autowired)
	private IncomeMapper mapper;

	@Override
	public List<DateIncomeVO> getMonthlyIncomeList(String designer_id, Date date) {
		SimpleDateFormat sdfm = new SimpleDateFormat("yyyy");
		String m_date = sdfm.format(date);
		List<DateIncomeVO> list = mapper.getMonthlyIncomeList(designer_id, m_date);
		return list;
	}
	@Override
	public List<DateIncomeVO> getNewCus(String designer_id, Date date) {
		SimpleDateFormat sdfm = new SimpleDateFormat("yyyy");
		String m_date = sdfm.format(date);
		List<DateIncomeVO> list = mapper.getNewCus(designer_id, m_date);
		return list;
	}
	@Override
	public List<DateIncomeVO> getOldCus(String designer_id, Date date) {
		SimpleDateFormat sdfm = new SimpleDateFormat("yyyy");
		String m_date = sdfm.format(date);
		List<DateIncomeVO> list = mapper.getOldCus(designer_id, m_date);
		return list;
	}

	@Override
	public List<DateIncomeVO> getAnnualIncomeList(String designer_id, Date date) {
		SimpleDateFormat sdfm = new SimpleDateFormat("yyyy");
		String m_date = sdfm.format(date);
		List<DateIncomeVO> list = mapper.getAnnualIncomeList(designer_id, m_date);
		return list;
	}

	@Override
	public List<DateIncomeVO> getMonthIncome(String designer_id, Date date) {
		SimpleDateFormat sdfm = new SimpleDateFormat("yyyy MM");
		String m_date = sdfm.format(date);
		List<DateIncomeVO> list = mapper.getMonthIncome(designer_id, m_date);
		return list;
	}

	@Override
	public List<DateIncomeVO> getAnnualIncome(String designer_id, Date date) {
		SimpleDateFormat sdfm = new SimpleDateFormat("yyyy");
		String m_date = sdfm.format(date);
		List<DateIncomeVO> list = mapper.getAnnualIncome(designer_id, m_date);
		return list;
	}

	@Override
	public List<DateIncomeVO> getIncomeByReservationRoute(String designer_id, Date date) {
		SimpleDateFormat sdfm = new SimpleDateFormat("yyyy MM");
		String m_date = sdfm.format(date);
		List<DateIncomeVO> list = mapper.getIncomeByReservationRoute(designer_id, m_date);
		return list;
	}
}
