package com.zqwz.lan.service.impl;

import com.zqwz.lan.dao.DeviceLabDao;
import com.zqwz.lan.service.DeviceLabService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("deviceLabService")
public class DeviceLabServiceImpl implements DeviceLabService {
    @Resource
    private DeviceLabDao deviceLabDao;

	public DeviceLabDao getDeviceLabDao() {
		return deviceLabDao;
	}

	public void setDeviceLabDao(DeviceLabDao deviceLabDao) {
		this.deviceLabDao = deviceLabDao;
	}
    
}
