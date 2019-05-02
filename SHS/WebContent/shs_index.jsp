<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학사관리</title>
<link rel="stylesheet" href="css/common.css?v=1">
<style type="text/css">
.content {
	width: 390px;
	height: 600px;
	border: 2px solid #444;
	margin: 50px auto 0;
	background-color: #eee;
	border-radius: 5px;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
	padding-bottom: 50px;
}

.shs_manager {
	padding-top: 20px;
	padding-bottom: 20px;
	text-align: center;
	color: #454552;
	font-size: 20px;
}

.btn_index {
	background-color: yellowgreen;
	color: white;
	width: 90px;
	height: 90px;
	display: inline-block;
	border-radius: 50%;
	font-size: 17px;
	line-height: 90px;
}

.btn_index:hover {
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
}

.div_index {
	padding-bottom: 30px;
	text-align: center;
}

.btn2 { background-color: orange; }
.btn3 { background-color: salmon; }
.btn4 { background-color: mediumpurple; }

.container {
	height: 400px;
	display: flex;
	flex-direction: column;
	justify-content: space-evenly;
	padding: 30px;
}
.line1, .line2 {
	display: flex;
	justify-content: space-around;
}
</style>
</head>
<body>
	<div class="content">
		<%@ include file="include/header.jsp"%>
		<div class="shs_manager">- 학사관리 -</div>
		<div class="container">
			<div class="line1">
				<div class="div_index">
				<!-- get, post를 입력안해주면 get으로 감 -->
					<a href="name.shs" class="btn_index btn3">소개</a>
				</div>
				<div class="div_index">
					<a href="select.shs" class="btn_index btn2">출석부</a>
				</div>
			</div>
			<div class="line2">
				<div class="div_index">
					<a href="search.shs" class="btn_index btn4">학생검색</a>
				</div>
				<div class="div_index">
					<a href="insert.shs" class="btn_index btn1">학생등록</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>