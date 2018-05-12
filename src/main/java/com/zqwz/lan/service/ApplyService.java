package com.zqwz.lan.service;

import com.zqwz.lan.entity.ApplyDevice;
import com.zqwz.lan.entity.ApplyLab;
import com.zqwz.lan.entity.DateCount;

import java.util.List;


public interface ApplyService {
	public void submitApplyLab(ApplyLab applyLab);

	public void submitApplyDevice(ApplyDevice applyDevice);

	public List<ApplyLab> findAllApplyLabByID(String apply_id);

	public void passApplyLab(int apply_id, String deal_man);

	public void notPassApplyLab(int apply_id, String deal_man);

	public List<ApplyDevice> findAllApplyDeviceByID(String apply_id);

	public void passApplyDevice(int apply_id, String deal_man);

	public void notPassApplyDevice(int apply_id, String deal_man);

	public int labCount();

	public int deviceCount();

    public List<DateCount> labDateCount();

	public List<DateCount> deviceDateCount();
}
