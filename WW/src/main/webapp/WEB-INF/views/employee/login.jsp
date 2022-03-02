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
<link rel="stylesheet" href="${ path }/resources/css/login.css">
<title>Insert title here</title>
</head>
<body>
	<section>
        <div id="wrapper">
            <div id="content">
                <div id="logo">
                    <h2>Login To WhereWare</h2>
                </div>

                <div class="form-group"> 
                    <span class="box int_id">
                        <input type="text" id="userId" class="input" placeholder="아이디를 입력하세요"/>
                    </span>
                </div>

                <div class="form-group">
                    <span class="box int_pwd">
                        <input type="password" id="userPwd" class="input" placeholder="비밀번호를 입력하세요"/>
                    </span>
                </div>

                <div>
                    <input type="checkbox" name="id_save" id="id_check" value="saveOk">아이디 기억하기 
                </div>
                
                <div>
                    <button type="submit" id="btn login_btn">로그인</button>
                </div>

                <h3 id="sns_area">SNS 간편 로그인</h3>

                <div id="btn_area">
                    <div>
                        <button type="button" id="naver_btn">네이버 간편 로그인</button>
                    </div>
                    <div>
                        <button type="button" id="kakao_btn">카카오 간편 로그인</button>
                    </div>
                    <div>
                        <button type="button" id="google_btn">구글 간편 로그인</button>
                    </div>
                </div>
            </div>
        </div>
    </section>


</body>
</html>