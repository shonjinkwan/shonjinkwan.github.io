package com.company.model;

import java.util.Date;

public class MemberVO {
	private String userid;
	private String passwd;
	private int birth;
	private Date regdate;		//util.Date import 요망
	private String name;
	private int point;
	private int visited;
	private String yesno;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public int getBirth() {
		return birth;
	}
	public void setBirth(int birth) {
		this.birth = birth;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getVisited() {
		return visited;
	}
	public void setVisited(int visited) {
		this.visited = visited;
	}
	public String getYesno() {
		return yesno;
	}
	public void setYesno(String yesno) {
		this.yesno = yesno;
	}
	
}
