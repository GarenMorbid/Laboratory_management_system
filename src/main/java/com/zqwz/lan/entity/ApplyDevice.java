package com.zqwz.lan.entity;

import java.util.Date;

public class ApplyDevice {
    private int apply_id;

    private String apply_content;

    private int device_id;

    private int user_id;

    private String apply_state;

    private String deal_man;
    
    private Date apply_time;

	public int getApply_id() {
		return apply_id;
	}

	public void setApply_id(int apply_id) {
		this.apply_id = apply_id;
	}

	public String getApply_content() {
		return apply_content;
	}

	public void setApply_content(String apply_content) {
		this.apply_content = apply_content;
	}

	public int getDevice_id() {
		return device_id;
	}

	public void setDevice_id(int device_id) {
		this.device_id = device_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getApply_state() {
		return apply_state;
	}

	public void setApply_state(String apply_state) {
		this.apply_state = apply_state;
	}

	public String getDeal_man() {
		return deal_man;
	}

	public void setDeal_man(String deal_man) {
		this.deal_man = deal_man;
	}

	public Date getApply_time() {
		return apply_time;
	}

	public void setApply_time(Date apply_time) {
		this.apply_time = apply_time;
	}

	public ApplyDevice(int apply_id, String apply_content, int device_id, int user_id, String apply_state, String deal_man,
			Date apply_time) {
		super();
		this.apply_id = apply_id;
		this.apply_content = apply_content;
		this.device_id = device_id;
		this.user_id = user_id;
		this.apply_state = apply_state;
		this.deal_man = deal_man;
		this.apply_time = apply_time;
	}

	public ApplyDevice() {
		super();
	}
}
