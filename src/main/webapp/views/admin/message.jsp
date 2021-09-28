<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<div class="container">
	${sessionScope.userno}
	<form name="form4" action="sendMessage">
		<h2>글쓰기</h2>
		<table class="table table-dark table-striped">
			<tbody>
				<tr>
					<td>내용</td>
					<td>
						<textarea name="mcontent" rows="5" cols="60"></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<input type="hidden" name="userno" value="<c:out value="${sessionScope.userno}"/>">
		<a href="#" onclick="form4.submit()">전송</a>
	</form>
</div>

</html>
<%@ include file="../layout/footer.jsp"%>