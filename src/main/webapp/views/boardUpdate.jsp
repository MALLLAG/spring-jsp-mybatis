<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="layout/header.jsp"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>글쓰기창</title>
<style>
	body{
		background-image: url(https://image.freepik.com/free-photo/textured-background-in-white-tone_53876-128610.jpg);
		background-size: cover;
	}
</style>
</head>
<script>
	$(document).on('click', '#btnListForm', function(e){
		e.preventDefault();	
		location.href = "${pageContext.request.contextPath}/boardList";
	});
</script>
<body>
<br><br><br><br>
	<div class="container">
		<form name="form1" action="boardUpdateSave">
			<h2>글쓰기</h2>
			<table class="table table-hover">
				<thead>
					<tr>
						
						<td>
							
							<input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="40" value="<c:out value="${boardInfo.title }"/>">
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						
						<td>
							<textarea class="form-control" name="content" style="height: 400px;"><c:out value="${boardInfo.content}" /></textarea>
						</td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" name="boardno" value="<c:out value="${boardInfo.boardno}"/>">
			<a href="#" onclick="form1.submit()">저장</a> 
			<a href="#" onclick="history.back(-1)">돌아가기</a>

		</form>
	</div>

</body>
</html>
<%@ include file="layout/footer.jsp"%>
