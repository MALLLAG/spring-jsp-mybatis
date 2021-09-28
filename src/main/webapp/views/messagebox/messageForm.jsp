<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>글쓰기창</title>
<style>
	body{
		background-image: url(https://mblogthumb-phinf.pstatic.net/MjAxNzA4MDNfMSAg/MDAxNTAxNzI4MTg3NDUz.t5-PGXz8Dr28VX9YECCfB8BcmfxgAyRCrRrjZ3TPe7og.VM2xsS7-p4-m6jdCcDVfYDmdlxgEP6mG1R9EyrPyoRQg.JPEG.yesoljee/NaverBlog_20170803_114307_06.jpg?type=w2);
	}
</style>
</head>
<body>
<br><br><br><br>
	<div class="container">
		<form action="messageSend">
			<h2>쪽지보내기</h2>
			<table class="table table-hover">
				<tbody>
					<tr>

					</tr>
					<tr>
						<td>
							<textarea type="text" class="form-control" placeholder="쪽지 내용을 작성하세요" name="mcontent" maxlength="1024" style="height: 400px;"></textarea>
						</td>
					</tr>
				</tbody>

			</table>
			<div style="text-align: right;">
				<input type="hidden" name="rno" value="<c:out value="${messageInfo.rno}"/>">
				<input type="hidden" name="sno" value="<c:out value="${sessionScope.userno}"/>">

				<button type="submit" class="btn btn-primary">쪽지 보내기</button>

			</div>
		</form>
	</div>


</body>
</html>

</body>
</html>

