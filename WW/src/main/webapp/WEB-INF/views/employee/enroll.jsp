<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="${ path }/resources/css/enroll.css">
	<link href="${ path }/resources/js/enroll.js">
	<script src="https://code.jquery.com/jquery-latest.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script >
			function addressOpen(){
		        daum.postcode.load(function() {
		            new daum.Postcode({
		                oncomplete: function(data) {
		                    // 팝업에서 검색 결과 항목을 클릭했을 때 실행할 코드를 작성
		                    
		                    // 각 주소의 노출 규칙에 따라 주소를 조합
		                    // 내려오는 변수가 값이 없으면 공백('')을 가지르모. 이를 참고하여 분기
		                    var addr = ''; // 주소 변수
		
		                    // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다
		                    if (data.userSelectedType === 'R') {
		                        addr = data.roadAddress;
		                    } else {
		                        daar = data.jibunAddress;
		                    }
		                document.getElementById('#userEdress').value = data.address;
		            }
		        })
		    }).open();
		}
	</script>

<title>Insert title here</title>
</head>
<body>
	<div id="wrapper">
		<div id="content">
            <div class="logo">
                <h2 id="logo">Sign Up To WhereWare</h2>
            </div>
            <form name="employeeEnrollFrm" action="${ path }/employee/enroll" method="post" >
                <div class="form-group">
                    <h3>
                        <label for="userId">아이디</label>
                    </h3>
                    <span class="box_int">
                        <input type="text" id="userId" placeholder="아이디를 입력하세요"/>
                </span>
                <button id="idCheckBtn">확인</button>
                <p class="error_id" ></p>
			</div>
			<div class="form-group">
                <h3>
                    <label for="userPwd">비밀번호</label>
                </h3>
                <span class="box int_pwd">
                    <input type="password" id="userPwd" placeholder="비밀번호를 입력하세요"/>
                </span>
                <span class="error_pwd"></span>
			</div>
			<div class="form-group">
                <h3>
                    <label for="userPwdCheck">비밀번호 재확인</label>
                </h3>
                <span class="box int_pwd_check">
                    <input type="password" id="userPwdCheck" placeholder="비밀번호를 다시 입력하세요"/>
                </span>
                <span class="error_pwdCk"></span>
			</div>
			<div class="form-group">
                <h3>
                    <label for="userName">이름</label>
                </h3>
                <span class="box int_name">
                    <input type="text" id="userName" placeholder=""/>
                </span>
                <span class="error_name"></span>
			</div>
            <div class="form-group">
                <h3>
                    <label for="userPhone">전화번호</label>
                </h3>
                <span class="box int_phone">
                    <input type="text" id="userPhone" placeholder="‘-’ 를 제외한 11자리를 입력해주세요"/>
                </span>
                <span class="error_phone"></span>
			</div>
            <div class="form-group">
                <h3>
                    <label for="userEmail">이메일</label>
                </h3>
                <span class="box int_email">
                    <input type="text" id="userEmail" placeholder="you@ssss.com"/>
                </span>
                <span class="error_email"></span>
			</div>
            <div class="form-group">
                <h3>
                    <label for="userEddress">주소</label>
                </h3>
                <span class="box_int">
                    <input type="text" id="userEdress" placeholder="" />
                </span>
                <span class="error_eddress"></span>
                <button type="button" id="addressBtn" onclick="addressOpen();">찾기</button>
			</div>
            
            <!-- BIRTH -->
            <div class="form-group">
                <h3><label for="yy">생년월일</label></h3>
                
                <div id="bir_wrap">
                
                    <!-- BIRTH_YY -->
                    <div id="bir_yy">
                        <span class="box">
                            <input type="text" id="yy" class="int" maxlength="4" placeholder="년(4자)">
                        </span>
                    </div>
                    
                    <!-- BIRTH_MM -->
                    <div id="bir_mm">
                        <span class="box">
                            <select id="mm">
                                <option>월</option>
                                <option value="01">1</option>
                                <option value="02">2</option>
                                <option value="03">3</option>
                                <option value="04">4</option>
                                <option value="05">5</option>
                                <option value="06">6</option>
                                <option value="07">7</option>
                                <option value="08">8</option>
                                <option value="09">9</option>                                    
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                        </span>
                    </div>
                    
                    <!-- BIRTH_DD -->
                    <div id="bir_dd">
                        <span class="box">
                            <input type="text" id="dd" class="int" maxlength="2" placeholder="일">
                        </span>
                    </div>

                </div>
                <span class="error_birth"></span>    
            </div>
            <div id="terms_area">
                <input type="checkbox" name="terms" id="terms" >
                <label for="terms">WhereWare에서 제공하는 서비스 약관에 동의합니다.</label>
                <button type="button" id="open_joinForm" onclick="location.href=''">약관보기</button>
            </div>
        </form>
            <div class="btn_area">
                <button type="submit" id="enroll_btn">
                    <span>가입하기</span>
                </button>
            </div>
		</div>
	</div>
	
	 <script>
	// 아이디 중복 확인
	$(document).ready(() => {
		$("#idCheckBtn").on("click", () => {
			let userId = $("#userId").val().trim();
			
			$.ajax({
				type: "post",
				url: "${ pageContext.request.contextPath }/member/idCheck",
				dataType: "json",
				data: {
					userId
				},
				success: (data) => {
					console.log(data);
					
					if(data.duplicate === true) {
						alert("이미 사용중인 아이디 입니다.");
					} else {
						alert("사용 가능한 아이디 입니다.");						
					}
					
				},
				error: (error) => {
					console.log(error);
				}
			});
		});	
	});
</script>
	
</body>
</html>