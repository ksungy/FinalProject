<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../common/header.jsp"%>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-1 text-gray-800">근태관리</h1>
		<p class="mb-4">근무 시간 확인</p>

		<!-- Content Row -->
		<div class="row">
			<div class="col-lg-2">
				<!-- Overflow Hidden -->

				<div class="card mb-4" style="height: 665px;">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">Today</h6>
					</div>
					<div class="card-body">
						<div style="margin-top: 10px; margin-bottom: 30px;"><%= sf.format(nowTime) %></div>
						<c:if test="${ empty cmt.cmt_srt_time }">
							<button class="btn btn-primary btn-sm" data-target="#modal1" data-toggle="modal">출근등록</button>
						</c:if>
						<c:if test="${ empty cmt.cmt_srt_time }">
							<button class="btn btn-primary btn-sm" data-target="#modal2" data-toggle="modal">퇴근등록</button>
						</c:if>
						<div style="margin-bottom: 40px;">
							출근 시간
							<c:out value="${ cmt.cmt_srt_time }"></c:out>
						</div>
						<div style="margin-bottom: 40px;">
							퇴근 시간
							<c:if test="${ !empty cmt.cmt_end_time }">
							<c:out value="${ cmt.cmt_end_time }"></c:out>
							</c:if>
							<div id="time"></div>
						</div>
						<div>
							근무 시간
							<div style="font-size: 1.5em; font-weight: bold;">9h</div>
						</div>
					</div>
				</div>

			</div>
			<div class="col-lg-9">




				<!-- 월 근무 시간 -->
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">총 근무 시간</h6>
					</div>
					<div class="card-body">
						<div class="mb-1 small">당월 근무 누적시간</div>
						<div class="progress mb-4">
							<div class="progress-bar" role="progressbar" style="width: 35%"
								aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
						</div>
						<div class="mb-1 small">초과 근무</div>
						<div class="progress progress-sm mb-2">
							<div class="progress-bar" role="progressbar" style="width: 0%"
								aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
						</div>
						<!--
                                    Use the <code>.progress-sm</code> class along with <code>.progress</code>
                                    -->
					</div>
				</div>

				<!-- 월 근무 테이블 -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">최근 근무 내역</h6>
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
										<th colspan="3">총 합계</th>
										<th>${ cmt.cmt_total_time }</th>

									</tr>
								</tfoot>
								<c:if test="${ !empty cmt }">
									<c:forEach var="cmt" items="${ cmt }">
										<tr>
											<td><fmt:formatDate type="date" value="${ cmt.cmt_date }"/></td>
											<td>${ cmt.cmt_srt_time }</td>
											<td>${ cmt.cmt_end_time }</td>
											<td>${ cmt.cmt_time }</td>
										</tr>
									</c:forEach>
								</c:if>
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

			</div>
			<div class="col-lg-10"></div>

		</div>

	</div>
	<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<!-- End of Footer -->

</div>
<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

    <!-- 출근 등록 모달 -->
	<div class="row">
		<div class="modal" id="modal1" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						알림
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						출근 등록이 완료되었습니다.
					</div>
				</div>
			</div>
		</div>
	</div>
    <!-- 퇴근 등록 모달 -->
	<div class="row">
		<div class="modal" id="modal2" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						알림
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body"">
						퇴근 등록이 완료되었습니다.
					</div>
				</div>
			</div>
		</div>
	</div>
<%@include file="../common/footer.jsp"%>