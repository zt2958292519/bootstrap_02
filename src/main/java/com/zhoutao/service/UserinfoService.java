package com.zhoutao.service;

import com.zhoutao.vo.UserInfo;

import java.util.List;

public interface UserinfoService {
    /**
     * 查询所有用户信息
     * @return
     */
    public List<UserInfo> queryalluser();
}
