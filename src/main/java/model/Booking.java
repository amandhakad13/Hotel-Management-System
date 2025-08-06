package model;

import java.sql.Date;

public class Booking {
	private int id;
	private String fname;
	private String lname;
	private String cnid;
	private int mobile;
	private int gender;
	private Date checkin;
	
	public Booking() {
		
	}

	public Booking(int id, String fname, String lname, String cnid, int mobile, int gender, Date checkin) {
		super();
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.cnid = cnid;
		this.mobile = mobile;
		this.gender = gender;
		this.checkin = checkin;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getCnid() {
		return cnid;
	}

	public void setCnid(String cnid) {
		this.cnid = cnid;
	}

	public int getMobile() {
		return mobile;
	}

	public void setMobile(int mobile) {
		this.mobile = mobile;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public Date getCheckin() {
		return checkin;
	}

	public void setCheckin(Date checkin) {
		this.checkin = checkin;
	}

	@Override
	public String toString() {
		return "Booking [id="+"fname=" + fname + ", lname=" + lname + ", cnid=" + cnid + ", mobile=" + mobile + ", gender="
				+ gender + ", checkin=" + checkin + "]";
	}
}
