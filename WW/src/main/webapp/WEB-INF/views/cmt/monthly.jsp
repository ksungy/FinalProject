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
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">2월</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
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
							<th>36h</th>

						</tr>
					</tfoot>
					<tbody>
						<tr>
							<td>2/1</td>
							<td>09:00</td>
							<td>18:00</td>
							<td>9h</td>
						</tr>
						<tr>
							<td>2/2</td>
							<td>09:00</td>
							<td>18:00</td>
							<td>9h</td>
						</tr>
						<tr>
							<td>2/3</td>
							<td>09:00</td>
							<td>18:00</td>
							<td>9h</td>
						</tr>
						<tr>
							<td>2/4</td>
							<td>09:00</td>
							<td>18:00</td>
							<td>9h</td>
						</tr>
					</tbody>
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

</div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<%@include file="../common/footer.jsp"%>