package com.zqwz.lan.dao;


import com.zqwz.lan.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    public List<com.zqwz.lan.entity.User> getAllUsers();
    public User VerifyUser(@Param(value = "user_account") String user_account, @Param(value = "user_pwd") String user_pwd);
	public void editInfo(User user);
	public List<com.zqwz.lan.entity.User> findUserByName(String username);
	public void addUser(User user);
	public void deleteUser(int user_id);
}
