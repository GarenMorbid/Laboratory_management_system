package com.zqwz.lan.entity;

public class User {
    private int user_id;

    private String user_account;

    private String user_name;

    private String user_pwd;

    private String user_type;

    private String user_tel;

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser_account() {
        return user_account;
    }

    public void setUser_account(String user_account) {
        this.user_account = user_account;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_pwd() {
        return user_pwd;
    }

    public void setUser_pwd(String user_pwd) {
        this.user_pwd = user_pwd;
    }

    public String getUser_type() {
        return user_type;
    }

    public void setUser_type(String user_type) {
        this.user_type = user_type;
    }

    public String getUser_tel() {
        return user_tel;
    }

    public void setUser_tel(String user_tel) {
        this.user_tel = user_tel;
    }

    public User(int user_id, String user_account, String user_name, String user_pwd, String user_type, String user_tel) {
        this.user_id = user_id;
        this.user_account = user_account;
        this.user_name = user_name;
        this.user_pwd = user_pwd;
        this.user_type = user_type;
        this.user_tel = user_tel;
    }

    public User() {
		super();
		// TODO Auto-generated constructor stub
	}
}