package com.joy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.joy.domain.DateIncomeVO;

public interface IncomeMapper {
	public List<DateIncomeVO> getMonthlyIncomeList(@Param("designer_id") String designer_id, @Param("date") String date);
	public List<DateIncomeVO> getAnnualIncomeList(@Param("designer_id") String designer_id, @Param("date") String date);
	public List<DateIncomeVO> getMonthIncome(@Param("designer_id") String designer_id, @Param("date") String date);
	public List<DateIncomeVO> getAnnualIncome(@Param("designer_id") String designer_id, @Param("date") String date);
	public  List<DateIncomeVO> getIncomeByReservationRoute(@Param("designer_id") String designer_id, @Param("date") String date);
}
