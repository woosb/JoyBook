package com.joy.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class FileController {
	
	@PostMapping(value="/upload")
	public int uploadFile(MultipartFile[] uploadFile) {
		log.info("upload started");
		String path = "c:\\imgTest";
		File uploadPath = new File(path);
		
		if(!uploadPath.exists()) {
			uploadPath.mkdir();
			log.info("폴더 생성");
		}
		
		for(MultipartFile file :  uploadFile) {
			log.info(file.toString());
			log.info(file.getOriginalFilename());
			
			File upload = new File(path, file.getOriginalFilename());
			try {
				file.transferTo(upload);
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		return 0;
	}
	
	@GetMapping(value="/download")
	public void downloadFile(HttpServletResponse response) {
		
		try {
			OutputStream out = response.getOutputStream();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
