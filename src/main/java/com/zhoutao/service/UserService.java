package com.zhoutao.service;

import com.zhoutao.vo.PageVo;
import com.zhoutao.vo.User;

import java.util.List;

public interface UserService {
    //登陆用的
    public User queryuserbynameandpwd(User user);

    /**
     * 根据条件查询员工  条件没有值 查所有
     * @param user
     * @return
     */
    public List<User> queryUser(User user, int page, int rows);

    /**
     * 根据条件查询员工记录数量
     * @param user
     * @return
     */
    public PageVo<User> querycountUser(User user, int page, int rows);

    //注册
    public int addUser(User user);

    public User queryById(int id);

    public int updateUser(User user);

    public int deleteUser(int id);

    public List<User> queryUserbyname(String username);

}
