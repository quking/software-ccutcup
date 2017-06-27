package com.service;

import com.pojo.Photo;

import java.util.List;

/**
 * Created by songyexiang on 2017/6/11.
 */
public interface PhotoService {
     public void addPhoto (Photo photo) ;

     public void deletePhoto (int photoId);

     public void deleteSelectPhoto(Photo photo);

     public List<Photo> selectPhoto();

     public Photo selectPhotoById (String photoInvoiceId);
}
