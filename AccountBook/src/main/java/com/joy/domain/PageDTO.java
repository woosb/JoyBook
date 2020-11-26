package com.joy.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Criteria cri;
	
	/*
	 * pageNum을 cri에서 받아와서 첫번째 페이지와 마지막 페이지를 만들어 준다.
	 * pageNum 이 3이면 3/10.0 = 0.3 -> ceil(0.3) = 1 -> 1*10 = endPage = 10
	 * startPage = endPage -9 = 1
	 * 하지만 전체 게시글 수 (ex total = 32)
	 * ((total * 1.0)/10) = 3.2
	 * ceil(3.2) = 4
	 * endPage는 10이 아니라 4가 된다.
	 * 
	 */
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10; 
		this.startPage = this.endPage-9;
		int realEnd = (int)(Math.ceil((total*1.0)/cri.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
