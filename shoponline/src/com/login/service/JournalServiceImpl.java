package com.login.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.login.dao.JournalDaoImpl;


@Service
@Transactional(readOnly=true)
public class JournalServiceImpl {
	@Resource
	private JournalDaoImpl journalDaoImpl;
	
	public void insert(int id,String name,String time) {
		this.journalDaoImpl.insertJournal(id, name, time);
	}
	public List<String> userName(int id){
		return this.journalDaoImpl.usrName(id);
	}
}
