package com.iem.BEAN;

public class HouseOwner extends User{
    private String contact_no;

    public HouseOwner(String contact_no, String username, String password) {
        super(username, password);
        this.contact_no = contact_no;
    }

    public String getContact_no() {
        return contact_no;
    }

    public void setContact_no(String contact_no) {
        this.contact_no = contact_no;
    }
}
