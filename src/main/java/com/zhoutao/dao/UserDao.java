package com.zhoutao.dao;

import com.zhoutao.vo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {

    //登陆用的
    public User queryuserbynameandpwd(User user);

    /**
     * 根据条件查询用户  条件没有值 查所有
     * @param user
     * @return
     */
    public List<User> queryUser(User user);

    /**
     * 根据条件查询用户记录数量
     * @param user
     * @return
     */
    public int querycountUser(User user);

    public User queryById(int id);
    //注册
    public int addUser(User user);

    public int updateUser(User user);

    public int deleteUser(int id);

    public List<User> queryUserbyname(@Param("username") String username);


}
