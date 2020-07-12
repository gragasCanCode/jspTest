package com.servlet.dto;

public class BookDTO {
	private int bookId;
	private String bookName;
	private int bookCost;
	
	
	public BookDTO(int bookId, String bookName, int bookCost) {
		super();
		this.bookId = bookId;
		this.bookName = bookName;
		this.bookCost = bookCost;
	}
	
	public int getBookId() {
		return bookId;
	}
	
	public String getBookName() {
		return bookName;
	}
	
	public int getBookCost() {
		return bookCost;
	}
	
	
	@Override
	public String toString() {
		return "å id : "+bookId+", å�̸� : "+bookName+", å ���� : "+bookCost+"��";
	}
}
