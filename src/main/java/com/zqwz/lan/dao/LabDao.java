package com.zqwz.lan.dao;

import com.zqwz.lan.entity.Lab;

import java.util.List;

public interface LabDao {
	public List<com.zqwz.lan.entity.Lab> findAllLab();

	public List<com.zqwz.lan.entity.Lab> findLabByName(String lab_id);

	public void addLab(Lab lab);

	public void deleteLab(int lab_id);

	public void updateLab(Lab lab);

	public Lab findLabByID(int lab_id);
}
