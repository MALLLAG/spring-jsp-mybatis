<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../layout/header.jsp"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
	body{
		background-image: url(https://image.freepik.com/free-photo/textured-background-in-white-tone_53876-128610.jpg);
		background-size: cover;
	}
.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
}

img.avatar {
  width: 50%;
  border-radius: 50%;
}


</style>
</head>

<body>
<br><br><br><br>
<div style=" background-image: url(https://cdn.crowdpic.net/list-thumb/thumb_l_03C2D2771C4F86E7F64740DFB3ABF08A.png);
			  background-repeat: no-repeat; background-size:65%; height: 400px; margin-left: 45%;">
<form name="form5" action="messagebox">
<div class="container" style="text-align: left;">
		
		<img src="${sessionScope.img }" alt="Avatar" class="avatar"  width="80", height="320" style="margin-left:-70%; margin-top:8%; "/>
</div>	
		<div style="margin-top: -34%; margin-left:5%;">
		<ul style=" font-size:22px;">
			<li>이름 :<strong> ${sessionScope.name}</strong></li>
			<li>이메일 :<strong> ${sessionScope.email}</strong></li>
			<li>전화번호 :<strong> ${sessionScope.phonnumber}</strong></li>
			<li>주소 :<strong> ${sessionScope.address }</strong></li>
		</ul>
		
		
		<div style="margin-left: 23%; margin-top:7%; ">
   		<input type="hidden" name="rno" value="<c:out value="${sessionScope.userno}"/>"> 
   		<input type="hidden" name="userno" value="<c:out value="${sessionScope.userno}"/>"> 
			<a href="updateForm" style="text-decoration:none; color:black; height : 23px;">회원정보 수정</a>
			<a href="#" type="submit" onclick="form5.submit()" style="text-decoration:none; color:black;">쪽지함</a>
			<a href="deleteUser?userno=<c:out value="${sessionScope.userno}"/>"  class="btn btn-danger" onclick="return confirm('정말로 탈퇴하시겠습니까?\n탈퇴하시게 되면 모든 정보가 삭제됩니다.')  && call_function()">탈퇴하기</a>

		</div>
		</div>
</form>
</div>

</body>

			<script>
			function call_function(event){
  			alert('탈퇴가 완료되었습니다. 이용해주셔서 감사합니다.');
			}
			</script>
			
</html>
<br><br>
<%@ include file="../layout/footer.jsp"%>