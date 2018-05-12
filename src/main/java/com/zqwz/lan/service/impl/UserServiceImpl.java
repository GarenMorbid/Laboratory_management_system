package com.zqwz.lan.service.impl;


import com.zqwz.lan.dao.UserDao;
import com.zqwz.lan.entity.User;
import com.zqwz.lan.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userDao;

    public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
    public List<User> getAllUsers() {
        return userDao.getAllUsers();
    }

    @Override
    public User VerifyUser(String user_account, String user_pwd) {
        return userDao.VerifyUser(user_account,user_pwd);
    }

	@Override
	public void editInfo(User user) {
		userDao.editInfo(user);
	}

	@Override
	public List<User> findUserByName(String username) {
		return userDao.findUserByName(username);
	}

	@Override
	public void addUser(User user) {
		userDao.addUser(user);
	}

	@Override
	public void deleteUser(int user_id) {
		userDao.deleteUser(user_id);
	}
}
