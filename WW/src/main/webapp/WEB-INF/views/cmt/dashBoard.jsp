<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${ pageContext.request.contextPath }" /><%@ taglib
	uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
						<div style="margin-top: 10px; margin-bottom: 30px;">2022년 2월
							3일</div>
						<div style="margin-bottom: 40px;">
							출근 시간
							<div style="font-size: 1.5em; font-weight: bold;">09:00</div>
						</div>
						<div style="margin-bottom: 40px;">
							퇴근 시간
							<div style="font-size: 1.5em; font-weight: bold;">18:00</div>
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
										class="btn float-right" value="근무 수정 요청">
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

<!-- Footer -->
<footer class="sticky-footer bg-white">
	<div class="container my-auto">
		<div class="copyright text-center my-auto">
			<span>Copyright &copy; Your Website 2020</span>
		</div>
	</div>
</footer>
<!-- End of Footer -->

</div>
<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top"> <i
	class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">Select "Logout" below if you are ready
				to end your current session.</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
				<a class="btn btn-primary" href="login.html">Logout</a>
			</div>
		</div>
	</div>
</div>

<%@include file="../common/footer.jsp" %>