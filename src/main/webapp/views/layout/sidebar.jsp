<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>사이트 이름</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
  <style> 
  .fakeimg {
    height: 200px;
    background: #aaa;
  }
  /* Style the search box */
#mySearch {
 
  width: 100%;
  font-size: 18px;
  padding: 11px;
  border: 1px solid #ddd;
}

/* Style the navigation menu */
#myMenu {
  list-style-type: none;
 
  padding: 0;
  margin: 0;
}

/* Style the navigation links */
#myMenu li a {
  padding: 12px;
  text-decoration: none;
  color: white;
  display: block
}

#myMenu li a:hover {
  background-color:silver ;
}
.vl {
  border-left: 6px solid silver;
  height: 625px;
}

  </style>
</head>
<body>	

	<aside style ="width:10%; position: fixed; z-index:2; margin-left: 88%; margin-top: 160; ">
		<div style="background-color: rgba(0, 0, 0, 0.7); border-radius:10px">
		<form action="selectSearchList" method="post">
		
				
				<select id="select" name="select" size="1" style="width:100%">
					<option value="all" selected>전체</option>
					<option value="title">제목</option>
					<option value="writer">작성자</option>
					<option value="content">내용</option>
				</select>
				
			<input type="text" id="mySearch" name="search" onkeyup="myFunction()" style="height: 45px" placeholder="검색.." title="Type in a category">
			
		</form>
		<ul id="myMenu">
			<li><a href="#">주요업무</a></li>
			<li><a href="#">업무절차</a></li>
			<li><a href="#">언론매체</a></li>
			<li><a href="#">접수</a></li>
		</ul>
		</div>
	</aside>

</body>
