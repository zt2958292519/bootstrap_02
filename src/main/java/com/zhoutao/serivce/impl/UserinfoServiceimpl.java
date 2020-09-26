package com.zhoutao.serivce.impl;

import com.zhoutao.dao.UserinfoDao;
import com.zhoutao.service.UserinfoService;
import com.zhoutao.vo.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserinfoServiceimpl implements UserinfoService {

    @Autowired
    UserinfoDao userinfoDao;

    @Override
    public List<UserInfo> queryalluser() {
        return userinfoDao.queryalluser();
    }
}
