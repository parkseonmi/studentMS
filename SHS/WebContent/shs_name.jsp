<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>welcome페이지</title>
<link rel="stylesheet" href="css/common.css">
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
}

.shs_title {
	padding: 60px 0 25px;
	text-align: center;
	font-size: 27px;
	color: #444;
}

.shs_manager {
	padding: 15px 0;
	text-align: center;
	color: #454552;
	font-size: 20px;
}

.title2 {
	padding: 60px 0 25px;
}

.container {
	display: flex;
	flex-direction: column;
	text-align: center;
	justify-content: center;
}

.made {
	font-size: 14px;
	text-align: left;
	margin: 0 0 50px 150px;
}

.name_text:nth-child(1)>span {
	color: salmon;
}

.name_text:nth-child(2)>span {
	color: dodgerblue;
}

.name_text:nth-child(3)>span {
	color: orange;
}

.btn_index {
	padding: 15px 12px;
	color: white;
	width: 120px;
	display: inline-block;
	border-radius: 10px;
	font-size: 17px;
}

.btn_index:hover {
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
}

.div_index {
	padding-bottom: 30px;
	text-align: center;
}

.btn3 {
	background-color: salmon;
}

.container_text {
	width: 300px;
	height: 66px;
	background: white;
	border: 2px solid #444;
	border-radius: 5px;
	margin: 0 auto;
	padding: 10px;
}

.container_text>span:first-child {
	color: dodgerblue;
}

.container_text>span:last-child {
	color: orange;
}
</style>
</head>
<body>
	<div class="content">
		<%@ include file="include/header.jsp"%>
		<div class="shs_manager title1">- 소개 -</div>
		<div class="container">
			<div class="container_text">
				<span>StudentMS</span>는 교육생을 <span>관리(등록, 수정,<br>제적, 출석,
					검색)
				</span>해주는 웹 프로그램입니다.
			</div>
		</div>
		<div class="shs_manager title2">- 만든이 -</div>
		<div class="made">
			<div class="name_text">
				<span>NAME : </span>Park Seon mi
			</div>
			<div class="name_text">
				<span>PHONE : </span>010-8850-7667
			</div>
			<div class="name_text">
				<span>MAIL : </span>seonmi0325@gmail.com
			</div>
		</div>
		<div class="div_index">
			<a href="index.shs" class="btn_index btn3">뒤로가기</a>
		</div>
	</div>
</body>
</html>