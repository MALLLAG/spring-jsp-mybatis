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
		background-image: url(https://hdwallsource.com/img/2016/8/world-map-computer-wallpaper-51297-52993-hd-wallpapers.jpg);
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
<form name="form1" action="boardSave">
<div class="container">
  <h2>의뢰하기</h2>          
  <table class="table table-hover">
    <tbody>
      <tr>
      	<td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="40"></td>
      </tr>
      
      <tr>
      	<td><textarea type="text" class="form-control" placeholder="글 내용을 작성하세요" name="content" maxlength="1024" style="height: 400px;"></textarea></td>
      </tr>
    </tbody>
    	
  </table>
  <div style="text-align: right;">
  <input type="hidden" name="userno" value="<c:out value="${sessionScope.userno}"/>"> 
  <input type="submit" class="btn btn-primary pull-right" id="btnListForm" value="글목록"> 
  <button  class="btn btn-primary pull-right"><a style="text-decoration:none; color:white;" href="#" onclick="form1.submit()">저장</a></button>
	</div>
</div>

</form>
</body>
</html>
<%@ include file="layout/footer.jsp"%>
