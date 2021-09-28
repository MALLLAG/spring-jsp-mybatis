<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/header.jsp"%>

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
<meta charset="UTF-8">
<title>board1</title>
</head>
<body>
<br>
<div class="container">

		<table class="table table-dark table-striped">
			<thead>
				<tr>
					<c:forEach var="i" items="${searchList }" varStatus="status">
				<c:url var="link" value="boardRead">
					<c:param name="boardno" value="${i.boardno}" />
				</c:url>	
				<tr>
					<td><a href="${link }"><c:out value="${i.title }" /></a></td>
				</tr>
			</c:forEach>	
		
				

				</tr>
			</thead>
		
		</table>


	</div>




<!--  
	<a href="viewForm">글쓰기</a>
	<table border="1" style="width:600px">
		<caption>게시판</caption>
		<colgroup>
			<col width='8%' />
			<col width='15%' />
		</colgroup>
		<thead>
			<tr>

				<th>title</th>
				<th>content</th>


			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" items="${list }" varStatus="status">
				<c:url var="link" value="viewRead">
					<c:param name="boardno" value="${i.boardno}" />
				</c:url>	
				<tr>

					<td><a href="${link }"><c:out value="${i.title }" /></a></td>
					<td><c:out value="${i.content }"></c:out></td>	
				
				</tr>
			</c:forEach>	
		
	
		</tbody>
	</table>
	-->
</body>
</html>
<%@ include file="../layout/footer.jsp"%>
