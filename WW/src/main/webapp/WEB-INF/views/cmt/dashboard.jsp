<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />
<%
String ctxPath = request.getContextPath();
%>
<%
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@include file="../common/header.jsp"%>

<c:if test="${!empty authMsg}">
	<script>
		alert("${authMsg}");
	</script>
</c:if>
<!-- Begin Page Content -->
<section> <article id="a1">
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
					<div style="margin-top: 10px; margin-bottom: 30px;"><%=sf.format(nowTime)%></div>
					<c:choose>
						<c:when test="${!empty cmt.cmt_srt}">
							<div id="miToday">
								<p>출근</p>
								<p style="font-size: 1.5em; font-weight: bold;"
									id="checkin_time">${cmt.cmt_srt}</p>
							</div>
						</c:when>
						<c:when test="${empty cmt.cmt_srt}">
							<div id="miToday">
								<button class="btn btn-primary btn-sm" id="checkin_btn">출근
									등록</button>
							</div>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${empty cmt.cmt_end and !empty cmt.cmt_srt}">
							<div id="miToday">
								<button type="submit" class="btn btn-primary btn-sm"
									onclick="fnCheckOut()" id="btn_check">퇴근 등록</button>
							</div>
						</c:when>
						<c:when test="${!empty cmt.cmt_end}">
							<div id="miToday">
								<p>퇴근</p>
								<p id="checkout_time"
									style="font-size: 1.5em; font-weight: bold;">${cmt.cmt_end}</p>
							</div>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${ !empty cmt.cmt_srt and !empty cmt.cmt_end }">
							<p>근무시간</p>
							<p style="font-size: 1.5em; font-weight: bold;">${ todayHours }시간
								${ todayMinutes }분</p>
						</c:when>
					</c:choose>
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
							aria-valuenow="75" aria-valuemin="20" aria-valuemax="100"></div>
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
									<th>-</th>
								</tr>
							</tfoot>
							<tr>
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
											<td>-</td>
										</tr>
									</c:forEach>
								</c:if>
							</tr>
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
</article> </section>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<!-- End of Footer -->

</div>
<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->
<!-- 출근 등록 모달 
<div class="row">
	<div class="modal" id="modal1" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					알림
					<button class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">출근 등록이 완료되었습니다.</div>
			</div>
		</div>
	</div>
