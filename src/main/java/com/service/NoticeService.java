package com.service;

import com.pojo.Notice;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by songyexiang on 2017/5/23.
 */

public interface NoticeService {

    void addNotice(Notice notice);

    public List<Notice> selectAllNotice();

    public Notice selectNoticeById(Notice notice);

    public void deleteSelectNotice(Notice notice);

    public void deleteNoticeById(Integer noticeId);
}
