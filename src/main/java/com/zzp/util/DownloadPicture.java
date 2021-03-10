package com.zzp.util;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class DownloadPicture {
    public static String downloadPicture(MultipartFile file) {
        if(file == null)
            return "file_null";
        else{
            String path="";
            String originalFilename = file.getOriginalFilename();
            int lastIndexOf = originalFilename.lastIndexOf(".");
            String fileType = originalFilename.substring(lastIndexOf + 1);
            if (fileType.equals("jpg") || fileType.equals("png")
                    || fileType.equals("JPG") || fileType.equals("PNG")
                    ) {
                
                path = "D:/XiaoQu_img/repair_img/" + new Date().getTime() + originalFilename;
                File newFile = new File(path);
                //通过CommonsMultipartFile的方法直接写文件(注意这个时候）
                try {
                    file.transferTo(newFile);             
                } catch (IOException e) {
                    e.printStackTrace();
                }
                return path;
            } else {
                return "fail";
            }
        }
    }
}
