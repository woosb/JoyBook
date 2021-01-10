package com.joy.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class FileController {
	
	@GetMapping(value="/download")
	public void downloadFile(@RequestParam("imageFileName")String imageFileName, HttpServletResponse response, HttpSession session) throws IOException {
		String userId = (String)session.getAttribute("userId");
		String IMAGE_REPO = "C:\\imgTest\\" + userId + "\\";
		String downFile = IMAGE_REPO + imageFileName;
		File file = new File(downFile);
		response.addHeader("Content-disposition", "attachment; fileName="+imageFileName);
		
		OutputStream out = response.getOutputStream();
		FileInputStream in = new FileInputStream(file);
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
	
	@PostMapping("/uploadAjax")
	public ResponseEntity<String> uploadFormPost(MultipartFile[] uploadFile, Model model, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		String IMAGE_REPO = "C:\\imgTest\\" + userId;
		
		ResponseEntity<String> result = null;
		for(MultipartFile multipartFile : uploadFile) {
			System.out.println("====================================");
			System.out.println("Upload File Name : " + multipartFile.getOriginalFilename());
			System.out.println("Upload File Size : " + multipartFile.getSize());
			
			File Folder = new File(IMAGE_REPO);
			if(!Folder.exists()) {
				try {
					Folder.mkdir();
				}catch(Exception e) {
					e.getStackTrace();
				}
			}
			
			File saveFile = new File(IMAGE_REPO, multipartFile.getOriginalFilename());
			try {
				multipartFile.transferTo(saveFile);
				result = ResponseEntity.status(HttpStatus.OK).body("success");
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
}
