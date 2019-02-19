package com.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="bookcar")
public class Bookcar {
	private int car_id;
	private int car_book_id;
	private String book_name;
	private String book_img;
	private int book_price;
	private int book_count;
	private int cart_user_id;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getCar_id() {
		return car_id;
	}
	public void setCar_id(int car_id) {
		this.car_id = car_id;
	}
	public int getCar_book_id() {
		return car_book_id;
	}
	public void setCar_book_id(int car_book_id) {
		this.car_book_id = car_book_id;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getBook_img() {
		return book_img;
	}
	public void setBook_img(String book_img) {
		this.book_img = book_img;
	}
	public int getBook_price() {
		return book_price;
	}
	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}
	public int getBook_count() {
		return book_count;
	}
	public void setBook_count(int book_count) {
		this.book_count = book_count;
	}
	public int getCart_user_id() {
		return cart_user_id;
	}
	public void setCart_user_id(int cart_user_id) {
		this.cart_user_id = cart_user_id;
	}
	
	

}
