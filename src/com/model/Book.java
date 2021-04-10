package com.model;

public class Book {
	private int id;
	private String name;
	private String publisher;
	private int price;
	
	
	public Book(int id, String name, String publisher, int price) {
		this.id = id;
		this.name = name;
		this.publisher = publisher;
		this.price = price;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
