package com.zqwz.lan.entity;

public class DeviceLab {
    private int devicelab_id;

    private int lab_id;

    private int device_id;

    public int getDevicelab_id() {
        return devicelab_id;
    }

    public void setDevicelab_id(int devicelab_id) {
        this.devicelab_id = devicelab_id;
    }

    public int getLab_id() {
        return lab_id;
    }

    public void setLab_id(int lab_id) {
        this.lab_id = lab_id;
    }

    public int getDevice_id() {
        return device_id;
    }

    public void setDevice_id(int device_id) {
        this.device_id = device_id;
    }

    public DeviceLab(int devicelab_id, int lab_id, int device_id) {
        this.devicelab_id = devicelab_id;
        this.lab_id = lab_id;
        this.device_id = device_id;
    }

    public DeviceLab() {
		super();
		// TODO Auto-generated constructor stub
	}
    
}