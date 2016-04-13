package com.iem.BEAN;

public class Student extends User{
    
   private String gender;
   private String dob;
   private String college;
   private String address;
   private String contact_no;

    public Student(String gender, String dob, String college, String address, String contact_no, String username, String password) {
        super(username, password);
        this.gender = gender;
        this.dob = dob;
        this.college = college;
        this.address = address;
        this.contact_no = contact_no;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContact_no() {
        return contact_no;
    }

    public void setContact_no(String contact_no) {
        this.contact_no = contact_no;
    }
   
}
