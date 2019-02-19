package com.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="book")
public class Book {
	private int book_id;
	private String book_name;
	private String book_auther;
	private String book_publisher;
	private String book_publish_date;
	private int book_price;
	private String book_img;
	private Booktype booktype;
	private Images images;
	
	@Id
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getBook_auther() {
		return book_auther;
	}
	public void setBook_auther(String book_auther) {
		this.book_auther = book_auther;
	}
	public String getBook_publisher() {
		return book_publisher;
	}
	public void setBook_publisher(String book_publisher) {
		this.book_publisher = book_publisher;
	}
	public String getBook_publish_date() {
		return book_publish_date;
	}
	public void setBook_publish_date(String book_publish_date) {
		this.book_publish_date = book_publish_date;
	}
	public int getBook_price() {
		return book_price;
	}
	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}
	public String getBook_img() {
		return book_img;
	}
	public void setBook_img(String book_img) {
		this.book_img = book_img;
	}
	@ManyToOne
	@JoinColumn(name="book_type_id")
	public Booktype getBooktype() {
		return booktype;
	}
	public void setBooktype(Booktype booktype) {
		this.booktype = booktype;
	}
	
	@ManyToOne
	@JoinColumn(name="book_img_id")
	public Images getImages() {
		return images;
	}
	public void setImages(Images images) {
		this.images = images;
	}
	
}
