package com.zqwz.lan.service;

import com.zqwz.lan.entity.Lab;

import java.util.List;

public interface LabService {
	public List<Lab> findAllLab();

	public List<Lab> findLabByName(String lab_id);

	public void addLab(Lab lab);

	public void deleteLab(int lab_id);

	public void updateLab(Lab lab);

	public Lab findLabByID(int lab_id);
}
