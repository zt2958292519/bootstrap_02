package com.zhoutao.serivce.impl;

import com.github.pagehelper.PageHelper;
import com.zhoutao.dao.UserDao;
import com.zhoutao.service.UserService;
import com.zhoutao.vo.PageVo;
import com.zhoutao.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;
    @Override
    public User queryuserbynameandpwd(User user) {
        return userDao.queryuserbynameandpwd(user);
    }

    @Override
    public List<User> queryUser(User user, int page, int rows) {
        PageHelper.startPage(page, rows);
        return userDao.queryUser(user);
    }

    @Override
    public PageVo<User> querycountUser(User user, int page, int rows) {
        PageVo<User> pageVo = new PageVo<>();
        //放在 查询代码的前面
        PageHelper.startPage(page, rows);
        pageVo.setRows(userDao.queryUser(user));

        pageVo.setTotal(userDao.querycountUser(user));

        return pageVo;
    }


    @Override
    public int addUser(User user) {
        return userDao.addUser(user);
    }

    @Override
    public User queryById(int id) {
        return userDao.queryById(id);
    }

    @Override
    public int updateUser(User user) {
        return userDao.updateUser(user);
    }

    @Override
    public int deleteUser(int id) {
        return userDao.deleteUser(id);
    }

    @Override
    public List<User> queryUserbyname(String name) {
        return userDao.queryUserbyname(name);
    }
}
