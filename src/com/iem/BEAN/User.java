package com.iem.BEAN;

public class User {
	private String username;
    private String password,name,category;

   
    
    public User(String username, String password, String name, String category) {
		super();
		this.username = username;
		this.password = password;
		this.name = name;
		this.category = category;
	}

	public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
    

}
