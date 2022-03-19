package com.ww.mvc.document.controller;

import java.io.IOException;
import java.security.Provider.Service;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ww.mvc.board.model.vo.Board;
import com.ww.mvc.board.model.vo.BoardAttach;
import com.ww.mvc.board.model.vo.Reply;
import com.ww.mvc.common.util.FileProcess;
import com.ww.mvc.common.util.PageInfo;
import com.ww.mvc.document.model.service.DocumentService;
import com.ww.mvc.document.model.vo.Document;
import com.ww.mvc.member.model.vo.Member;

import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j2;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class Document_Controller {
	
	@Autowired
	private DocumentService service;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
//	// ▼ 문서 리스트
//	@GetMapping("/document/list")
//	public ModelAndView documentList(ModelAndView model,
//			@RequestParam(defaultValue = "1") int page,
//			@RequestParam(defaultValue = "10") int pages){
//		
//		//PageInfo(현재 페이지, 한페이지에 리스트수, 전체리스트 수, 한 페이지에 표시된 리스트수)
//		int documentListCount = serivce.getDocumentCount();
//		PageInfo pageInfo = new PageInfo(page, 10, documentListCount, pages);
//		List<Document> documentList = serivce.getDocumentList(pageInfo);
//		
//		model.addObject("pageInfo",pageInfo);
//		model.addObject("documentList",documentList);
//		model.setViewName("document/documentList");
//		
//		return model;
//	}

	// ▼ 문서 리스트
	@GetMapping("/document/list")
	public ModelAndView boardSearch(ModelAndView model,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int pages,
			@RequestParam(defaultValue = "title") String type,
			@RequestParam(defaultValue = "") String search	
			) {
		
		Map<String, String> searchMap = new HashMap<String, String>();
		
		searchMap.put("type", type);
		searchMap.put("search", search);
		
		int documentSearchCount = service.getDocumentSearchCount(searchMap);
		PageInfo pageInfo = new PageInfo(page, 10, documentSearchCount, pages);
		List<Document> documentSearchList = service.getDocumentSearchList(searchMap,pageInfo);
		
		model.addObject("searchMap", searchMap);
		model.addObject("pageInfo", pageInfo);
		model.addObject("documentList",documentSearchList);
		model.setViewName("document/documentList");
		
		return model;

	}
	
	
	// ▼ 문서 작성 (호출)
	@GetMapping ("/document/write")
	public ModelAndView write (ModelAndView model) {
		
		List<Member> getMemberMinList = service.getMemberMinList();
		
		log.info(getMemberMinList.toString());
		
		model.addObject("MemberMinList", getMemberMinList);
		model.setViewName("document/documentWrite");
		return model;
	}
	
	
	
	
	// ▼ 문서 작성 (등록)
	@PostMapping("/document/write")
	public ModelAndView documentWrite( ModelAndView model, @SessionAttribute("loginMember") Member loginMember, @RequestParam("no") String link_no,
			@ModelAttribute Document document, @RequestPart("upfile") MultipartFile upfile) throws Exception 
			 {

		if(upfile != null && !upfile.isEmpty()) {
			
			String location = null;
			String renamedFileName = null;
			
			try {
				location = resourceLoader.getResource("/resources/upload/document").getFile().getPath();
				renamedFileName = FileProcess.save(upfile, location);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if (renamedFileName != null) {
				document.setAttach_origin(upfile.getOriginalFilename());
				document.setAttach_rename(renamedFileName);
			}
			
		} 
		

		
			int result = 0;
			
			document.setEmp_no(loginMember.getNo());
			document.setLink_no(link_no);
			result = service.save(document);

			if (result != 0) {
				
				model.addObject("msg","게시글이 정상적으로 등록되었습니다.");
				model.addObject("location","/document/view?no="+document.getDoc_id());
				
			} else {
				model.addObject("msg","게시글 등록을 실패하였습니다.");
				model.addObject("location","/document/list");
				
			}
			
			model.setViewName("/common/msg");

		return model;
	}
	
	
	
	
	// ▼ 문서 불러오기
	@GetMapping("/document/view")
	public ModelAndView memberList( ModelAndView model ,@RequestParam("no")int doc_no) {
		
		if (doc_no > 0) {
		
			Document documentContent = service.getDocumentContent(doc_no);
			// 관리자,수신인, 발신인, 수신인과 같은부서 직급이 높은사람
			
			log.info(documentContent.toString());
			
			
			model.addObject("documentContent",documentContent);
			model.setViewName("document/documentView");
		} else {
			model.addObject("msg", "문서를 불러오는데 실패하였습니다.(문서첨부 여부 확인)");
			model.addObject("location", "document/documentList");
			model.setViewName("common/msg");
		}

		return model;
	}
	

	
	
	
}
