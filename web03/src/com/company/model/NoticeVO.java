package com.company.model;

import java.util.Date;

public class NoticeVO {
	private int idx;
	private String n_id;
	private String title;
	private String content;
	private Date con_date;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getN_id() {
		return n_id;
	}
	public void setN_id(String n_id) {
		this.n_id = n_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCon_date() {
		return con_date;
	}
	public void setCon_date(Date con_date) {
		this.con_date = con_date;
	}
}