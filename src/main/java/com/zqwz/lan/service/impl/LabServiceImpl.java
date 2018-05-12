package com.zqwz.lan.service.impl;


import com.zqwz.lan.dao.LabDao;
import com.zqwz.lan.entity.Lab;
import com.zqwz.lan.service.LabService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("labService")
public class LabServiceImpl implements LabService {
    @Resource
    private LabDao labDao;

	public LabDao getLabDao() {
		return labDao;
	}

	public void setLabDao(LabDao labDao) {
		this.labDao = labDao;
	}

	@Override
	public List<Lab> findAllLab() {
		return labDao.findAllLab();
	}

	@Override
	public List<Lab> findLabByName(String lab_id) {
		return labDao.findLabByName(lab_id);
	}

	@Override
	public void addLab(Lab lab) {
		labDao.addLab(lab);
	}

	@Override
	public void deleteLab(int lab_id) {
		labDao.deleteLab(lab_id);
	}

	@Override
	public void updateLab(Lab lab) {
		labDao.updateLab(lab);
	}

	@Override
	public Lab findLabByID(int lab_id) {
		return labDao.findLabByID(lab_id);
	}
}
