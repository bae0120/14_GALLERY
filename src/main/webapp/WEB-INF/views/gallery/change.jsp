<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="../resources/js/jquery-3.6.0.js"></script>
<script>
	$(function(){
		
		// 수정완료
		$('#f').on('submit', function(event){
			if($('#title').val() == '${gallery.title}' && $('#content').val() == '${gallery.content}' && $('#files').val() == ''){
				alert('변경된 내용이 없습니다.');
				event.preventDefault();
				return false;
			}
			return true;
		})
		
		//첨부 파일 사전 점검(확장자, 크기)
		$('#files').on('change', function(){
			//첨부 규칙
			//(.*) :  파일명 관심없음
			//\.   : 마침표하나 나온다.
			//(jpg|png|gif)$ : 확장자는 이중 하나고 확장자로 끝난다.
			var regExt = /(.*)\.(jpg|png|gif)$/;	
			var maxSize = 1024 * 1024 * 10; //하나당 최대 크기
			//첨부 가져오기
			var files = $(this)[0].files; //외우기
			//각 첨부의 순회
			for(let i = 0; i < files.length; i++){
				//확장자 체크
				if(regExt.test(files[i].name) == false ){	//files[i].name : 첨부된 파일의 이름
					alert('이미지만 첨부할 수 있습니다.');
					$(this).val('');	//첨부된 파일이 모두 없어짐.
					return;
				}	
				//파일 크기 체크
				if(files[i].size > maxSize) {			//files[i].size : 첨부된 파일의 크기
					alert('10MB 이하의 파일만 첨부할 수 있습니다.');
					$(this).val('');
					return;
				}
			}
		})
		
		$('#btnList').on('click', function(){
			location.href='${contextPath}/gallery/list';
		})
	})
</script>
</head>
<body>
	
	<h1>갤러리 수정화면</h1>
	<form id="f" action="${contextPath}/gallery/change" method="post" enctype="multipart/form-data">
		번호 ${gallery.galleryNo}<br>
		작성자 ${gallery.writer}<br>
		작성일 ${gallery.created}<br>
		수정일 ${gallery.modified}<br>
		<input type="hidden" name="galleryNo" value="${gallery.galleryNo}">
		제목 <input type="text" name="title" id="title" value="${gallery.title}"><br>
		내용 <input type="text" name="content" id="content" value="${gallery.content}"><br>
		첨부 추가 <input type="file" name="files" id="files" multiple="multiple"><br><br>
		
		<button>수정완료</button>
		<input type="button" value="목록" id="btnList">
	</form>
	
	<hr>
	
	<div>첨부 목록 삭제</div>
	<c:forEach items="${fileAttaches}" var="fileAttach">
		<div>${fileAttach.origin}
			<a href="${contextPath}/gallery/removeFileAttach?fileAttachNo=${fileAttach.fileAttachNo}&galleryNo=${fileAttach.galleryNo}">
				<i class="fa-solid fa-circle-xmark"></i>
			</a>
		</div>
	</c:forEach>
	<hr>
	
	<c:forEach items="${fileAttaches}" var="fileAttach">
		<div><img alt="${fileAttach.origin}" src="${contextPath}/gallery/display?fileAttachNo=${fileAttach.fileAttachNo}" width="300px"></div>
	</c:forEach>
</body>
</html>