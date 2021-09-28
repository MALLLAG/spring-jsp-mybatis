<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/header.jsp"%>
<%@ include file="../layout/sidebar.jsp"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/normalize.css">
<link rel="stylesheet" href="css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous"
>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board1</title>
<style>
/*https://mblogthumb-phinf.pstatic.net/MjAxNzA4MDNfMSAg/MDAxNTAxNzI4MTg3NDUz.t5-PGXz8Dr28VX9YECCfB8BcmfxgAyRCrRrjZ3TPe7og.VM2xsS7-p4-m6jdCcDVfYDmdlxgEP6mG1R9EyrPyoRQg.JPEG.yesoljee/NaverBlog_20170803_114307_06.jpg?type=w2
https://blog.kakaocdn.net/dn/VlIJI/btqDFpvV0BE/2R5H3frG85YHPR8nKWvrN1/img.jpg

*/
body {
	background-image:
		url(https://image.freepik.com/free-photo/textured-background-in-white-tone_53876-128610.jpg);
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<script>
	$(document).on('click', '#btnWriteForm', function(e) {
		e.preventDefault();
		location.href = "${pageContext.request.contextPath}/boardForm";
	});
</script>
<body>
	<br>
	<br>
	<br>
	<br>
	<article>
		<div class="container" style="margin-right: 250px; width: 70%;">
			<div class="table-responsive"
				style="background-color: white; border: 1px solid Gainsboro; border-radius: 20px; padding: 10px; box-shadow: 12px 0 15px -4px rgba(143, 145, 150, 0.8), -12px 0 15px -4px rgba(143, 145, 150, 0.8)"
			>
				<h2>게시판</h2>
				<table id="customers" class="table table-striped mat">
					<colgroup>
						<col style="width: 20%; background-color: #eeeeee;" />
						<col style="width: 15%;" />
						<col style="width: 15%;" />
						<col style="width: 15%;" />
					</colgroup>
					<thead>
						<tr>
							<th></th>
							<th>업체명</th>
							<th>이메일</th>
							<th>기타</th>
							
						<tr>
					</thead>
					<thead>
						<tr>
							<c:forEach var="i" items="${userlist }" varStatus="status">
								<c:url var="link" value="adminRead">
									<c:param name="userno" value="${i.userno }" />
								</c:url>
								<tr>
									<td>
										<img src="${i.img }" alt="Avatar" class="avatar" width="250" , height="200" />
									</td>
									<td>
										<c:out value="${i.name }" />
									</td>
									<td>
										<a href="${link }"><c:out value="${i.email }" /></a>
									</td>
									<td>
										<a href="messageForm?rno=<c:out value="${i.userno}"/>">쪽지보내기</a>
									</td>

								</tr>
							</c:forEach>
						</tr>
					</thead>
				</table>
			</div>

		</div>
	</article>

</body>
</html>
<%@ include file="../layout/footer.jsp"%>
