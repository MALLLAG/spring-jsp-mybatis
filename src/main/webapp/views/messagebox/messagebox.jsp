<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		url(https://hdwallsource.com/img/2016/8/world-map-computer-wallpaper-51297-52993-hd-wallpapers.jpg);
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
	<form id="form12" action="messageDelete">
		<div class="container" style="margin-right: 250px; width: 70%;">
			<div class="table-responsive"
				style="background-color: white; border: 1px solid Gainsboro; border-radius: 20px; padding: 10px; box-shadow: 12px 0 15px -4px rgba(143, 145, 150, 0.8), -12px 0 15px -4px rgba(143, 145, 150, 0.8)"
			>
				<h2>쪽지함</h2>
				<table id="customers" class="table table-striped mat">
					<colgroup>
						<col style="width: 20%; background-color: #eeeeee;" />
						<col style="width: 60%;" />

					</colgroup>
					<thead>
						<tr>
							<th>보낸사람</th>
							<th>내용</th>
							<th>기타</th>
		
						<tr>
					</thead>
					<thead>
						<tr>
							<c:forEach var="i" items="${messagelist }" varStatus="status">
							<c:url var="link" value="messageRead">
					<c:param name="messageno" value="${i.messageno}" />
						</c:url>	
								<tr>
								
								<td>
										<c:out value="${i.sno }" />
								</td>
								
								<td>
								<c:choose>
									<c:when test="${fn:length(i.mcontent)>20 }">
										<a href="${link }"><c:out value="${fn:substring(i.mcontent,0,19) }" />...</a>
									</c:when>
									<c:otherwise>
										<a href="${link}"><c:out value="${i.mcontent }" /></a>
									</c:otherwise>
								</c:choose>
								</td>

									<td>
										<input type="hidden" name="messageno" value="<c:out value="${i.messageno}"/>">
										<a href="messagebox?rno=${sessionScope.userno}" onclick="form12.submit()">삭제</a>
									</td>
								</tr>
							</c:forEach>
						</tr>
					</thead>
				</table>
			</div>

		</div>
		</form>
	</article>

</body>
</html>

