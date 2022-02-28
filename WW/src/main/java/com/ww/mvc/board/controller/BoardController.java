package com.ww.mvc.board.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.logging.Logger;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ww.mvc.board.model.service.BoardService;
import com.ww.mvc.board.model.vo.Board;
import com.ww.mvc.board.model.vo.BoardAttach;
import com.ww.mvc.common.util.FileProcess;
import com.ww.mvc.common.util.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService service;

	@Autowired
	private ResourceLoader resourceLoader;

	// ▼ 게시판 전체보기
	@GetMapping("/list")
	public ModelAndView list(ModelAndView model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int count) {

		PageInfo pageInfo = null;
		List<Board> list = null;

		log.info("page number : {}", page);

		pageInfo = new PageInfo(page, 10, service.getBoardCount(), count);

		list = service.getBoardList(pageInfo);

		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list);
		model.setViewName("board/list");

		return model;

	}

	// ▼ 게시글 상세조회
	@GetMapping("/view")
	public ModelAndView view(ModelAndView model, @RequestParam("no") int no) {

		Board board = service.findBoardByNo(no);

		model.addObject("board", board);
		model.setViewName("board/view");

		return model;
	}
	
	// ▼ 게시글 검색 페이지
	
	

	// ▼ 게시글 작성
	@GetMapping("/write")
	public String write() {
		return "/board/write";
	}
	
	@RequestMapping(value="/ckUpload", method = RequestMethod.POST) 
	@ResponseBody public void ckUpload(HttpServletRequest req, HttpServletResponse res, 
			@RequestParam MultipartFile upload) throws Exception{ 
		 
//		String uploadPath = req.getSession().getServletContext().getRealPath("/").concat("resources");
//		String uploadPath = req.getSession().getServletContext().getRealPath("/resources/ckUpload");
		String uploadPath = resourceLoader.getResource("resources/ckUpload").getFile().getPath();
		
		System.out.println("uploadPath  : " + uploadPath);
		// 랜덤 문자 생성 
		UUID uid = UUID.randomUUID(); 
		OutputStream out = null; 
		PrintWriter printWriter = null; 
		
		// 인코딩 
		res.setCharacterEncoding("utf-8"); 
		res.setContentType("text/html;charset=utf-8"); 
		try { 
			String fileName = upload.getOriginalFilename(); 
			// 파일 이름 가져오기 
			byte[] bytes = upload.getBytes(); 
			// 업로드 경로 
			String ckUploadPath = uploadPath + File.separator + uid + "_" + fileName; 
			out = new FileOutputStream(new File(ckUploadPath)); 
			out.write(bytes); 
			out.flush(); // out에 저장된 데이터를 전송하고 초기화 
			String callback = req.getParameter("CKEditorFuncNum"); 
			printWriter = res.getWriter(); 
//			String fileUrl = "/ckUpload/" + uid + "_" + fileName;  
			String fileUrl = req.getContextPath()+ "/ckUpload/" + uid + "_" + fileName; 
			
			System.out.println(fileUrl);
			printWriter.println("<script type='text/javascript'>"
					+ "window.parent.CKEDITOR.tools.callFunction(" 
					+ callback+",'"+ fileUrl+"','이미지를 업로드하였습니다.')" 
					+"</script>"); printWriter.flush(); 
			} catch (IOException e) {
				e.printStackTrace(); 
			
			} finally {
				try { 
					if(out != null) {
						out.close(); 
					} 
					
					if(printWriter != null) {
						printWriter.close(); 
					} 
				} catch(IOException e) {
					e.printStackTrace(); 
				} 
				
			} 
		
		return; 
		
	}
	
	
//	@RequestMapping("/ckUpload")
//	public void ckUpload(HttpServletRequest request, HttpServletResponse response,
//				@RequestParam MultipartFile upload) throws Exception {
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html;charset=utf-8");
//		OutputStream out = null;
//		PrintWriter printWriter = null;
//		String fileName = upload.getOriginalFilename();
//		byte[] bytes = upload.getBytes();
//		ServletContext application = request.getSession().getServletContext();
//		String uploadPath = application.getRealPath("/webapp/resources/upload/board");
//		out = new FileOutputStream(new File(uploadPath + fileName));
//		out.write(bytes);
//		printWriter = response.getWriter();
//		String fileUrl = request.getContextPath() + "/webapp/resources/upload/board" + fileName;
//		printWriter.println("{\"filename\":\"" + fileName + "\",\"uploaded\",1,\"url\":\"" + fileUrl + "\"}");
//		printWriter.flush();
//	}

