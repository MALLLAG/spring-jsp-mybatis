<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	html, body{
	overflow: auto;
	}

	body { 
  		 background-color:white;
		} 
	.input-form { 
	max-width: 380px; 
	margin-top: 80px; 
	padding: 25px;
	background-color: white; 
	-webkit-border-radius: 10px; 
	-moz-border-radius: 10px; 
	border-radius: 10px; 
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15); 
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15); 
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15) } 
</style>
</head>

<body>
<div class="container">
	<div class="input-form-backgroud row"> 
		<div class="input-form col-md-12 mx-auto"> 
		
			<h4 class="mb-3">로그인</h4> 
			
			<form class="validation-form" novalidate action="login" method="post" id="login">
			
				<div class="form-group">
					<input style="background-color:WhiteSmoke; border-color:white;" type="email" class="form-control" placeholder="이메일" name="email">
				</div>
  
  				<div class="form-group">
				    <input style="background-color:WhiteSmoke; border-color:white;"type="password" class="form-control" placeholder="비밀번호" name="password">
				</div>
  
				<button style="text-align: center;" class="btn btn-primary btn-lg btn-block" type="submit">로그인</button>
				
				<p style="text-align: center; color:grey;">
					<a href="">비밀번호 찾기</a> | <a href="">아이디 찾기</a> | <a href="joinFrom">회원가입</a>
				</p>
  
			</form>
			
		</div>
	</div>
</div>


</body>
</html>
<%@ include file="../layout/footer.jsp"%>