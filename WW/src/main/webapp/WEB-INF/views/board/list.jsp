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
			
				<!-- Search -->
				<div class="input-group">
				  <input type="search" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" />
				  <button type="button" class="btn btn-outline-primary">search</button>
				</div>
				
				<!-- Write Button -->
			  	<a href="#" style="background:#2A3D72;" class="btn btn-primary btn-circle">
                	<i style="color:white;" class="fas fa-edit"></i>
                </a>
				
				<!-- Table -->
				<div class="table">

					<div class="row header">
						<div class="cell">글번호</div>
						<div class="cell">글제목</div>
						<div class="cell">작성자</div>
						<div class="cell">작성일</div>
						<div class="cell">조회수</div>
					</div>

					<div class="row">
						<div class="cell" data-title="Full Name">10</div>
						<div class="cell" data-title="Age">안녕하세요</div>
						<div class="cell" data-title="Job Title">이산아</div>
						<div class="cell" data-title="Location">2022-02-12</div>
						<div class="cell" data-title="hits">100</div>
					</div>

					<div class="row">
						<div class="cell" data-title="Full Name">9</div>
						<div class="cell" data-title="Age">안녕하세요안녕하세요</div>
						<div class="cell" data-title="Job Title">이산아</div>
						<div class="cell" data-title="Location">2022-02-12</div>
						<div class="cell" data-title="hits">100</div>
					</div>

					<div class="row">
						<div class="cell" data-title="Full Name">8</div>
						<div class="cell" data-title="Age">안녕하세요안녕하세요</div>
						<div class="cell" data-title="Job Title">이산아</div>
						<div class="cell" data-title="Location">2022-02-12</div>
						<div class="cell" data-title="hits">100</div>
					</div>

					<div class="row">
						<div class="cell" data-title="Full Name">7</div>
						<div class="cell" data-title="Age">안녕하세요안녕하세요</div>
						<div class="cell" data-title="Job Title">이산아</div>
						<div class="cell" data-title="Location">2022-02-12</div>
						<div class="cell" data-title="hits">100</div>
					</div>

					<div class="row">
						<div class="cell" data-title="Full Name">6</div>
						<div class="cell" data-title="Age">안녕하세요안녕하세요</div>
						<div class="cell" data-title="Job Title">이산아</div>
						<div class="cell" data-title="Location">2022-02-12</div>
						<div class="cell" data-title="hits">100</div>
					</div>

					<div class="row">
						<div class="cell" data-title="Full Name">5</div>
						<div class="cell" data-title="Age">안녕하세요안녕하세요</div>
						<div class="cell" data-title="Job Title">이산아</div>
						<div class="cell" data-title="Location">2022-02-12</div>
						<div class="cell" data-title="hits">100</div>
					</div>

					<div class="row">
						<div class="cell" data-title="Full Name">4</div>
						<div class="cell" data-title="Age">안녕하세요안녕하세요</div>
						<div class="cell" data-title="Job Title">이산아</div>
						<div class="cell" data-title="Location">2022-02-12</div>
						<div class="cell" data-title="hits">100</div>
					</div>

					<div class="row">
						<div class="cell" data-title="Full Name">3</div>
						<div class="cell" data-title="Age">안녕하세요안녕하세요</div>
						<div class="cell" data-title="Job Title">관리자</div>
						<div class="cell" data-title="Location">2022-02-12</div>
						<div class="cell" data-title="hits">100</div>
					</div>

					<div class="row">
						<div class="cell" data-title="Full Name">2</div>
						<div class="cell" data-title="Age">안녕하세요안녕하세요</div>
						<div class="cell" data-title="Job Title">관리자</div>
						<div class="cell" data-title="Location">2022-02-12</div>
						<div class="cell" data-title="hits">100</div>
					</div>

					<div class="row">
						<div class="cell" data-title="Full Name">1</div>
						<div class="cell" data-title="Age">안녕하세요안녕하세요</div>
						<div class="cell" data-title="Job Title">관리자</div>
						<div class="cell" data-title="Location">2022-02-12</div>
						<div class="cell" data-title="hits">100</div>
					</div>

				</div>

				<div class="paging">
					<a href="" class="num_btn">첫 페이지</a>
					<a href="" class="num_btn">이전페이지</a>
					<a href="" class="num on">1</a>
					<a href="" class="num">2</a>
					<a href="" class="num">3</a>
					<a href="" class="num">4</a>
					<a href="" class="num">5</a>
					<a href="" class="num_btn">다음 페이지</a>
					<a href="" class="num_btn">마지막 페이지</a>
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