//	

//	
//	
//	@ResponseBody
//	@RequestMapping(value="/ckUpload")
//	public String uploadFile (@RequestParam Map<String, Object> map, MultipartHttpServletRequest request) throws JsonProcessingException {
//		
//		List<MultipartFile> fileList = request.getFiles("upload"); // 파일 가져오기
//		
//		HashMap<String, Object> res = new HashMap<String, Object>(); // 업로드 결과, 이미지 저장 경로 저장할 맵
//		ObjectMapper mappper = new ObjectMapper();
//		String jsonStr = ""; // 맵에 저장되어 있는 데이터를  json 형식의 string 타입으로 변환하여 저장할 변수
//		
//		String imgPath = null;
//		String savePath = request.getSession().getServletContext().getRealPath("/images/upload/"); // 실제 저장되는 경로
//		String loadPath = "/images/upload/"; // 서버 상의 경로 - 서버에서 파일에 접근하는 경로, 저장 디렉토리
//		
//		for (MultipartFile mf : fileList) {
//			System.out.println(mf);
//			System.out.println(" size : " + fileList.get(0).getSize());
//			if (fileList.get(0).getSize() > 0) {
//				String originFileNme = mf.getOriginalFilename(); // 실제 파일명
//				System.out.println(" originFileNme : " + originFileNme);
//				
//				String ext = FilenameUtils.getExtension(originFileNme); // 실제 파일의 확장자명
//				String newInfImgFileName = "img_" + UUID.randomUUID() + "." + ext; // 파일명 중복 방지
//				
//				imgPath = loadPath + newInfImgFileName; // 파일 접근 경로
//				
//				System.out.println(" save path : " + savePath + newInfImgFileName);
//				System.out.println(" load path : " + imgPath);
//				
//				File file = new File(savePath + newInfImgFileName); // 실제 저장되는 파일 경로 지정
//				
//				try {
//					mf.transferTo(file); // 실제 파일로 이동
//				} catch (IllegalStateException e) {
//					System.out.println("IllegalStateException");
//					e.printStackTrace();
//					res.put("uploaded", false);
//					jsonStr = mappper.writeValueAsString(res);
//					return jsonStr;
//				} catch (IOException e) {
//					System.out.println("IOException");
//					e.printStackTrace();
//					res.put("uploaded", false);
//					jsonStr = mappper.writeValueAsString(res); // writeValueAsString : 자바스크립트에 json을 넘겨줄 때 사용
//					return jsonStr;
//				}
//				
//			}
//		}
//
//		res.put("uploaded", true);
//		res.put("url", imgPath);
//	
//		jsonStr = mappper.writeValueAsString(res);
//		System.out.println(jsonStr);
//		return jsonStr;
//	}
//
//	
	
	@PostMapping("/write")
	public ModelAndView write(ModelAndView model, @ModelAttribute Board board,
			@RequestParam("upfile") List<MultipartFile> upfile) throws Exception {
		int result = 0;

		if(upfile != null && !upfile.isEmpty()) {
			
			List<BoardAttach> attachList = new ArrayList<>();
			
			for (MultipartFile multipartFile : upfile) {
				
				log.info("fileName" + multipartFile.getOriginalFilename());
				log.info(board.getTitle());
				log.info(board.getWriter());
				log.info(board.toString());
				
				String location = resourceLoader.getResource("resources/upload/board").getFile().getPath();
				String renamedFileName = FileProcess.save(multipartFile, location);
				
				BoardAttach boardAttach = new BoardAttach();
				
				if(renamedFileName != null) {
					boardAttach.setOriginalFileName(multipartFile.getOriginalFilename());
					boardAttach.setRenamedFileName(renamedFileName);
					boardAttach.setFileSize(multipartFile.getSize());
					boardAttach.setBoardNo(board.getNo());

				}
				
				attachList.add(boardAttach);
				
			}
		}
		
		
		result = service.save(board);

		if (result > 0) {
			model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
			model.addObject("location", "/board/view?no=" + board.getNo());
		} else {
			model.addObject("msg", "게시글 등록이 실패하였습니다.");
			model.addObject("location", "/board/write");
		}

		model.setViewName("/board/list");

		return model;
	}

}
