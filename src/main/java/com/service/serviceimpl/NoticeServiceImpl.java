package com.service.serviceimpl;

import com.dao.NoticeDao;
import com.pojo.Notice;
import com.service.NoticeService;
import com.sun.javafx.collections.MappingChange;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by songyexiang on 2017/5/23.
 */
@Service("NoticeService")
@Transactional
public class NoticeServiceImpl implements NoticeService {
    @Resource
    NoticeDao noticeDao;

    public void addNotice(Notice notice) {
        noticeDao.insertNotice(notice);
    }

    public Notice selectNoticeById(Notice notice){ return noticeDao.selectNoticeById(notice);}

    public List<Notice> selectAllNotice(){ return noticeDao.selectAllNotice();}

    public void deleteSelectNotice(Notice notice){ noticeDao.deleteSelectNotice(notice);}

    public void deleteNoticeById(Integer noticeId){ noticeDao.deleteNotice(noticeId);}
}
