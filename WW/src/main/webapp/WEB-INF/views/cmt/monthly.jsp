<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<%@include file="../common/header.jsp"%>


<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-1 text-gray-800">월별 근태 내역</h1>
	<p class="mb-4">월별 근태 내역 확인</p>

	<!-- 월별 근태 테이블 -->
	<div class="card shadow mb-4">
		<div class="dropdown card-header py-3">
			<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">조회 월 입력</button>
			<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
				<a class="dropdown-item" href="#">${ cmt.cmt_month }월</a>
				<a class="dropdown-item" href="#">1월</a>
				<a class="dropdown-item" href="#">2월</a>
			</div>
		</div>
		<div class="card-body">
			<table class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>날짜</th>
							<th>출근</th>
							<th>퇴근</th>
							<th>근무시간</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th colspan="3">월 근무 총 합계</th>
							<th>-</th>
						</tr>
					</tfoot>
					<tbody>
						<c:if test="${ empty list }">
							<tr>
								<td colspan="4">조회된 일정이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${ !empty list }">
							<c:forEach var="cmt" items="${ list }">
								<tr>
									<td>${ cmt.cmt_no }</td>
									<td>${ cmt.cmt_srt }</td>
									<td>${ cmt.cmt_end }</td>
									<td>${ wHours }시간 ${ wMinutes }분</td>
								</tr>
							</c:forEach>
						</c:if>
						
					</tbody>
				</div>
			</table>
			<a href="${ path }/cmt/modify">
				<div class="col-12">
					<input type="button"
						style="color: #4e73df !important; font-weight: bold"
						class="btn float-right" value="근무 수정">
				</div>
			</a>
		</div>
	</div>
</div>


<div class="col-lg-10"></div>


</script>


<!-- /.container-fluid -->

<!-- End of Main Content -->

<%@include file="../common/footer.jsp"%>