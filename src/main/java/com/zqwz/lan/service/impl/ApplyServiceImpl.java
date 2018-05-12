package com.zqwz.lan.service.impl;


import com.zqwz.lan.dao.ApplyDao;
import com.zqwz.lan.entity.ApplyDevice;
import com.zqwz.lan.entity.ApplyLab;
import com.zqwz.lan.entity.DateCount;
import com.zqwz.lan.service.ApplyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service("applyService")
public class ApplyServiceImpl implements ApplyService {
    @Resource
    private ApplyDao applyDao;

	public ApplyDao getApplyDao() {
		return applyDao;
	}

	public void setApplyDao(ApplyDao applyDao) {
		this.applyDao = applyDao;
	}

	private SimpleDateFormat dft = new SimpleDateFormat("yyyy-MM-dd");

	@Override
	public void submitApplyLab(ApplyLab applyLab) {
		applyLab.setApply_state("未通过");
		applyLab.setApply_time(new Date());
		applyDao.submitApplyLab(applyLab);
	}

	@Override
	public void submitApplyDevice(ApplyDevice applyDevice) {
		applyDevice.setApply_state("未通过");
		applyDevice.setApply_time(new Date());
		applyDao.submitApplyDevice(applyDevice);
	}

	@Override
	public List<ApplyLab> findAllApplyLabByID(String apply_id) {
		return applyDao.findAllApplyLabByID(apply_id);
	}

	@Override
	public void passApplyLab(int apply_id,String deal_man) {
		applyDao.passApplyLab(apply_id, deal_man);
	}

	@Override
	public void notPassApplyLab(int apply_id, String deal_man) {
		applyDao.notPassApplyLab(apply_id, deal_man);
	}

	@Override
	public List<ApplyDevice> findAllApplyDeviceByID(String apply_id) {
		return applyDao.findAllApplyDeviceByID(apply_id);
	}

	@Override
	public void passApplyDevice(int apply_id, String deal_man) {
		applyDao.passApplyDevice(apply_id, deal_man);
	}

	@Override
	public void notPassApplyDevice(int apply_id, String deal_man) {
		applyDao.notPassApplyDevice(apply_id, deal_man);
	}

	@Override
	public int labCount() {
		return applyDao.labCount();
	}

	@Override
	public int deviceCount() {
		return applyDao.deviceCount();
	}

	@Override
	public List<DateCount> labDateCount() {
		String dates = "";
		List<DateCount> dateCounts = new ArrayList<DateCount>();
		Date nowDate = new Date();
		Calendar date = Calendar.getInstance();
		for(int i = 0;i<7;i++){
			dates = dft.format(nowDate).toString();
			DateCount dateCount = new DateCount(dates,applyDao.labDateCount(dates));
			dateCounts.add(dateCount);

			date.set(Calendar.DATE, date.get(Calendar.DATE) - 1);
			nowDate = date.getTime();
		}
		return dateCounts;
	}

	@Override
	public List<DateCount> deviceDateCount() {
		String dates = "";
		List<DateCount> dateCounts = new ArrayList<DateCount>();
		Date nowDate = new Date();
		Calendar date = Calendar.getInstance();
		for(int i = 0;i<7;i++){
			dates = dft.format(nowDate).toString();
			DateCount dateCount = new DateCount(dates,applyDao.deviceDateCount(dates));
			dateCounts.add(dateCount);

			date.set(Calendar.DATE, date.get(Calendar.DATE) - 1);
			nowDate = date.getTime();
		}
		return dateCounts;
	}
}
