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
body {
	background-image:
		url(https://hdwallsource.com/img/2016/8/world-map-computer-wallpaper-51297-52993-hd-wallpapers.jpg);
	background-size: cover;
}
</style>
</head>
<script>
	$(document).on('click', '#btnListForm', function(e) {
		e.preventDefault();
		location.href = "${pageContext.request.contextPath}/boardList";
	});
</script>
<body>
	<br>
	<br>
	<br>
	<br>
	<form>
		<div class="container">
			<table class="table">
				<thead>
					<tr>
						
						<td>
							
							<input style="cursor:default" onfocus="this.blur()" readonly="readonly"  type="text" class="form-control" placeholder="글 제목" name="title" maxlength="40" value="<c:out value="${boardInfo.title }"/>">
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						
						<td>
							<textarea onfocus="this.blur()" readonly="readonly"  class="form-control" name="content" style="height: 400px; cursor: default"><c:out value="${boardInfo.content}" /></textarea>
						</td>
					</tr>
				</tbody>
			</table>
			<a style="float:right; font-color:white" href="#" onclick="history.back(-1)" class="btn btn-warning">의뢰목록</a> 
			<c:choose>
				<c:when test="${sessionScope.userno == boardInfo.userno }">
			<a style="float:right;" href="boardDelete?boardno=<c:out value="${boardInfo.boardno}"/>"  class="btn btn-danger">삭제</a>
			
			<a style="float:right;" href="boardUpdate?boardno=<c:out value="${boardInfo.boardno}"/> "class="btn btn-primary">수정</a>
				</c:when>
			</c:choose>
		</div>
	</form>
	
	<br><br>
	
	<c:choose>
		<c:when test="${sessionScope.roletype == 'ADMIN' }">
			<div class="container">
				<!-- replySave -->
				<form name="form2" action="insertReply">
					<h4>댓글</h4>
					<table class="table table-hover">

						<tbody>
							<tr>
								<!-- reply -->
								<td>
									<tr>
									<textarea  class="form-control"  name="replycontent" rows="5" cols="100"></textarea>
									<a style = "float:right;" href="boardRead?boardno=${boardInfo.boardno}" onclick="form2.submit()" class="btn btn-success">저장</a>
									</tr>
								</td>
							</tr>
						</tbody>
					</table>
					<input type="hidden" name="boardno" value="<c:out value="${boardInfo.boardno}"/>">
					<input type="hidden" name="userno" value="<c:out value="${sessionScope.userno}"/>">
					

				</form>

			</div>
		</c:when>
		<c:otherwise>

		</c:otherwise>
	</c:choose>

	<div class="container">
		<form name="form3" action="replyDelete">
		<table class="table table-hover">
			<thead>
				<tr>
					<c:forEach var="i" items="${replylist }" varStatus="status">

						<tr>
							<td>
								<c:out value="${i.name }" />
							</td>
							<td>
								<c:out value="${i.replycontent }" />
							</td>
							<td>
								<c:out value="${i.nowdate }" />
							</td>
		
							
							<td>
								<input type="hidden" name="replyno" value="<c:out value="${i.replyno}"/>">
								<c:choose>
									<c:when test="${sessionScope.userno == i.userno }">
								<a href="boardRead?boardno=${boardInfo.boardno}" onclick="form3.submit()">삭제</a>
									</c:when>
								</c:choose>
							</td>
						</tr>

					</c:forEach>

				</tr>
			</thead>
		</table>
		</form>

	</div>
	
</body>
</html>
<%@ include file="layout/footer.jsp"%>
