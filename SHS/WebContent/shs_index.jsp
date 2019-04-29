<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학사관리</title>
	<style type="text/css">
		@import url('https://fonts.googleapis.com/css?family=Song+Myung');
		* { font-family: 'Song Myung', serif; box-sizing: border-box; }
		body, ul { margin: 0; padding: 0; }
		a { color: inherit; text-decoration: none; }
		ul { list-style: none; }
		
		.content {
			width: 390px;
			height: 600px;
			border: 2px solid #444;
			margin: 50px auto 0;
			background-color: #eee;
			border-radius: 5px;
			box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16),
						0 2px 10px 0 rgba(0,0,0,0.12);
			padding-bottom: 50px;
		}
		.shs_title {
			padding-top: 55px;
			text-align: center;
			font-size: 27px;
			color: #444;
		}
		.shs_manager {
			padding-top: 20px;
			padding-bottom: 20px;
			text-align: center;
			color: #454552;
			font-size: 20px;
		}
		.btn_index {
			padding: 20px 12px;
			background-color: yellowgreen;
			color: white;
			width: 150px;
			display: inline-block;
			border-radius: 10px;
			font-size: 17px;
		}
		.btn_index:hover {
			box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16),
						0 2px 10px 0 rgba(0,0,0,0.12);
		}
		.div_index {
			padding-bottom: 30px;
			text-align: center;
		}
		.btn2 {
			background-color: orange;
		}
		.btn3 {
			background-color: salmon;
		}
		.container {
			height: 320px;
			padding-top: 60px;
			display: flex;
			flex-direction: column;
			justify-content: space-evenly;
		}
	</style>
</head>
<body>
	<div class="content">
		<a href="index.jsp">
			<div class="shs_title">
				JAVA기반 스마트하이브리드<br>
				개발자 과정 2기
			</div>
		</a>
		<div class="shs_manager">
			- 학사관리 -
		</div>
		<div class="container">
			<div class="div_index">
				<!-- get, post를 입력안해주면 get으로 감 -->
				<a href="SHSInsert" class="btn_index btn1">학생등록</a>
			</div>
			<div class="div_index">
				<a href="SHSSelect" class="btn_index btn2">출석부</a>
			</div>
			<div class="div_index">
				<a href="#" class="btn_index btn3">만든이</a>
			</div>
		</div>
	</div>
</body>
</html>