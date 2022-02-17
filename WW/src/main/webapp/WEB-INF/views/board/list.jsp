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
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">



<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-1 text-gray-800">Whereware 게시판</h1>
	<p class="mb-4">서로 존중하는 공간입니다.</p>
	
    
    <!-- Table Wrapper -->
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
			

				<div class=search>
                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline navbar-search">
                        <div class="input-group">
                        	<select class="form-control bg-light">
							  <option selected>---</option>
							  <option value="1">제목</option>
							  <option value="2">작성자</option>
							  <option value="3">내용</option>
							</select>
                            <input type="text" class="form-control bg-light border-0 small" placeholder="검색어를 입력하세요."
                                aria-label="Search" >
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                
                <!-- Write Button -->
			  	<a href="${ path }/board/write" style="background:#2A3D72;" class="btn btn-primary btn-circle">
                	<i style="color:white;" class="fas fa-edit"></i>
                </a>
				</div>
	
				<!-- Table -->
				<div class="table">

					<div class="row header">
						<div class="cell">글번호</div>
						<div class="cell">글제목</div>
						<div class="cell">작성자</div>
						<div class="cell">작성일</div>
						<div class="cell">조회수</div>
					</div>
					<c:if test="${ !empty list }">
						<c:forEach var="board" items="${ list }">
							<div class="row">
								<div class="cell">${ board.no }</div>
								<div class="cell"><a href="${ path }/board/view?no=${ board.no }">${ board.title }</a></div>
								<div class="cell">${ board.writer }</div>
								<div class="cell"><fmt:formatDate type="date" value="${ board.createDate }"/></div>
								<div class="cell">${ board.hits }</div>
							</div>
						</c:forEach>
					</c:if>
					

				</div>

				<div class="paging">
					<a href="${ path }/board/list?page=1" class="num_btn">첫 페이지</a>
					<a href="${ path }/board/list?page=${ pageInfo.prevPage }" class="num_btn">이전페이지</a>
					<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
					<c:if test="${ status.current == pageInfo.currentPage }">				
						<a>${ status.current }</a>
					</c:if>
					
					<c:if test="${ status.current != pageInfo.currentPage }">				
						<a href="${ path }/board/list?page=${ status.current }&count=${ pageInfo.listLimit }" class="num">${ status.current }</a>
					</c:if>
					</c:forEach>

					<a href="${ path }/board/list?page=${ pageInfo.nextPage }" class="num_btn">다음 페이지</a>
					<a href="${ path }/board/list?page=${ pageInfo.maxPage }" class="num_btn">마지막 페이지</a>
				</div>
			</div>

		</div>
	</div>



	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="js/main.js"></script>



</div>
<%@include file="../common/footer.jsp"%>