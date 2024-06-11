package com.tyyy.controller;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/** 
 * @author  siyong E-mail: ve_master@sina.com
 * @date ����ʱ�䣺2017��2��9�� ����2:24:46 
 * @version 1.0 
*/
@Controller
@RequestMapping("/ued")
public class UEditorController {
	 /**
     * ���ļ��ϴ�֧�� 
     * @param upfile
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/uploadimage")
    public Map<String,String> uploadFile(@RequestParam(value = "upfile", required = false) MultipartFile[] upfile,HttpServletRequest requst) throws Exception{
        Map<String,String> map = new HashMap<String, String>();
        if (upfile != null && upfile.length > 0){
            //ѭ����ȡfile�����е��ļ�
            for(int i = 0;i<upfile.length;i++){
                MultipartFile file = upfile[i];
                String fileName = file.getOriginalFilename();
                byte[] fileByte = file.getBytes();
                //���ض���
                System.out.println("�ϴ��ļ�"+fileName);
                long l = new Date().getTime();
                String newFileName = l+fileName;
                String root = requst.getSession().getServletContext().getRealPath("/");
                System.out.println("��Ŀ����"+ root);
                File newFile = new File(root+"/dist/uploadImg/"+newFileName);
                try {
                	newFile.createNewFile();
                	file.transferTo(newFile);
                    map.put("url","../dist/uploadImg/"+newFileName);
                    map.put("state","SUCCESS");
                }catch (Exception e){
                    e.printStackTrace();
                    map.put("state","�ϴ�ʧ��!");
                }
            }
        }
        return map;
    }
}
