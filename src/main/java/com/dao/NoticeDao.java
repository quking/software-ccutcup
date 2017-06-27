package com.dao;

import com.pojo.Notice;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by songyexiang on 2017/5/22.
 */
@Repository
public interface NoticeDao {
    public void insertNotice(Notice notice);

    public void deleteNotice(Integer noticeId);

    public void deleteSelectNotice(Notice notice);

    public Notice selectNoticeById(Notice notice);

    public List<Notice> selectAllNotice();

}
