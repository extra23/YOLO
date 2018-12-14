 package yolo.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import yolo.service.InterfaceEmailService;
import yolo.service.InterfacePwdQuestionService;
import yolo.service.InterfaceUserService;
import yolo.vo.PwdQuestionVO;
import yolo.vo.UserVO;

@Controller
public class SummernoteImage {
	
	
	//summernote imageUpload하기
	@RequestMapping("/imgUpload")
	public void getFile(MultipartFile uploadFile, HttpServletRequest request, HttpServletResponse response) {
		
		UUID uid = UUID.randomUUID();
		String fileName = uid + "_" +uploadFile.getOriginalFilename(); // 파일명
		
		String uploadPath = "WEB-INF/resources/images/";
		String sDownPath = request.getServletContext().getRealPath(uploadPath);

		File file = new File(sDownPath + fileName);

		try {
			uploadFile.transferTo(file);

			String imgPath = request.getContextPath() + "/images/";
			JSONObject json = new JSONObject();
			
			json.put("url", imgPath + fileName);
			
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			response.getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
