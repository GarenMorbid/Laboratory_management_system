package com.zqwz.lan.service.impl;

import com.zqwz.lan.dao.DeviceDao;
import com.zqwz.lan.entity.Device;
import com.zqwz.lan.service.DeviceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service("deviceService")
public class DeviceServiceImpl implements DeviceService {
    @Resource
    private DeviceDao deviceDao;

	public DeviceDao getDeviceDao() {
		return deviceDao;
	}

	public void setDeviceDao(DeviceDao deviceDao) {
		this.deviceDao = deviceDao;
	}

	@Override
	public List<Device> findAllDevice() {
		return deviceDao.findAllDevice();
	}

	@Override
	public List<Device> findDeviceByName(String devicename) {
		return deviceDao.findDeviceByName(devicename);
	}

	@Override
	public void addDevice(Device device) {
		device.setDevice_time(new Date());
		deviceDao.addDevice(device);
	}

	@Override
	public void deleteDevice(int device_id) {
		deviceDao.deleteDevice(device_id);
	}

	@Override
	public void updateDevice(Device device) {
		deviceDao.updateDevice(device);
	}

	@Override
	public Device findDeviceByID(int device_id) {
		return deviceDao.findDeviceByID(device_id);
	}
}
