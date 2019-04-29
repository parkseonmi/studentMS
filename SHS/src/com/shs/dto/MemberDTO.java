package com.shs.dto;

import java.util.Date;

public class MemberDTO {
	private int sid;
	private String sname;
	private int sage;
	private String smajor;
	private String sphone;
	private Date redgate;
	
	public MemberDTO() {
		
	}
	
	public MemberDTO(String sname, int sage, String smajor, String sphone) {
		super();
		this.sname = sname;
		this.sage = sage;
		this.smajor = smajor;
		this.sphone = sphone;
	}
	
	

	public MemberDTO(int sid, String sname, int sage, String smajor, String sphone) {
		super();
		this.sid = sid;
		this.sname = sname;
		this.sage = sage;
		this.smajor = smajor;
		this.sphone = sphone;
	}

	public MemberDTO(int sid, String sname, int sage, String smajor, String sphone, Date redgate) {
		super();
		this.sid = sid;
		this.sname = sname;
		this.sage = sage;
		this.smajor = smajor;
		this.sphone = sphone;
		this.redgate = redgate;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public int getSage() {
		return sage;
	}

	public void setSage(int sage) {
		this.sage = sage;
	}

	public String getsmajor() {
		return smajor;
	}

	public void setsmajor(String smajor) {
		this.smajor = smajor;
	}

	public String getSphone() {
		return sphone;
	}

	public void setSphone(String sphone) {
		this.sphone = sphone;
	}

	public Date getRedgate() {
		return redgate;
	}

	public void setRedgate(Date redgate) {
		this.redgate = redgate;
	}

	@Override
	public String toString() {
		return "MemberDTO [sid=" + sid + ", sname=" + sname + ", sage=" + sage + ", smagor=" + smajor + ", sphone="
				+ sphone + ", redgate=" + redgate + "]";
	}
}
