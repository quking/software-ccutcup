package com.service.serviceimpl;

import com.dao.Logincheck;
import com.pojo.Users;
import com.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by root on 17-4-23.
 */
@Service
public class UserServiceimpl implements UserService {

    @Resource
    private Logincheck logincheck;

    public Users checklogin(String username, String password) {
        return logincheck.checklogin(username,password);
    }

    public void uppassword(Users users) {
        logincheck.uppassword(users);
    }

    public String selpassword() {
        return logincheck.selpassword();
    }

    public void updatetime(Users users) {
        logincheck.updatetime(users);
    }

}
