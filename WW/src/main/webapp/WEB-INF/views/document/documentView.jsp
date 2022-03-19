<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${ pageContext.request.contextPath }" /><%@ taglib
	uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<%@include file="../common/header.jsp"%>

	<style>
	    .view {
	      width: 600px;
	      margin: auto;
	      margin-top: 120px;
	    }
	    
	    .view th, td {height: 40px;}
	
	    .center{width: 10%;}
	
	    .side{width: 40%;padding-left: 5%;}
	
	    .documentTextContent{
	        height: 300px;
	        padding: 3%;
	        vertical-align: top;
	    }
	
	    .separation{height: 20px;}
	
	    .title{font-size: 0.9em;}
	
	    .text_center{text-align: center;}
	
	    .button{
	        background-color: #2A3D72;
	        color: white;
	        
	        margin: 0;
	        padding: 0.5rem 1rem;
	        
	        font-family: 'Noto Sans KR', sans-serif;
	        font-size: 1rem;
	        font-weight: 400;
	        text-align: center;
	        text-decoration: none;
	        
	        border: none;
	        border-radius: 4px;
	        
	        display: inline-block;
	        width: auto;
	        
	        box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
	        
	        cursor: pointer;
	        
	        transition: 0.5s;
	    }
	
	    .content_border{border: 1px solid #aaaaaa; background-color: rgb(255, 255, 255);}
	
	
	</style>
    
<!-- Begin Page Content -->
<div class="container-fluid">


	<!-- Page Heading -->
	<div class="h3 mb-4 text-gray-800 "> 문서 검색 </div>

                    <table class="view">
                        <tr>
                            <td class="title" colspan="2">※발신자</td>
                            <td class="center"></td>
                            <td colspan="2"></td>
                        </tr>

                        <tr>
                            <td class="side content_border" colspan="2">${documentContent.emp_name}</td>
                            <td></td>
                            <td class="side content_border" colspan="2">${documentContent.emp_job_name}</td>
                        </tr>

                        <tr>
                            <td colspan="5" class="separation"></td>
                        </tr>

                        <tr>
                            <td class="title" colspan="2">※수신자</td>
                            <td></td>
                            <td colspan="2"></td>
                        </tr>

                        <tr>
                            <td class="side content_border" colspan="2">${documentContent.like_name}</td>
                            <td></td>
                            <td class="side content_border" colspan="2">${documentContent.link_job_name}</td>
                        </tr>

                        <tr>
                            <td colspan="5" class="separation"></td>
                        </tr>

                        <tr>
                            <td class="title" colspan="2">※제목</td>
                            <td></td>
                            <td colspan="2" >진행상황 : ${documentContent.doc_status}</td>
                        </tr>

                        <tr>
                            <td class="side content_border" colspan="5" >${documentContent.doc_titile}</td>
                        </tr>

                        <tr>
                            <td colspan="5" class="separation"></td>
                        </tr>

                        <tr>
                            <td class="side" colspan="4" >${documentContent.attach_origin}</td>
                            <td class="text_center" ><button class="button" onclick="javascript:fileDownload('${ board.originalFileName }', '${board.renamedFileName}')">문서 다운로드</button></td>

                        </tr>

                        <tr>
                            <td colspan="5" class="separation"></td>
                        </tr>

                        <tr>
                            <td colspan="5" class="documentTextContent content_border">${documentContent.doc_content}</td>
                        </tr>

                        <tr>
                            <td colspan="5" class="separation"></td>
                        </tr>

                        <tr>
                            <td  colspan="1"><button class="button" onclick="history.back(-1)">뒤로</button></td>
                            <td  colspan="4"><button class="button">결제진행</button></td>
                        </tr>
                    </table>
	</div>

<%@include file="../common/footer.jsp" %>