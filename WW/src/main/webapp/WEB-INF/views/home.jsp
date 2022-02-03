<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>

	<p>
		<a href="${ path }/calendar/calendar"> 일정관리 </a>
	<p>
	<p>
		<a href="${ path }/cmt/dashBoard"> 근태관리 </a>
	</p>



</body>
</html>
