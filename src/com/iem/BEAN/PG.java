package com.iem.BEAN;

public class PG {
private int PGID;
private String OwnerUnm;
private String PG_FOR;
private String AddressLine;
private String City;
private String Pincode;
private String WiFi;
private String AC;
private String FOOD;
private String TV;
private String b1;
private String p1;
private String b2;
private String p2;
private String b3;
private String p3;
private String lat;
private String lon;


public PG(int pGID, String ownerUnm, String pG_FOR, String addressLine,
		String city, String pincode, String wiFi, String aC, String fOOD,
		String tV, String b1, String p1, String b2, String p2, String b3,
		String p3, String lat, String lon) {
	super();
	PGID = pGID;
	OwnerUnm = ownerUnm;
	PG_FOR = pG_FOR;
	AddressLine = addressLine;
	City = city;
	Pincode = pincode;
	WiFi = wiFi;
	AC = aC;
	FOOD = fOOD;
	TV = tV;
	this.b1 = b1;
	this.p1 = p1;
	this.b2 = b2;
	this.p2 = p2;
	this.b3 = b3;
	this.p3 = p3;
	this.lat = lat;
	this.lon = lon;
}
public String getLat() {
	return lat;
}
public void setLat(String lat) {
	this.lat = lat;
}
public String getLon() {
	return lon;
}
public void setLon(String lon) {
	this.lon = lon;
}
public int getPGID() {
	return PGID;
}
public void setPGID(int pGID) {
	PGID = pGID;
}
public String getOwnerUnm() {
	return OwnerUnm;
}
public void setOwnerUnm(String ownerUnm) {
	OwnerUnm = ownerUnm;
}
public String getPG_FOR() {
	return PG_FOR;
}
public void setPG_FOR(String pG_FOR) {
	PG_FOR = pG_FOR;
}
public String getAddressLine() {
	return AddressLine;
}
public void setAddressLine(String addressLine) {
	AddressLine = addressLine;
}
public String getCity() {
	return City;
}
public void setCity(String city) {
	City = city;
}
public String getPincode() {
	return Pincode;
}
public void setPincode(String pincode) {
	Pincode = pincode;
}
public String getWiFi() {
	return WiFi;
}
public void setWiFi(String wiFi) {
	WiFi = wiFi;
}
public String getAC() {
	return AC;
}
public void setAC(String aC) {
	AC = aC;
}
public String getFOOD() {
	return FOOD;
}
public void setFOOD(String fOOD) {
	FOOD = fOOD;
}
public String getTV() {
	return TV;
}
public void setTV(String tV) {
	TV = tV;
}
public String getB1() {
	return b1;
}
public void setB1(String b1) {
	this.b1 = b1;
}
public String getP1() {
	return p1;
}
public void setP1(String p1) {
	this.p1 = p1;
}
public String getB2() {
	return b2;
}
public void setB2(String b2) {
	this.b2 = b2;
}
public String getP2() {
	return p2;
}
public void setP2(String p2) {
	this.p2 = p2;
}
public String getB3() {
	return b3;
}
public void setB3(String b3) {
	this.b3 = b3;
}
public String getP3() {
	return p3;
}
public void setP3(String p3) {
	this.p3 = p3;
}


}