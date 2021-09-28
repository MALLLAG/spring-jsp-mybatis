<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>사이트 이름</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
 integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
body{
		background-image: url(https://image.freepik.com/free-photo/textured-background-in-white-tone_53876-128610.jpg);
		background-size: cover;
	}
</style>
</head>

<body>
	<div class="container">
	<br><br><br><br>
		<form action="updateSaveForm" method="post" id="updateSaveForm" enctype="multipart/form-data">

			<div class="form-group-3">
				<label for="name">이름</label>
				<input type="text" class="form-control" placeholder="${sessionScope.name }" name="name">
			</div>

			<div class="form-group">
				<label for="email">이메일</label>
				<input type="email" class="form-control" placeholder="${sessionScope.email }" name="email">
			</div>

			<div class="form-group">
				<label for="pwd">비밀번호</label>
				<input type="password" class="form-control" placeholder="" name="password">
			</div>

			<div class="form-group">
				<label for="Tel">전화번호</label>
				<input type="text" class="form-control" placeholder="${sessionScope.phonnumber }" name="phonnumber">
			</div>

			<div class="form-group">
				
					<div style="margin-top:-10px;"></div>	
					<div class="d-flex justify-content-end">
						<button type="button" class="btn btn-info" onClick="goPopup();">주소검색</button>
					</div>
					<input type="text"  placeholder="${sessionScope.address }" id="address" name="address" class="form-control" required readOnly>
			</div>

			<div class="form-group">
				<label for="img">IMG</label>
				<input type="file" class="form-control" name="file" />
			</div>
			
			<div style="center;">
			<button type="submit" class="btn btn-primary">변경사항 저장</button>
			</div>
		</form>
	</div>

<script>

window.addEventListener('load', () => { 
	const forms = document.getElementsByClassName('validation-form'); 
	Array.prototype.filter.call(forms, (form) => { 
		form.addEventListener('submit', function (event) { 
		
			if (form.checkValidity() === false) { 
			   event.preventDefault(); 
			   event.stopPropagation(); 
			} 
				   
		form.classList.add('was-validated');
		}, false);
	});
}, false); 

</script>

<script>

function goPopup(){
	var pop = window.open("/test20/views/user/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 

}


function jusoCallBack(roadFullAddr){
		
		var addressEl = document.querySelector("#address");
		addressEl.value = roadFullAddr;
}

</script>
</body>
</html>
<%@ include file="../layout/footer.jsp"%>