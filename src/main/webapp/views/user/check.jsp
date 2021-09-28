<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script> 
	function blankCheck(f){ 
		var name = f.name.value;
		if(name.trim()==""){ 
			alert("아이디를 입력해주세요"); 
			return false;
		}
		return true; 
	} 
</script>

</head>
<body>

<div style="text-align: center">
	<h3>* 아이디 중복확인 *</h3> 
	<form id="form00" action="check" method="post" onsubmit="return blankCheck(this);"> 
		아이디 : <input type="text" id="name" value="${name}" name="name" autofocus required onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);">
		<button type="submit" class="btn btn-primary">중복확인</button>
	</form>
	<c:if test="${check==0}">
		<a>사용가능한 아이디입니다</a><br>
		<input type="hidden" id="checkname" value="${name}">
		<a>'<c:out value="${name}"/>' 이 아이디로 사용하시겠습니까?</a>
		<button type="button" onclick="setParentText()">사용하기</button>
	</c:if>
	<c:if test="${check!=0}">
		<a>이미 존재하는 아이디입니다</a>
	</c:if>
</div> 

<script>
function setParentText(){
	opener.document.getElementById("name").value = document.getElementById("checkname").value;
	opener.document.getElementById("name").readOnly = true;
	self.close();
}
</script>

<script>
function noSpaceForm(obj) { // 공백사용못하게
    var str_space = /\s/;  // 공백체크
    if(str_space.exec(obj.value)) { //공백 체크
        alert("해당 항목에는 공백을 사용할수 없습니다.\n\n공백은 자동적으로 제거 됩니다.");
        obj.focus();
        obj.value = obj.value.replace(/ /g,""); // 공백제거
        return false;
    }
 // onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this);"
}
</script>

</body>
</html>