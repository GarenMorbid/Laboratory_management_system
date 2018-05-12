package com.zqwz.lan.service;


import com.zqwz.lan.entity.User;

import java.util.List;

public interface UserService {
    public List<User> getAllUsers();
    public User VerifyUser(String user_account, String user_pwd);
	public void editInfo(User user);
	public List<User> findUserByName(String username);
	public void addUser(User user);
	public void deleteUser(int user_id);
}
