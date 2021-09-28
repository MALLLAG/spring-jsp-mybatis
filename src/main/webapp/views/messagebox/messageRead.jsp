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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insert title here</title>
<style>
body {
	background-image:
		url(https://hdwallsource.com/img/2016/8/world-map-computer-wallpaper-51297-52993-hd-wallpapers.jpg);
	background-size: cover;
}
</style>
</head>
<body>
	<br><br><br><br>
<form>
		<div class="container">
			<table class="table table-hover">
				<thead>
									<td>
										<a href="messageForm?rno=<c:out value="${messageInfo.sno}"/>">답장하기</a>
									</td>
					<tr>
						
						<td>
							
							<input readonly="readonly"  type="text" class="form-control" name="sno" maxlength="40" value="<c:out value="${messageInfo.sno }"/>">
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						
						<td>
							<textarea readonly="readonly"  class="form-control" name="mcontent" style="height: 400px;"><c:out value="${messageInfo.mcontent}" /></textarea>
						</td>
					</tr>
				</tbody>
			</table>
			</div>
</form>
</body>
</html>