package com.ww.mvc.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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

		pageInfo = new PageInfo(page, 10, service.getBoardCount(), count);

		list = service.getBoardList(pageInfo);

		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list);
		model.setViewName("board/list");

		return model;

	}

	// ▼ 게시글 1건 상세조회
	@GetMapping("/view")
	public ModelAndView view(ModelAndView model, @RequestParam("no") int no) {

		Board board = service.findBoardByNo(no);

		model.addObject("board", board);
		model.setViewName("board/view");

		return model;
	}
	

	// ▼ 게시글 검색
	@GetMapping("/search")
	public ModelAndView boardSearch(@RequestParam("searchType") String searchType, @RequestParam("keyword") String keyword, 
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int count) {
		ModelAndView model = new ModelAndView();
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 10, service.getSearchCount(), count);
		
		Map<String, String> searchMap = new HashMap<String, String>();
		
		searchMap.put("searchType", searchType);
		searchMap.put("keyword", keyword);
		
		List<Board> list = service.boardSearch(searchMap, pageInfo);
		
		model.addObject("searchMap", searchMap);
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list);
		model.setViewName("board/list");
		
		return model;

	}
	

	// ▼ 게시글 작성 페이지
	@GetMapping("/write")
	public String write() {
		return "/board/write";
	}
	
	
	// ▼ CKEditor 글 작성
	@RequestMapping(value="/ckUpload", method = RequestMethod.POST) 
	@ResponseBody public void ckUpload(HttpServletRequest req, HttpServletResponse res, 
			@RequestParam(required = false) MultipartFile upload) throws Exception{ 
		 
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
		

	// ▼ 첨부파일 글 작성
	@PostMapping("/write")
	public ModelAndView write(ModelAndView model, @ModelAttribute Board board,
			@RequestParam("upfile") List<MultipartFile> upfile) throws Exception {
		
		int result = 0;

		if(upfile != null && !upfile.isEmpty()) {
			
			List<BoardAttach> attachList = new ArrayList<>();
			
			for (MultipartFile multipartFile : upfile) {
				
				log.info("fileName" + multipartFile.getOriginalFilename());
				
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
				
				board.setAttachList(attachList);
			}
		}
		
		
//		board.setWriterNo(loginMember.getNo());
		result = service.save(board);
		log.info(board.toString());

		if (result > 0) {
			model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
			model.addObject("location", "/board/view?no=" + board.getNo());
		} else {
			model.addObject("msg", "게시글 등록이 실패하였습니다.");
			model.addObject("location", "/board/write");
		}

		
		model.setViewName("common/msg");

		return model;
	}
	
	
	
	
	

}
