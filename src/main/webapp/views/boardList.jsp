<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="layout/header.jsp"%>
<%@ include file="layout/sidebar.jsp"%>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/normalize.css">
  <link rel="stylesheet" href="css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board1</title>
<style>

	 body {
	background-image: url(https://hdwallsource.com/img/2016/8/world-map-computer-wallpaper-51297-52993-hd-wallpapers.jpg); 
	background-repeat:no-repeat;
  	background-size: cover;

	}

</style>
</head>
<script>
	$(document).on('click', '#btnWriteForm', function(e){
		e.preventDefault();	
		location.href = "${pageContext.request.contextPath}/boardForm";
	});
</script>
<body>
<br><br><br><br>
<article>
	<div class="container" style="margin-right: 250px; width: 70%;">	
		<div class="table-responsive" 
		style="background-color: white; border: 1px solid Gainsboro; border-radius: 20px; padding: 10px;
		box-shadow: 12px 0 15px -4px rgba(143, 145, 150, 0.8), -12px 0 15px -4px rgba(143, 145, 150, 0.8)">
	<h2>의뢰하기</h2>
		<table id="customers" class="table table-striped mat">
			<colgroup>
				<col style="width:5%; background-color:#eeeeee; "/>
				<col style="width:20%;"/>
				
			</colgroup>
			<thead>
				<tr>
					<th>No</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성날짜</th>

				<tr>
			</thead>	
			<thead>
				<tr>
					<c:forEach var="i" items="${list }" varStatus="status">
				<c:url var="link" value="boardRead">
					<c:param name="boardno" value="${i.boardno}" />
				</c:url>	
				<tr>
					<td><c:out value="${i.boardno}"/></td>
					<td><a href="${link }"><c:out value="${i.title }" /></a></td>
					<td><c:out value="${i.userno}"/></td>
					<td><c:out value="${i.nowdate}"/></td>
					
				</tr>
					</c:forEach>
				</tr>
				
			</thead>
		</table>
		<div>
			<c:if test="${pagination.curRange ne 1 }">
				<a href="#" onClick="fn_paging(1)">[처음]</a> 
			</c:if>
			<c:if test="${pagination.curPage ne 1}">
				<a href="#" onClick="fn_paging('${pagination.prevPage }')">[이전]</a> 
			</c:if>
                    <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
                        <c:choose>
                            <c:when test="${pageNum eq  pagination.curPage}">
                                <span style="font-weight: bold;"><a href="" onClick="fn_paging('${pageNum }')">${pageNum }</a></span> 
                            </c:when>
                            <c:otherwise>
                                <a href="#" onClick="fn_paging('${pageNum }')">${pageNum }</a> 
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
                        <a href="#" onClick="fn_paging('${pagination.nextPage }')">[다음]</a> 
                    </c:if>
                    <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
                        <a href="#" onClick="fn_paging('${pagination.pageCnt }')">[끝]</a> 
			</c:if>
		</div>
                
        <div>
        	총 게시글 수 : ${pagination.listCnt } /    총 페이지 수 : ${pagination.pageCnt } / 현재 페이지 : ${pagination.curPage } / 현재 블럭 : ${pagination.curRange } / 총 블럭 수 : ${pagination.rangeCnt }
        </div>
		
		<div style="text-align: right; margin-bottom: 30; margin-right: 10">
		<button type="button" class="btn btn-sm btn-primary" id="btnWriteForm">글쓰기</button>
	</div>
	</div>
	
</div>
</article>
		
</body>
<script>
function fn_paging(curPage) {
	location.href = "boardList?curPage=" + curPage;
	}
</script>

</html>

