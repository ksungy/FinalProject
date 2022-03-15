package com.ww.mvc.document.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.ww.mvc.document.model.vo.Document;

@Mapper
public interface DocumentMapper {

	int getDocumentCount();

	List<Document> documentfindAll(RowBounds rowBounds);

	int getDocumentSearchCount();

	List<Document> getDocumentSearchList(RowBounds rowBounds, Map<String, String> searchMap);


}
