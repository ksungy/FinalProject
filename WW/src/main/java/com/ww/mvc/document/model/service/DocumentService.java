package com.ww.mvc.document.model.service;

import java.util.List;

import com.ww.mvc.common.util.PageInfo;
import com.ww.mvc.document.model.vo.Document;

public interface DocumentService {

	int getDocumentCount();

	List<Document> getDocumentList(PageInfo pageInfo);

	
	
}
