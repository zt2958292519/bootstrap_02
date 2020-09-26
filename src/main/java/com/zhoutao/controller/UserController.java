package com.zhoutao.controller;

import com.alibaba.fastjson.JSONObject;
import com.zhoutao.service.UserService;
import com.zhoutao.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/login.action",produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String login(User user){
        //System.out.println(user);
        User user1 = userService.queryuserbynameandpwd(user);

        if(user1!=null){
            return "登录成功";
        }
            return "登录失败";
    }

    @RequestMapping("/queryUserbycond.action")
    @ResponseBody
    public String queryUser(User user,
                            @RequestParam(value = "page",defaultValue = "1") int page,
                            @RequestParam(value = "rows",defaultValue = "10") int rows){
        return JSONObject.toJSONString(userService.queryUser(user,page,rows));

    }

    @RequestMapping("/queryUserbycond2.action")
    @ResponseBody
    public String queryUser2(User user,
                             @RequestParam(value = "page",defaultValue = "1") int page,
                             @RequestParam(value = "rows",defaultValue = "5") int rows){
        return JSONObject.toJSONString(userService.querycountUser(user,page,rows));

    }

    //添加
    @RequestMapping(value = "/addUser.action",produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String AddUser(User user) {
        System.out.println(user);
        int num=userService.addUser(user);
        System.out.println(num);
        if(num==1){
            return "注册成功";
        }else{
            return "注册失败";
        }
    }

    //修改
    @RequestMapping(value = "/updateUser.action",produces = "text/json;charset=UTF-8")
    @ResponseBody
    public String UpdateUser(User user) {

        System.out.println(user);
        int num = userService.updateUser(user);
        if(num>0) {
            //跳转页面
            return "修改成功";
        }else{
            return "修改失败";
        }
    }

    //id查询
    @RequestMapping("/queryById.action")
    @ResponseBody
    public String QueryById(int id,HttpSession session){
        User user=userService.queryById(id);
        return JSONObject.toJSONString(user);
    }


    //删除
    @RequestMapping("/deleteUser.action")
    public String DelUser(int id) {
        //获取参数
        int num = userService.deleteUser(id);
        if(num>0) {
            //跳转页面
            return "redirect:/show.jsp";
        }else{
            return "redirect:/index.jsp";
        }
    }

    //条件查询
    @RequestMapping("/queryuserbyname.action")
    public ModelAndView Queryuserbyname(HttpServletRequest request) {

        ModelAndView modelAndView = new ModelAndView();
        String name = request.getParameter("username");
        //传给service
        List<User> lists = userService.queryUserbyname(name);

        request.setAttribute("lists", lists);
        modelAndView.setViewName("show.action");
        return modelAndView;
    }

}
