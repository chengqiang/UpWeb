/**
 * This document and its contents are protected by copyright 2012 and owned by
 * Melot Inc.
 * The copying and reproduction of this document and/or its content (whether
 * wholly or partly) or any
 * incorporation of the same into any other material in any media or format of
 * any kind is strictly prohibited.
 * All rights are reserved.
 * Copyright (c) Melot Inc. 2015
 */
package com.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

/**
 * Title: TODO
 * <p>
 * Description:
 * </p>
 * 
 * @author ��ǿ<a href="mailto:qiang.cheng@melot.cn">
 * @version V1.0
 * @since 2015��2��9�� ����4:29:14
 */
public class UploadServlet {
    /**
     * 
     */
    private List<File> fileName; // �����"fileName"һ��Ҫ����е��ļ�������ͬ
    private List<String> fileNameContentType;// ��ʽͬ��"fileName"+ContentType
    private List<String> fileNameFileName;// ��ʽͬ��"fileName"+FileName
    private String savePath;// �ļ��ϴ��󱣴��·��

    private File uploadify;
    private String uploadifyFileName;

    public String acceptForm() throws Exception {
        String uploadFileName = "";
        File dir = new File(getSavePath());
        String savePath = getSavePath();// �����ϴ��ļ��ĵ�ַ
        if (!dir.exists()) {
            dir.mkdirs();
        }
        List<File> files = getFileName();
        for (int i = 0; i < files.size(); i++) {
            FileOutputStream fos = new FileOutputStream(getSavePath() + "\\"
                    + getFileNameFileName().get(i));
            System.out.println(getSavePath());
            FileInputStream fis = new FileInputStream(getFileName().get(i));
            byte[] buffers = new byte[1024];
            int len = 0;
            while ((len = fis.read(buffers)) != -1) {
                fos.write(buffers, 0, len);
            }
            fos.close();
            fis.close();
            uploadFileName = getFileNameFileName().get(i);
        }
        // ������Ӧ���ݵ��ַ�������
        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
        ServletActionContext.getResponse().setContentType("text/plain");
        ServletActionContext.getResponse().getWriter()
                .print(uploadFileName + "," + savePath + "\\" + uploadFileName);
        System.out.println(uploadFileName + "," + savePath + "\\"
                + uploadFileName);
        return null;
    }

    public String uploadFile() throws Exception {
        String extName = "";// ��չ��
        String newFileName = "";// ���ļ���
        String nowTime = new SimpleDateFormat("yyyymmddHHmmss")
                .format(new Date());// ��ǰʱ��
        String savePath = ServletActionContext.getRequest().getRealPath("");
        savePath = savePath + "/uploads/";
        System.out.println("==savePath==>" + savePath);
        File file = new File(savePath);
        if (!file.exists())
            file.mkdirs();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("utf-8");
        System.out.println("===uploadifyFileName==>" + uploadifyFileName);
        // ��ȡ��չ��
        if (uploadifyFileName.lastIndexOf(".") >= 0) {
            extName = uploadifyFileName.substring(uploadifyFileName
                    .lastIndexOf("."));
        }
        newFileName = nowTime + extName;
        System.out.println("===newFileName==>" + newFileName);
        uploadify.renameTo(new File(savePath + newFileName));
        response.getWriter().print(uploadifyFileName + "^" + uploadifyFileName);
        return null; // ���ﲻ��Ҫҳ��ת�����Է��ؿվͿ�����
    }

    public List<File> getFileName() {
        return fileName;
    }

    public void setFileName(List<File> fileName) {
        this.fileName = fileName;
    }

    public List<String> getFileNameContentType() {
        return fileNameContentType;
    }

    public void setFileNameContentType(List<String> fileNameContentType) {
        this.fileNameContentType = fileNameContentType;
    }

    public List<String> getFileNameFileName() {
        return fileNameFileName;
    }

    public void setFileNameFileName(List<String> fileNameFileName) {
        this.fileNameFileName = fileNameFileName;
    }

    public String getSavePath() {
        return savePath;
    }

    public void setSavePath(String savePath) {
        this.savePath = savePath;
    }

    public File getUploadify() {
        return uploadify;
    }

    public void setUploadify(File uploadify) {
        this.uploadify = uploadify;
    }

    public String getUploadifyFileName() {
        return uploadifyFileName;
    }

    public void setUploadifyFileName(String uploadifyFileName) {
        this.uploadifyFileName = uploadifyFileName;
    }
}
