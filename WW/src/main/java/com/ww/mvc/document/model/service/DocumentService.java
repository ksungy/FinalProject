package com.ww.mvc.document.model.service;

import java.util.List;
import java.util.Map;

import com.ww.mvc.common.util.PageInfo;
import com.ww.mvc.document.model.vo.Document;

public interface DocumentService {

	int getDocumentCount();

	List<Document> getDocumentList(PageInfo pageInfo);

	int getDocumentSearchCount();

	List<Document> getDocumentSearchList(Map<String, String> searchMap, PageInfo pageInfo);

	
	
}
