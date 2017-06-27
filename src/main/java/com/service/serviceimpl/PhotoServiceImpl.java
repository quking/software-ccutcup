package com.service.serviceimpl;

import com.dao.PhotoDao;
import com.pojo.Photo;
import com.service.PhotoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by songyexiang on 2017/6/11.
 */
@Service("PhotoService")
public class PhotoServiceImpl implements PhotoService{
    @Resource
    PhotoDao photoDao;

    public void addPhoto(Photo photo) {
        photoDao.insertPhoto(photo);
    }

    public void deleteSelectPhoto(Photo photo){ photoDao.deleteSelectPhoto(photo);};

    public void deletePhoto(int photoId){photoDao.deletePhoto(photoId);}

    public List<Photo> selectPhoto(){ return photoDao.selectPhoto();}

    public Photo selectPhotoById(String photoId){return  photoDao.selectPhotoById(photoId);}

}
