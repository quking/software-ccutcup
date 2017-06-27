package com.dao;

import com.pojo.Users;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * Created by root on 17-4-23.
 */
@Repository
public interface Logincheck {
    public Users checklogin(@Param("username") String username,@Param("password")String password);
    public void uppassword(Users users);
    public String selpassword();
    public void updatetime(Users users);

}
