package com.joy.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	
	/*
	 * 클라이언트에서 값을 받아와서 페이징, 검색처리 하는 클래스 이다. 
	 * */
	
	private int pageNum;
	private int amount;
	private int limitStart;
	
	private String designer_id;
	
	private String type;
	private String keyword;

	public Criteria() {
		this(1,12);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	//mapper에서 <foreach item='type' collection="typeArr">에 사용하기 위해 getter를 만들어 준 것이다.
	public String[] getTypeArr() {
		return type == null? new String[] {} : type.split("");
	}
}
