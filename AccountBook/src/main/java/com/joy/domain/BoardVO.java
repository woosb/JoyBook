package com.joy.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int id;
	private String userId;
	private String title;
	private String thumbnail;
	private String cardText;
	private String content;
	private Date regDate;
	private Date updateDate;
	private int hit;
	private int recommend;
	
	private int ref;
	private int refOrder;
	private int step;
	private int answerNum;
	private int parentNum;
}
