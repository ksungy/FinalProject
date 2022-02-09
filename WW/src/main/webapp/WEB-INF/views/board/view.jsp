<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<%@include file="../common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${ path }/resources/css/board/main.css">
<link rel="stylesheet" type="text/css" href="${ path }/resources/css/board/util.css">


<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-1 text-gray-800">Whereware 게시판</h1>
	<p class="mb-4">서로 존중하는 공간입니다.</p>
	
	
</div>
<%@include file="../common/footer.jsp"%>