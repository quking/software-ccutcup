package com.pojo;

import com.util.JsonUtil;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by songyexiang on 2017/5/22.
 */
public class Notice implements java.io.Serializable{

    private Integer noticeId;   //公告id
    private String title;   // 标题
    private String content; // 内容
    private String noticePerson;//发布人
    private String noticeDatetime;//公告发布时间
    public Notice() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void setNoticeId(Integer noticeId){this.noticeId = noticeId;}
    public Integer getNoticeId(){return  noticeId;}
    public void setNoticePerson(String noticePerson){this.noticePerson = noticePerson;}
    public String getNoticePerson(){return  noticePerson;}
    public void setNoticeDatetime(String noticeDatetime){this.noticeDatetime = noticeDatetime;}
    public String getNoticeDatetime(){return noticeDatetime;}
    public void setTitle(String title){
        this.title = title;
    }
    public String getTitle(){
        return this.title;
    }
    public void setContent(String content){
        this.content = content;
    }
    public String getContent(){
        return this.content;
    }
    @Override
    public String toString() {
        return "Notice [ title=" + title+",noticeId "+ noticeId + ", content=" + content + ", noticeDatetime"+noticeDatetime
                 +", noticePerson"+noticePerson+ "]";
    }
}