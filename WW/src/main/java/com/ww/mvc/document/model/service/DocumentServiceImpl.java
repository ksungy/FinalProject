package com.ww.mvc.document.model.service;

import java.util.List;

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
		// TODO Auto-generated method stub
		return null;
	}

	


}
