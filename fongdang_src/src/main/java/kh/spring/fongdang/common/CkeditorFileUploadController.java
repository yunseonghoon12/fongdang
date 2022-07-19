package kh.spring.fongdang.common;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/adm")
public class CkeditorFileUploadController {
	
 @RequestMapping(value="fileupload.do",method= RequestMethod.POST)
 @ResponseBody
 public void fileupload(HttpServletRequest request,HttpServletResponse response
		 , MultipartFile upload) throws Exception {
		//Logger.info("upload 들어온다! ");
		
		response.setCharacterEncoding("utf-8");
     response.setContentType("text/html; charset=utf-8");

     //파일 이름 가져오기
     String fileName=upload.getOriginalFilename();

     //파일을 바이트 배열로 변환
     byte[] bytes=upload.getBytes();

     //이미지를 업로드할 디렉토리를 정해준다
     String uploadPath="C:\\Users\\eclipse-workspace\\test\\src\\main\\webapp\\ckEimg\\";
     OutputStream out=new FileOutputStream(new File(uploadPath+fileName));

     //서버에 write
     out.write(bytes);
     
     //성공여부 가져오기
     String callback=request.getParameter("CKEditorFuncNum");
     
     //클라이언트에 이벤트 추가 (자바스크립트 실행)
     PrintWriter printWriter=response.getWriter(); //자바스크립트 쓰기위한 도구

     String fileUrl= request.getContextPath()+"/ckEimg/"+fileName;
    
     if(!callback.equals("1")) { // callback이 1일 경우만 성공한 것
     	 printWriter.println("<script>alert('이미지 업로드에 실패했습니다.');"+"</script>");

     }else {
     	// logger.info("upload img 들어온다! "+fileUrl);
          
          printWriter.println("<script>window.parent.CKEDITOR.tools.callFunction("+callback+",'"+fileUrl+"','이미지가 업로드되었습니다.')"+"</script>");
          
     }
     
     printWriter.flush();

	}
	//https://jul-liet.tistory.com/172  사용 
}
