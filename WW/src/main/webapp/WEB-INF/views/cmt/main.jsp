<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<!-- 이모티콘 -->
<script src="https://kit.fontawesome.com/616f27e0c4.js" crossorigin="anonymous"></script>

<!-- css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/ldit_header.css" /><!-- header css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/ldit_aside.css" /><!-- main css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/basic.css" /><!-- basic css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/main.css" /><!-- main css -->

<!-- jquery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>Insert title here</title>
</head>
<body>
	<c:if test="${!empty authMsg}">
	<script>
		alert("${authMsg}");
	</script>
	</c:if>
	<%@include file="../common/header.jsp"%>
	<section>
        <article id="a1">
            <h1 class="mobileTitle">내정보</h1>
            <div id="myInfo">
                <h3 id="miName">${loginMember.name}</h3>
                <c:choose>
                	<c:when test="${!empty cmt.cmt_srt}">
	                	<div id="miToday">
		                    <p id="miGo">출근</p>
		                    <p id="miGoTime">${cmt.cmt_srt}</p>
		                    <p id="miOut">퇴근</p>
		                    <p id="miOutTime">${cmt.cmt_end}</p>
		                </div>
                	</c:when>
                	<c:otherwise>
                		<div id="miToday">
                			<button id="checkin_btn">오늘의 근무 시작</button>
                		</div>
                	</c:otherwise>
                </c:choose>
                <p id="miWeekHour">주간 근무시간</p>
                <progress value="60" max="100"></progress>
                <p id="miMonthHour">월간 근무시간</p>
                <progress value="20" max="100"></progress>
            </div>
                <h1 style="text-align: left;font-size: 1.4rem">오늘의 근무 정보</h1>
				<div>
					<c:choose>
						<c:when test="${empty cmt.cmt_end}">
							<p id="miHour">일이 즐거우면 인생은 낙원이다</p>
						</c:when>
						<c:otherwise>
							<p id="miHour">오늘 총 근무시간 | ${todayHours}시간 ${todayMinutes}분</p>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${empty cmt.cmt_rs || cmt.cmt_rs eq '::'}">
							<p id="miHour">따뜻한 미소는 친절을 표현하는 세계 공통어이다</p>
						</c:when>
						<c:otherwise>
							<p id="restHour">오늘 총 휴식시간 | ${cmt.cmt_rs}</p>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
        </article>
        
    </section>
    
    <script type="text/javascript">
    //location.reload();
    	
    	    
    	//출근
    $(document).ready(function() {
    	$("#checkin_btn").click(function () {
    		$.ajax({
    			url : "checkin"
    			, data: {emp_no : "${loginMember.no}"}
    			, type : "post"
    			, success: function(data) {
    				location.reload();
    			}
    			, error : function(request, status, errorData){ 
    				 alert("error code : " + request.status + "\n" 
    						 + "message : " + request.responseText + "\n" 
    						 + "error : " + errorData);}
    		});
		});
    });
    </script>
</body>
</html>