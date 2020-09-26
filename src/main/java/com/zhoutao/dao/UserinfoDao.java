package com.zhoutao.dao;

import com.zhoutao.vo.UserInfo;

import java.util.List;

public interface UserinfoDao {

    /**
     * 查询所有用户信息
     * @return
     */
    public List<UserInfo> queryalluser();


}
