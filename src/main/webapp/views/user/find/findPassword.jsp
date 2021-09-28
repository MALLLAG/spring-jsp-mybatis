<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/normalize.css">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 
</head>
<body>

<!-- 	<div class="container">
		<form name="form11" action="findPasswordAfter">
			<h2>글쓰기</h2>
			<table class="table table-dark table-striped">
				<thead>
					<tr>
						<th>이름</th>
						<th><input type="text" name="name" size="70" maxlength="250"></th>
						<th>전화번호</th>
						<th><input type="text" name="phonnumber" size="70" maxlength="250"></th>
						<th>이메일</th>
						<th><input type="text" name="email" size="70" maxlength="250"></th>
						
					</tr>

					
			</table>
	
			<a href="#" onclick="form11.submit()">찾기</a>
		</form>
	</div>
 -->

<div id = "sample2" class="content">
<br><br>
<div class="container">
	<div class="input-form-backgroud row"> 
		<div class="input-form col-md-12 mx-auto"> 
			<div style="margin-bottom: 50px">
				<h4 class="mb-3">비밀번호 찾기</h4>
			</div> 
			<form class="validation-form"  name="form11" action="findPasswordAfter">
			<div style="margin-top: 20px;">
			</div>
				<div class="form-group">
					<input  style="background-color:WhiteSmoke; border-color:white;" type="text" name="name"  class="form-control" placeholder="이름을 입력하세요" >
				</div>
  
  				<div class="form-group">
					<input  style="background-color:WhiteSmoke; border-color:white;" type="text" name="phonnumber"  class="form-control" placeholder="전화번호를 입력하세요." >
				</div>
				
				<div class="form-group">
					<input  style="background-color:WhiteSmoke; border-color:white;" type="text" name="email"  class="form-control" placeholder="이메일을 입력하세요" >
				</div>

				<a class="btn btn-primary btn-lg btn-block"  href="#" onclick="form11.submit()">찾기</a>
				</form>
			</div>
		</div>
	</div>
</div>


</body>
</html>