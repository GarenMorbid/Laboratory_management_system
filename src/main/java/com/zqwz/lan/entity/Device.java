package com.zqwz.lan.entity;

import java.util.Date;

public class Device {
    private int device_id;

    private String device_name;

    private Date device_time;

    private String device_state;

    public int getDevice_id() {
        return device_id;
    }

    public void setDevice_id(int device_id) {
        this.device_id = device_id;
    }

    public String getDevice_name() {
        return device_name;
    }

    public void setDevice_name(String device_name) {
        this.device_name = device_name;
    }

    public Date getDevice_time() {
        return device_time;
    }

    public void setDevice_time(Date device_time) {
        this.device_time = device_time;
    }

    public String getDevice_state() {
        return device_state;
    }

    public void setDevice_state(String device_state) {
        this.device_state = device_state;
    }

    public Device(int device_id, String device_name, Date device_time, String device_state) {
        this.device_id = device_id;
        this.device_name = device_name;
        this.device_time = device_time;
        this.device_state = device_state;
    }

    public Device() {
		super();
		// TODO Auto-generated constructor stub
	}
    
}