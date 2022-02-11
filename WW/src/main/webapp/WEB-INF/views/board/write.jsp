<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<%@include file="../common/header.jsp"%>
<link rel="stylesheet" type="text/css" href="${ path }/resources/css/board/write.css">
<link rel="stylesheet" type="text/css" href="${ path }/resources/css/board/utilwrite.css">

<!-- 클래식 에디터 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>

<!-- CKEditor 넓이 높이 조절 -->
<style>
    .ck.ck-editor {
        max-width: 1000px;
    }

    .ck-editor__editable {
        min-height: 300px;
    }
</style>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-1 text-gray-800">Whereware 게시판</h1>
	<p class="mb-4">서로 존중하는 공간입니다.</p>

	<div class="container-contact100">
		<div class="wrap-contact100">
			<form class="contact100-form validate-form">
				<span class="contact100-form-title">
					WhereWare
				</span>

				<label class="label-input100" for="first-name">Your Name *</label>
				<div class="wrap-input100 rs1 validate-input">
					<input id="first-name" class="input100" type="text" name="first-name" placeholder="사원명">
					<span class="focus-input100"></span>
				</div>
		
				<div class="wrap-input100 rs1 validate-input">
					<input class="input100" type="text" name="last-name" placeholder="부서명" readonly>
					<span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="email">Title *</label>
				<div class="wrap-input100 validate-input">
					<input id="title" class="input100" type="text" name="title" placeholder="제목을 입력하세요.">
					<span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="message">Content *</label>
				<div class="wrap-input100 validate-input">
					<div id="classic">
						<p>내용을 입력하세요(4000자)</p>
					</div>
					
					<span class="focus-input100"></span>
				</div>

				<label class="label-input100" for="phone">첨부파일</label>
				<div class="wrap-input100">
					<input id="upfile" class="input100" type="file" name="upfile">
					<span class="focus-input100"></span>
				</div>

				<div class="container-contact100-form-btn">
					<button class="contact100-form-btn">
						취소
					</button>
					<button class="contact100-form-btn">
						등록
					</button>
				</div>
			</form>
		</div>
	</div>

    <script>
        ClassicEditor
            .create(document.querySelector('#classic'))
            .catch(error => {
                console.error(error);
            });

    </script>
    


<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>
	
</div>
<%@include file="../common/footer.jsp"%>