</div>
-->
<!-- 퇴근 등록 모달 -->
<div class="row">
	<div class="modal" id="modal2" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					알림
					<button class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body"">퇴근 등록이 완료되었습니다.</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	//location.reload();
	let ckInterval = "";
	let attNoFormat = "";
	let attStartFormat = "";
	let attEndFormat = "";
	let attStartDateTime = "";
	let elapsedWTime = "";
	let elapsedRTime = "";

	let today = new Date();
	let tomorrow = new Date(today.setDate(today.getDate() + 1));
	let tomorrowYear = tomorrow.getFullYear();
	let tomorrowMonth = (tomorrow.getMonth() + 1);
	let tomorrowDate = tomorrow.getDate();
	let minDate = tomorrowYear + "-" + tomorrowMonth + "-" + tomorrowDate;
	$("#whStart").attr('min', minDate);
	$("#whEnd").attr('min', minDate);

	$(document).ready(
			function() {
				$.ajax({
					url : "attmaingetdata",
					type : "post",
					dataType : "json",
					success : function(data) {
						if (!isNull(data.cmt)) {
							attStartFormat = data.cmt.cmt_srt;
							attEndFormat = data.cmt.cmt_end;
						}
						attStartDateTime = data.attStartDateTime;
						elapsedWTime = data.elapsedWTime;
						if (!isNull(attStartFormat) && isNull(attEndFormat)) {
							ckInterval = setInterval(countTime, 1000);
							$("#btn_check").attr('href',
									"javascript:fnCheckOut()");
							$("#btn_check").html("퇴근");
						}
						if (!isNull(attStartFormat) && !isNull(attEndFormat)) {
							$("#btn_check").attr('href', "#");
							$("#btn_check").addClass('notable');
							$("#btn_check").html("출근");
						}

						$("#checkin_time").html(
								setDefaultValueAtNull(attStartFormat));
						$("#checkout_time").html(
								setDefaultValueAtNull(attEndFormat));
						$("#working_time").html(
								setDefaultValueAtNull(elapsedWTime));
						if (elapsedRTime == "::") {
							elapsedRTime = "00:00:00";
						}

					},

					error : function(request, status, errorData) {
						console.log("error code : " + request.status + "\n"
								+ "message : " + request.responseText + "\n"
								+ "error : " + errorData);
					}
				});

			});

	//출근
	$("#checkin_btn").click(
			function() {
				$.ajax({
					url : "checkin",
					data : {
						emp_no : "${loginMember.no}"
					},
					type : "post",
					success : function(data) {
						location.reload();
					},
					error : function(request, status, errorData) {
						console.log("출근 error code : " + request.status + "\n"
								+ "message : " + request.responseText + "\n"
								+ "error : " + errorData);
					}
				});
			});

	// 퇴근
	function fnCheckOut() {
		console.log("퇴근버튼누름");
		$
				.ajax({
					url : "checkout",
					data : {
						emp_no : "${loginMember.no}"
					},
					type : "post",
					success : function(data) {
						console.log(data);
						if (!isNull(data)) {
							$("#btn_check").attr('href', "#");
							$("#btn_check").addClass('notable');
							$("#btn_check").html("출근");
							$("#checkout_time").html(data);
							clearInterval(ckInterval);
						} else {
							alert("퇴근등록에 실패했습니다.");
							location.reload();
						}
					},
					error : function(request, status, errorData) {
						console.log("퇴근 error code : " + request.status + "\n"
								+ "message : " + request.responseText + "\n"
								+ "error : " + errorData);
					}
				});
	}

	// 근무내역 조회
	getPageWork(1);
	function getPageWork(page) {
		$
				.ajax({
					url : "getattlist",
					data : {
						emp_no : "${loginMember.no}",
						currentPage : page
					},
					type : "get",
					dataType : "json",
					success : function(data) {
						var result = data.attList;
						let totalWorkTime = "";
						if (result.length == 0) {
							$("#div_wh_contents").html("");
							$("#div_wh_contents")
									.html(
											'<ul><li class="li_no_xaList">근무 내역이 없습니다.</li></ul>');
						} else {
							<!--리스트불러오기-->
							var r = '';
							$
									.each(
											result,
											function(i) {
												let attSTime = "";
												let attETime = "";
												r += '<div>';
												r += '<ul>';
												r += '<li>' + result[i].cmt_no
														+ '</li>'; //근무일자
												if (restCode == 1
														&& isNull(restAllTime)) {
													attSTime = attTimeFormat(result[i].attStart);
													attETime = attTimeFormat(result[i].attEnd);
													totalWorkTime = calTimeTwo(
															attSTime, attETime);
												} else if (restCode == 1
														&& !isNull(restAllTime)) {
													attSTime = attTimeFormat(result[i].attStart);
													attETime = attTimeFormat(result[i].attEnd);
													totalWorkTime = calTimeThree(
															attSTime, attETime,
															restAllTime);
												} else {
													attSTime = attTimeFormat(result[i].attStart);
													attETime = attTimeFormat(result[i].attEnd);
													totalWorkTime = calTimeTwo(
															attSTime, attETime);
												}
												r += '<li>' + totalWorkTime
														+ '</li>'; //총근무시간
												r += '<li>'
														+ timeFormat(result[i].attStart)
														+ '</li>'; //출근시각					
												r += '<li>'
														+ timeFormat(result[i].attEnd)
														+ '</li>'; //퇴근시각
												if (isNull(restAllTime)) {
													restAllTime = "00:00:00";
												}
												r += '<li>' + restAllTime
														+ '</li>';
												r += '</ul>';
												r += '</div>';
											})
							$("#div_wh_contents").html("");
							$("#div_wh_contents").html(r);
							<!--페이징처리-->
							var p = '';
							for (var d = data.startPage; d <= data.endPage; d++) {
								if (d == data.currentPage) {
									p += '<li>'
											+ '<a href="javascript:getPageWork('
											+ d
											+ ')" name="a_current" class="a_current">'
											+ d + '</a>' + '</li>';
								} else {
									p += '<li>'
											+ '<a href="javascript:getPageWork('
											+ d + ')">' + d + '</a>' + '</li>';
								}
							}
							$("#div_wh_paging > ul").html("");
							$("#div_wh_paging > ul").html(p);
						}
					},
					error : function(request, status, errorData) {
						console.log("근무내역 error code : " + request.status + "\n"
								+ "message : " + request.responseText + "\n"
								+ "error : " + errorData);
					}
				});
	};

	function wh_showhide() {
		var t_drc = $("#div_wh_contents");
		t_drc.toggle();
	};
</script>
<%@include file="../common/footer.jsp"%>