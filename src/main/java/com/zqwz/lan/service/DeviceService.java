package com.zqwz.lan.service;

import com.zqwz.lan.entity.Device;

import java.util.List;

public interface DeviceService {

	public List<Device> findAllDevice();

	public List<Device> findDeviceByName(String devicename);

	public void addDevice(Device device);

	public void deleteDevice(int device_id);

	public void updateDevice(Device device);

	public Device findDeviceByID(int device_id);

}
