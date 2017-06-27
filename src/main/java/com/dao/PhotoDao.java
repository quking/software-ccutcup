package com.dao;

import com.pojo.Photo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by songyexiang on 2017/6/11.
 */

@Repository
public interface PhotoDao {

    public void insertPhoto (Photo photo);

    public void deletePhoto (int photoId);

    public void deleteSelectPhoto(Photo photo);

    public List<Photo> selectPhoto ();

    public Photo selectPhotoById(String photoId);

}
