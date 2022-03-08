package com.ww.mvc.document.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.ww.mvc.document.model.vo.Document;

@Mapper
public interface DocumentMapper {

	int getDocumentCount();

	List<Document> findAll(RowBounds rowBounds);

}
