package kh.spring.fongdang.common;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

@Component
@PropertySource("classpath:fongdang.properties")
public class FileUpload {
	@Value("${cloud.name}")
	private String cloud_name;
	
	@Value("${cloud.api_key}")
	private String api_key;
	
	@Value("${cloud.api_secret}")
	private String api_secret;
	
	/* 파일 서버에 파일 저장 */
	public String saveFile(MultipartFile report, HttpServletRequest request) {
		Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
				"cloud_name", cloud_name,
				"api_key", api_key,
				"api_secret", api_secret,
				"secure", true));
		
		String rename_filename = null;
		String file_name = report.getOriginalFilename(); // 원래 파일 이름
		long timeForRename = System.currentTimeMillis();
		String realPath = request.getSession().getServletContext().getRealPath("");
		String savePath = "resources\\uploadFiles";
		File folder = new File(realPath + savePath);
		
		if(!folder.exists()) { //폴더가 없다면 폴더 생성
			folder.mkdirs();
		}
		
		String filePath = realPath + savePath + "\\" + timeForRename + "_" + file_name; //파일이 저장되는 위치
		try {
			report.transferTo(new File(filePath)); //파일 저장
			
			// 파일 저장 성공!
			@SuppressWarnings("rawtypes")
			Map uploadResult = cloudinary.uploader().upload(new File(filePath), ObjectUtils.emptyMap());
//			Map uploadResult = cloudinary.uploader().upload(new File(filePath), ObjectUtils.asMap(
//					"public_id", file_name.substring(0, file_name.lastIndexOf(".")),
//					"folder", ""));
			System.out.println("업로드 된 주소 : " + uploadResult.get("url"));
			System.out.println("이미지 이름 : " + uploadResult.get("public_id"));
			
			rename_filename = (String) uploadResult.get("url"); // 파일이 업로드 된 주소
			new File(filePath).delete();
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return rename_filename;
	}
	
	/* 파일 서버에서 파일 삭제 */
	public void removeFile(String file, HttpServletRequest request) {
		Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
				"cloud_name", cloud_name,
				"api_key", api_key,
				"api_secret", api_secret,
				"secure", true));
		
		String[] file_split = file.split("/");
		String public_id = file_split[file_split.length - 1].substring(0, file_split[file_split.length - 1].lastIndexOf("."));
		
		try {
			cloudinary.uploader().destroy(public_id, ObjectUtils.emptyMap()); // file delete from cloudinary  

			System.out.println("파일 삭제 성공");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
//    //새로운이름 파일 저장하기 
//	public String saveFile(MultipartFile report, HttpServletRequest request) {
//		String rename_filename = null; 
//		long timeForRename = System.currentTimeMillis();
//		
//		String realPath = request.getSession().getServletContext().getRealPath("");
//		// C:\z_workspace\z_spring\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\myboard_project\
//		String savePath = "resources\\uploadFiles";
//		File folder = new File(realPath+savePath);
//		if(!folder.exists()) {
//			folder.mkdirs();
//		}
//		System.out.println("folder:"+folder);
//		String filePath = realPath+savePath+"\\"+ timeForRename +"_"+report.getOriginalFilename();
//		System.out.println(filePath);
//		try {
//			report.transferTo(new File(filePath));// 파일 저장
//			
//			// 성공
//			rename_filename = "/resources/uploadFiles/"+ timeForRename +"_"+report.getOriginalFilename();
//		} catch (IllegalStateException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}   
//		
//		return rename_filename;
//	}
//	
//	//삭제파일
//	public void removeFile(String board_file, HttpServletRequest request) {
//		String root = request.getSession().getServletContext().getRealPath("resources");
//		String savePath = root + "\\uploadFiles";
//
//		System.out.println("board_file before:"+board_file);
//		board_file = board_file.substring(board_file.lastIndexOf("/")+1);
//		System.out.println("board_file after :"+board_file);
//		
//		String filePath = savePath + "\\" + board_file;
//		try {
//			System.out.println("기존 저장 경로 : " + filePath);
//			File delFile = new File(filePath);
//			delFile.delete(); 	// 파일 삭제
//			System.out.println("파일 삭제가 완료되었습니다.");
//		} catch (Exception e) {
//			System.out.println("파일 삭제 에러 : " + e.getMessage());
//		}
//	}
}
