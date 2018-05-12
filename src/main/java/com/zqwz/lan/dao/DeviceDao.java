package com.zqwz.lan.dao;


import com.zqwz.lan.entity.Device;

import java.util.List;

public interface DeviceDao {

	public List<com.zqwz.lan.entity.Device> findAllDevice();

	public List<com.zqwz.lan.entity.Device> findDeviceByName(String devicename);

	public void addDevice(Device device);

	public void deleteDevice(int device_id);

	public void updateDevice(Device device);

	public Device findDeviceByID(int device_id);
}
