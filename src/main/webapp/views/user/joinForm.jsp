<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
 integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
	html, body{
	overflow: auto;
	}

	body { 
		 
		} 
	.input-form { 
	
	max-width: 380px; 
	margin-top: 80px; 
	padding: 25px; 
	background-color: white; 
	-webkit-border-radius: 10px; 
	-moz-border-radius: 10px; 
	border-radius: 30px; 
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15); 
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15); 
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15) }
</style> 

</head>

<body>
<div class="container">
	<div class="input-form-backgroud row"> 
		<div class="input-form col-md-12 mx-auto"> 

			<h4 class="mb-3">회원가입</h4> 
			<form class="validation-form" novalidate action="saveForm" method="post" id="joinForm"  enctype="multipart/form-data">
				
		

					<div class="mb-3"> 
						<label for="name">이름</label> <button type="button" class="btn-1" onClick="goCheck();">중복확인</button>
						<input style="background-color:WhiteSmoke; border-color:white;" type="text" class="form-control" name="name" id="name" value="" required onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">
						
					</div>
				
			
				<div class="mb-3"> 
						<label for="phonnumber">휴대폰</label> 
						<input style="background-color:WhiteSmoke; border-color:white; "type="phonnumber" class="form-control" name="phonnumber" placeholder="" required> 
						<div class="invalid-feedback">번호를 입력해주세요	</div> 
				</div> 
				<div style="margin-top:-20px;"></div>		
				<div class="mb-3"> 
					<label for="email">이메일</label>
					<input style="background-color:WhiteSmoke; border-color:white;"type="email" class="form-control" name="email" placeholder="you@example.com" required> 
					<div class="invalid-feedback">이메일을 입력해주세요.</div> 
				</div> 
					<div style="margin-top:-10px;"></div>	
				<div class="mb-3"> 
					<label for="password">비밀번호</label> 
					<input style="background-color:WhiteSmoke; border-color:white;"type="password" class="form-control" name="password" placeholder="" required> 
					<div class="invalid-feedback">비밀번호를 입력해주세요.	</div> 
				</div> 
				
					
					<div style="margin-top:-10px;"></div>	
					<div class="d-flex justify-content-end">
						<button type="button" class="btn btn-info" onClick="goPopup();">주소검색</button>
					</div>
					<input type="text" id="address" name="address" class="form-control" required readOnly>
	
					
				<div class="mb-4">
					<label for="img">IMG</label>
					<input style="border-color:white;"type="file" class="form-control" name="file"/>
				</div>
					
		   		<hr class="mb-4"> 
		   		<div class="custom-control custom-checkbox"> 
		   			<input type="checkbox" class="custom-control-input" name="aggrement" required> 
		   			<label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label> 
		   		</div>

		   		<div class="mb-4"></div> 
		   			 <div style="text-align: center;">
		   			  <button style="width: 100%;" type="submit" class="btn btn-primary">회원가입</button> 		
		   			 </div>
		   </form> 
		 </div> 
	</div> 
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


<script>

 function goCheck(){
    var name = document.getElementById("name").value;
    var url = "check?name="+ name;
        
    name = name.trim(); 
	if(name==""){ 
		alert("아이디를 입력해주세요"); 
		return false;
	}
    var option = "width = 800, height = 400, top = 100, left = 600, location = no, resizeable = no";
    window.open(encodeURI(url), name, option);
} 


</script>


<script>
function noSpaceForm(obj) { // 공백사용못하게
    var str_space = /\s/;  // 공백체크
    if(str_space.exec(obj.value)) { //공백 체크
        alert("해당 항목에는 공백을 사용할수 없습니다.\n\n공백은 자동적으로 제거 됩니다.");
        obj.focus();
        obj.value = obj.value.replace(' ',''); // 공백제거
        return false;
    }
 // onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"
}
</script>
</body>
</html>
<%@ include file="../layout/footer.jsp"%>