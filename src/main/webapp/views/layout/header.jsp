<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
  <style>
#header{
	
	position: fixed;
  	top: 0;
  	/* width: 100% */
  	left: 0;
  	right: 0;
  	background-color:grey;
  	opacity: 0.7;
  	height: 60px;
}
	
div.nav{
	position: fixed;
	width:120%;
	margin-top:5%;
	left:0;
	top: 5;
	right: 0;
	z-index: 1;
	background-color: linear-gradient( rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.0) ), white;

}
  </style>
</head>
 	<div id="header" >
     	<div id="logo" style="float: left; margin-left: 15px; margin-top: 0px;">
     	<strong><a href="/test20" style="color:black; text-decoration:none; font-size:35px;">
     	<img src="views/image/logo.png" height="40" style=" margin-top: 10"></a></strong></div>
    	<div style="float: right; margin-top: 1%;" >

	        <ul class="nav" style="margin-top: 2px;">
	        <c:choose>
	        
				<c:when test="${sessionScope.userno == null}">
					<li><a href="joinForm" style=" font-size:20px; color:black; text-decoration:none; margin-right:25px; ">회원가입</a></li>
					<li><a href="loginForm" style=" font-size:20px; color:black; text-decoration:none; margin-right: 30px;">로그인</a></li>
				</c:when>
				
				<c:when test="${sessionScope.roletype == 'ADMIN' }">
					<li><a href="boardList" style=" font-size:20px; color:black; text-decoration:none; margin-right:25px;">의뢰목록</a></li>
					<li><a href="boardForm" style=" font-size:20px; color:black; text-decoration:none; margin-right:25px;">글쓰기</a></li>
					<li><a href="messagebox?rno=${sessionScope.userno }" style=" font-size:20px; color:black; text-decoration:none; margin-right:25px;">쪽지함  </a></li>		
					<li><a href="adminInfo" style=" font-size:20px; color:black; text-decoration:none; margin-right:25px;">마이페이지</a></li>
					<li><a href="logout" style=" font-size:20px; color:black; text-decoration:none; margin-right: 400px;">로그아웃</a></li>
				</c:when>
				
				
				<c:when test="${sessionScope.roletype == 'USER' }">
					<li><a href="boardList" style=" font-size:20px; color:black; text-decoration:none; margin-right:25px;">의뢰하기</a></li>
					<li><a href="userList" style=" font-size:20px; color:black; text-decoration:none;margin-right: 400px;">업체리스트</a></li>
					<li><a href="boardForm" style=" font-size:20px; color:black; text-decoration:none; margin-right:25px;">글쓰기</a></li>
					<li><a href="messagebox?rno=${sessionScope.userno }" style=" font-size:20px; color:black; text-decoration:none; margin-right:25px;">쪽지함  </a></li>		
					<li><a href="userInfo" style=" font-size:20px; color:black; text-decoration:none; margin-right:25px;">마이페이지</a></li>
					
					
					<li><a href="logout" style=" font-size:20px; color:black; text-decoration:none; margin-right: 20px;">로그아웃</a></li>
				</c:when>

			</c:choose>
			</ul>
    	</div> 
    	</div>
   	