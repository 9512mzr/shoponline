package com.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import org.hibernate.annotations.Parameter;

//import com.sun.istack.internal.NotNull;

import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name="users")
public class Users implements Serializable{
	private int id;
//	@NotNull
	private String user_name;
	private String user_email;
	private String user_telephone;
	private String user_address;
	private String user_posttime;
	private Login login;
	
	@Id
	@GenericGenerator(name="loginid", strategy="assigned")
	@GeneratedValue(generator="loginid")
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_telephone() {
		return user_telephone;
	}
	public void setUser_telephone(String user_telephone) {
		this.user_telephone = user_telephone;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getUser_posttime() {
		return user_posttime;
	}
	public void setUser_posttime(String user_posttime) {
		this.user_posttime = user_posttime;
	}
	@OneToOne(cascade=CascadeType.ALL)
	@PrimaryKeyJoinColumn(name="user_id") 
	public Login getLogin() {
		return login;
	}
	public void setLogin(Login login) {
		this.login = login;
	}
}
