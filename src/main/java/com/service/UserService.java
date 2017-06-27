package com.service;

import com.pojo.Users;

/**
 * Created by root on 17-4-23.
 */
public interface UserService {
    public Users checklogin(String username,String password);
    public void  uppassword(Users users);
    public String selpassword();
    public void updatetime(Users users);

}
