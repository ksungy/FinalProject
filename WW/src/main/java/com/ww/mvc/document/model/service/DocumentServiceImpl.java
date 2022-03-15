package com.ww.mvc.document.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ww.mvc.common.util.PageInfo;
import com.ww.mvc.document.model.dao.DocumentMapper;
import com.ww.mvc.document.model.vo.Document;

@Service
public class DocumentServiceImpl implements DocumentService {
	
	@Autowired
	private DocumentMapper mapper;
	
	@Override
	public int getDocumentCount() {
		
		return mapper.getDocumentCount();
	}

	@Override
	public List<Document> getDocumentList(PageInfo pageInfo) {
		
		 int offset = (pageInfo.getCurrentPage() - 1 ) * pageInfo.getListLimit();
		 int limit = pageInfo.getListLimit();
		 RowBounds rowBounds = new RowBounds(offset, limit);

		 return mapper.documentfindAll(rowBounds);
	}

	@Override
	public int getDocumentSearchCount() {
		
		return mapper.getDocumentSearchCount();
	}

	@Override
	public List<Document> getDocumentSearchList(Map<String, String> searchMap, PageInfo pageInfo) {

		 int offset = (pageInfo.getCurrentPage() - 1 ) * pageInfo.getListLimit();
		 int limit = pageInfo.getListLimit();
		 RowBounds rowBounds = new RowBounds(offset, limit);

		 return mapper.getDocumentSearchList(rowBounds,searchMap);
	}

	


}
