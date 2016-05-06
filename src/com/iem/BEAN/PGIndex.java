package com.iem.BEAN;
/*
 * Author: Shamik Kundu
 * Description: this is a model class providing attributes corresponding to a particular database and also
 * sql queries to peroform database actions. 
 */
public class PGIndex {
private int pgid;
private String address;

public PGIndex(int pgid, String address) {
	super();
	this.pgid = pgid;
	this.address = address;
}
public int getPgid() {
	return pgid;
}
public void setPgid(int pgid) {
	this.pgid = pgid;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}

}
