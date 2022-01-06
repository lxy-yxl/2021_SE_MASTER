package com.example.demo.controller;


import com.example.demo.annotation.UserLoginToken;
import com.example.demo.common.Result;
import com.example.demo.entity.Picture;
import com.example.demo.service.PictureService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;

/**
 * <p>
 * 图片表 前端控制器
 * </p>
 *
 * @author ZLZHAO
 * @since 2021-12-20
 */
@RestController
@RequestMapping("/picture")
public class PictureController {

    //    @PostMapping("/upload")
//    public Object upload(@RequestParam("file")MultipartFile file){
//        return saveFile(file);
//    }
//    @PostMapping("/multiUpload")
//    public Object multiUpload(@RequestParam("file")MultipartFile[] files){
//        System.out.println("文件的个数:"+files.length);
//        for (MultipartFile f : files){
//            saveFile(f);
//        }
//        return "ok";
//    }
    @Resource
    private PictureService pictureService;
//    private final static String UPLOAD_PATH = "F:/upload";      //本机路径
    /**
     * 图片保存路径，自动从yml文件中获取数据
     *   示例： E:/images/
     */
    @Value("${UPLOAD_PATH}")
    private String UPLOAD_PATH;

//    @UserLoginToken
    @PostMapping(value = "/upload",consumes= MediaType.MULTIPART_FORM_DATA_VALUE)
    public Result<?> uploadTest(@RequestParam(name="file") MultipartFile file, HttpServletRequest request){
        String uploadInfo = null;
        try{
            uploadInfo = pictureService.upload(file,UPLOAD_PATH,request);
        }catch (Exception e){
            System.out.println(e.toString());
            return Result.error("-1","上传失败");
        }
        return Result.success(uploadInfo);
    }

}

