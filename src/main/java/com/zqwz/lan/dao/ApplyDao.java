package com.zqwz.lan.dao;

import com.zqwz.lan.entity.ApplyDevice;
import com.zqwz.lan.entity.ApplyLab;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ApplyDao {

	public void submitApplyLab(ApplyLab applyLab);

	public void submitApplyDevice(ApplyDevice applyDevice);

	public List<com.zqwz.lan.entity.ApplyLab> findAllApplyLabByID(String apply_id);

	public void passApplyLab(@Param(value = "apply_id") int apply_id, @Param(value = "deal_man") String deal_man);

	public void notPassApplyLab(@Param(value = "apply_id") int apply_id, @Param(value = "deal_man") String deal_man);

	public List<com.zqwz.lan.entity.ApplyDevice> findAllApplyDeviceByID(String apply_id);

	public void passApplyDevice(@Param(value = "apply_id") int apply_id, @Param(value = "deal_man") String deal_man);

	public void notPassApplyDevice(@Param(value = "apply_id") int apply_id, @Param(value = "deal_man") String deal_man);

}
