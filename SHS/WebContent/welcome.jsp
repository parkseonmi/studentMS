<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>welcome페이지</title>
<link rel="stylesheet" href="css/common.css?v=1">
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Song+Myung');
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
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
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
	height: 250px;
	display: flex;
	flex-direction: column;
	text-align: center;
	justify-content: center;
}

.text1 {
	font-size: 30px;
}

.text2 {
	font-size: 22px;
	margin-top: 10px;
}

#rCnt {
	font-size: 22px;
	color: dodgerblue;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="content">
		<%@ include file="include/header.jsp" %>
		<div class="shs_manager">- 환영합니다 -</div>
		<div class="container">
			<div class="welcome_text text1">등록해주셔서 감사합니다!</div>
			<div class="welcome_text text2">
				<span id="rCnt">3</span> 초 후에 메인 페이지로 이동합니다.
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var cnt = 2;
		function countDown() {
			if (cnt == 0) {
				clearInterval(s);
				location.href = "index.shs";
			}
			document.getElementById("rCnt").innerHTML = cnt;
			cnt--;
		}
		var s = setInterval(countDown, 1000); // 1초 단위로 countdown()실행
	</script>
</body>
</html>