package com.joy.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class FileController {
	
	@GetMapping(value="/download/{userId}/{imageFileName:.+}")
	public void downloadFile(@PathVariable("userId")String userId, @PathVariable("imageFileName")String imageFileName,HttpServletResponse response, HttpSession session) throws IOException {
		log.info(imageFileName);
		
		String IMAGE_REPO = "C:\\imgTest\\" + userId + "\\";
		String downFile = IMAGE_REPO + imageFileName;
		File file = new File(downFile);
		response.addHeader("Content-disposition", "attachment; fileName="+imageFileName);
		
		OutputStream out = response.getOutputStream();
		FileInputStream in;
		try {
			in = new FileInputStream(file);
		}catch(IOException e) {
			in = new FileInputStream("C:\\imgTest\\default\\default.jpg" );
			e.printStackTrace();
		}
		byte[] buffer = new byte[1024*1024*10];
		while(true) {
			int count = in.read(buffer);
			if(count == -1) {
				break;
			}
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
	
	@PostMapping(value="/summernoteUpload")
	public void profileUpload(HttpSession session, MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		log.info(file.getOriginalFilename());
		String userId= (String)session.getAttribute("userId");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 업로드할 폴더 경로
		String realFolder = "C:\\imgTest";
		UUID uuid = UUID.randomUUID();

		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename();
		String str_filename = uuid.toString() + org_filename;

		System.out.println("원본 파일명 : " + org_filename);
		System.out.println("저장할 파일명 : " + str_filename);

		String filepath = realFolder + "\\" + userId + "\\" + str_filename;
		System.out.println("파일경로 : " + filepath);

		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);
		out.println("/download/"+userId+"/"+str_filename);
		out.close();
	}
	
	@PostMapping("/uploadAjaxAction")
	public void uploadAjaxPost(MultipartFile uploadFile, HttpSession session, HttpServletResponse response) throws Exception{
		PrintWriter out = response.getWriter();
		UUID uuid = UUID.randomUUID();

		String userId = (String)session.getAttribute("userId");
		String IMAGE_REPO = "C:\\imgTest\\" + userId + "\\";
		System.out.println("update ajax post........");
		String uploadFolder = IMAGE_REPO;
		
		System.out.println("====================================");
		System.out.println("Upload File Name : " + uploadFile.getOriginalFilename());
		System.out.println("Upload File Size : " + uploadFile.getSize());
		
		String uploadFilename = uploadFile.getOriginalFilename();
		String str_filename = uuid.toString() + uploadFilename;

		System.out.println("original file name : " + uploadFilename);
		
		File saveFile = new File(IMAGE_REPO, str_filename);
		uploadFile.transferTo(saveFile);
		out.println("/download/"+userId+"/"+str_filename);
		out.close();
	}
}
