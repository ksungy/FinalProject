package com.ww.mvc.document.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.ww.mvc.document.model.vo.Document;
import com.ww.mvc.member.model.vo.Member;

@Mapper
public interface DocumentMapper {

//	int getDocumentCount();
//
//	List<Document> documentfindAll(RowBounds rowBounds);

	int getDocumentSearchCount(Map<String, String> searchMap);

	List<Document> getDocumentSearchList(RowBounds rowBounds, Map<String, String> searchMap);

	Document getDocumentContent(int doc_no);

	int UpdateDocument(Document document);

	int getInsertDocument(Document document);

	
	List<Member> getMemberMinList();
	
	
// 아직 안씀
	Document getLoginMemberInfo(int no);


	void InsertLinkDocument(Document document);

	void InsertAttachDocument(Document document);







}
