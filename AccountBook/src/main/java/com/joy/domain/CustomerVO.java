package com.joy.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CustomerVO {
	private int cus_no;
	private String designer_id;
	private String visitType;
	private String content;
	private String sex;
	private Date date;
	private int price;
	private String reservationRoute;
	private int ticket;
}
