<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- jstl 라이브러리를 사용하기 위한 선언문 -->
<!-- prefix: uri를 간단하게 사용 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출석부</title>
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
	padding: 15px 12px;
	background-color: yellowgreen;
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

.btn2 {
	background-color: orange;
}

.btn3 {
	background-color: salmon;
}

.in_content {
	width: 330px;
	margin: 0 auto;
}

table {
	font-size: 17px;
	border-collapse: collapse;
	width: 330px;
	margin-bottom: 20px;
}

.table_data:hover {
	background-color: lightyellow;
}

.table_title {
	background-color: yellowgreen;
	height: 25px;
	border: 0px;
}

.table_data {
	background-color: white;
	height: 25px;
	font-size: 17px;
}

th {
	padding: 5px;
}

td {
	text-align: center;
	padding: 3px 0px;
}

tr {
	border-bottom: 1px dashed #bbb;
}

.uBtn {
	color: dodgerblue;
}

.dBtn {
	color: tomato;
}
.search_wrap {
	margin-bottom: 15px;
	width: 100%;
	height: 40px;
	position: relative;
}
.input_search {
	height: 100%;
	padding: 0 20px;
	border: 2.5px solid mediumpurple;
	outline: none;
	color: #515151;
	width: 100%;
	font-size: 16px;
	border-radius: 50px;

	
}
.search_btn {
	display: inline-flex;
	width: 40px;
	height: 100%;
	background-color: mediumpurple;
	font-size: 17px;
	position: absolute;
	top: 0;
	right: 0;
	border-radius: 50%;
	transition: .3s;
}
.search_btn:hover {
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
	background: slateblue;
}
.search_btn i {
	font-size: 20px;
	color: white;
	line-height: 40px;
	margin: 0 auto;
}
.search_result {
	color: hotpink;
	font-size: 15px;
	padding-left: 10px;
}
.err_msg {
	display: none;
	color: tomato;
	margin-top: -12px;
	padding-left: 10px;
}
.point {
	color : dodgerblue;
}
</style>
</head>
<body>
	<div class="content">
		<%@ include file="include/header.jsp"%>
		<div class="shs_manager">- 학생검색 -</div>
		<div class="in_content">
			<div class="search_wrap">
				<input type="text" placeholder="검색할 이름을 입력해주세요."
				id="input_search" name="input_search" class="input_search" maxlength="4">
				<a href="#" class="search_btn"><i class="fas fa-search"></i></a>
			</div>
			<span class="err_msg"></span>
		</div>
		<div class="in_content">
			<c:if test="${search_cnt > 0}">
				 <span class="search_result">
				 	<span class="point">"${name}"</span>으로 검색한 결과 총
				 	<span class="cnt">${search_cnt}</span>건이 검색됨!
				 </span>
			 </c:if>
		</div>
		<div class="in_content">
			<table>
				<tr class="table_title">
					<th>ID</th>
					<th>Name</th>
					<th>Tel.</th>
					<th></th>
					<th></th>
				</tr>
				<c:if test="${shslist.size() == 0}">
					<tr class="table_data">
						<td colspan="5">검색결과가 없습니다.</td>
					</tr>
				</c:if>
				<!-- jstl태그, el태그: jsp에서 자바코드를 가독성이 좋게 쓸 수 있음
					 el태그: 출력 담당(변수선언)
					 jstl태그: 제어문(for, if), 포맷팅 담당 -->

				<!-- c: jstl태그 -->
				<!-- ${shslist}: el태그 -->
				<c:forEach items="${shslist}" var="mDto">
					<!-- el태그로 받아온 ${shslist}를 변수 mDto에 담음 -->
					<tr class="table_data">
						<td class="sid">${mDto.sid}</td>
						<td class="sname">${mDto.sname}</td>
						<td>${mDto.sphone}</td>
						<!-- form태그에서는 name명을 id로 보내준다. -->
						<td><a href="SHSUpdate?id=${mDto.sid}" class="uBtn">수정</a></td>
						<td><a href="#" class="dBtn">삭제</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="div_index">
			<a href="index" class="btn_index btn3">뒤로가기</a>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			var id, name;

			$(".dBtn").click(function() {
				$(".modal_all").css("display", "flex");

				// parent(): 상위에 있는 모든 ()태그명
				// closest(): parent()의 상위들중에 가장 가까운 ()태그명
				id = $(this).closest("tr").find(".sid").text();
				name = $(this).closest("tr").find(".sname").text();
				$(".name").text(name);
			});
			$(".alert_wrap_no").click(function() {
				$(".modal_all").css("display", "none");
			});

			$(".alert_wrap_yes").click(function() {
				location.href = "SHSDelete?id=" + id;
			});
			
			
			// 학생 검색버튼 클릭 시!
			$(".search_btn").click(function(){
				var name = $.trim($("#input_search").val());
				
				var regEmpty = /\s/g; // 공백문자 체크
				var regNum = /[~0-9]/g; // 숫자 못들어오게 체크
				// isNaN:매개변수가 숫자가 아닐 때(Not a Number)
				
				if (name == '' || name.length == 0) {
					$('.err_msg').css('display','block')
									   .css('color', 'tomato')
									   .text('필수 정보입니다.');
					return false;
				} else if (regNum.test(name)) {
					$('.err_msg').css('display','block')
									   .css('color', 'tomato')
					   				   .text('문자만 입력해주세요.');
					return false;
				} else if (name.match(regEmpty)) {
					$('.err_msg').css('display','block')
									   .css('color', 'tomato')
					   				   .text('공백없이 작성해주세요.');
					return false;
				} else if (name.length > 4 || name.length < 2) {
					$('.err_msg').css('display','block')
									   .css('color', 'tomato')
					  				   .text('2~4글자로만 작성해주세요.');
					return false;
				}
				location.href="searchPlay.shs?name=" + name;
			});
		});
	</script>
</body>
</html>