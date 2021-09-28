<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/normalize.css">
  <link rel="stylesheet" href="css/style.css">
<style>
	body{
		background-image: url(https://image.freepik.com/free-photo/textured-background-in-white-tone_53876-128610.jpg);
		background-size: cover;
	}
.star-rating {
  display:flex;
  flex-direction: row-reverse;
  font-size:2.5em;
  justify-content:space-around;
  padding:0 .2em;
  text-align:center;
  width:5em;
}

.star-rating input {
  display:none;
}

.star-rating label {
  color:#ccc;
  cursor:pointer;
}

.star-rating :checked ~ label {
  color:#f90;
}

.star-rating label:hover,
.star-rating label:hover ~ label {
  color:#fc0;
}
.warning_msg {
    display: none;
    position: relative;
    text-align: center;
    background: #ffffff;
    line-height: 26px;
    width: 100%;
    color: red;
    padding: 10px;
    box-sizing: border-box;
    border: 1px solid #e0e0e0;
}
.reviewform textarea{
    width: 90%;
    padding: 10px;
    height: 20%;
    box-sizing: border-box;
}
</style>
</head>

<body>
<br><br><br><br>
	<div class="container">
		<div>
			<tbody>
				<tr>
					
					<td>
						<img src="${userInfo.img}" style="width:40%; height:60%; ">
					</td>
				<div style="margin-left: 50%; margin-top: -35%; font-size: 20px;">
					<th>
						<c:out value="${userInfo.name}" />
					</th>
					<td>
						<c:out value=" 문의 : ${userInfo.phonnumber}"/>
					</td>
					<br>
					<td>
						<c:out value="${userInfo.address}"/>
					</td>
					<td>
					
						
						⭐<c:out value="${userInfo.avg}"/>
					</td>
				</div>
				</tr>
			</tbody>
		</div>
	</div>
<br><br>

<div style="margin-left: 50%;">

	<c:choose>
		<c:when test="${sessionScope.roletype == 'USER' && count == 0}">
			<div class="container">
				<!-- replySave -->
				<h1>후기</h1>
    				<form name="form8" action="insertRating" class="reviewform">
    				 <input type="hidden" name="rate" id="rate" value="0"/>
       			 <p class="title_star">별점과 리뷰를 남겨주세요.</p>
       			  <div class="warning_msg">별점을 선택해 주세요.</div>
					<div class="star-rating">
							<input type="radio" id="5-stars" name="rating" value="5" />
							<label for="5-stars" class="star">&#9733;</label>
						    <input type="radio" id="4-stars" name="rating" value="4" />
							<label for="4-stars" class="star">&#9733;</label>
 							<input type="radio" id="3-stars" name="rating" value="3" />
  							<label for="3-stars" class="star">&#9733;</label>
  							<input type="radio" id="2-stars" name="rating" value="2" />
  							<label for="2-stars" class="star">&#9733;</label>
  							<input type="radio" id="1-star" name="rating" value="1" />
  							<label for="1-star" class="star">&#9733;</label>
					</div>
						<div class="review_contents">
           			 	<div class="warning_msg">5자 이상으로 작성해 주세요.</div>
            			<textarea name="rcontent" rows="10" class="review_textarea"></textarea>
            			<input type="hidden" name="adminno" value="<c:out value="${userInfo.userno}"/>">
						<input type="hidden" name="userno" value="<c:out value="${sessionScope.userno}"/>">
            			<br>
            			<a class="btn btn-primary" style="float:right;" href="adminRead?userno=${userInfo.userno }" onclick="form8.submit()">저장</a>
        			</div>   

				</form>
			</div>
		</c:when>
		<c:otherwise>

		</c:otherwise>
	</c:choose>

	<div class="container">
		<form name="form9" action="ratingDelete">	
			<table id="customers" class="table table-striped mat">
			
			
					<thead>
						<tr>
							<th>작성자</th>
							<th>평점</th>
							<th>후기</th>
							
						<tr>
					</thead>
				<thead>
					<tr>
						<c:forEach var="i" items="${ratinglist }" varStatus="status">

							<tr>

								<td>
									익명
									<c:out value="${i.userno }" />
								</td>
								<td>
									<c:out value="${i.rating }" />
								</td>
								<td>
									<c:out value="${i.rcontent }" />
								</td>
								<td>
									<input type="hidden" name="ratingno" value="<c:out value="${i.ratingno}"/>">
									<a href="adminRead?userno=${userInfo.userno }" onclick="form9.submit()">삭제</a>
								</td>
							</tr>
						</c:forEach>

					</tr>
				</thead>
			</table>
		</form>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br>
</div>
<script>
function Rating(){};
Rating.prototype.rate = 0;

document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    document.querySelector('.rating').addEventListener('click',function(e){
        let elem = e.target;
        if(elem.classList.contains('rate_radio')){
            rating.setRate(parseInt(elem.value));
        }
    })
});

document.querySelector('#insertRating').addEventListener('click',function(e){
	if(rating.rate == 0){
		rating.showMessage('rate');
		return false;
	}
	if(document.querySelector('.review_textarea').value.length < 5){
		rating.showMessage('review');
		return false;
	}
})

Rating.prototype.showMessage = function(type){//경고메시지 표시
    switch(type){
        case 'rate':
            //안내메시지 표시
            document.querySelector('.review_rating .warning_msg').style.display = 'block';
            //지정된 시간 후 안내 메시지 감춤
            setTimeout(function(){
                document.querySelector('.review_rating .warning_msg').style.display = 'none';
            },1000);            
            break;
        case 'review':
            //안내메시지 표시
            document.querySelector('.review_contents .warning_msg').style.display = 'block';
            //지정된 시간 후 안내 메시지 감춤
            setTimeout(function(){
                document.querySelector('.review_contents .warning_msg').style.display = 'none';
            },1000);    
            break;
    }
}
</script>




</body>
</html>
<%@ include file="../layout/footer.jsp"%>