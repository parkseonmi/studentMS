<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl 라이브러리를 사용하기 위한 선언문 -->
<!-- prefix: uri를 간단하게 사용 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출석부</title>
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
		th { padding: 5px; }
		td { text-align: center; padding: 3px 0px; }
		tr { border-bottom: 1px dashed #bbb; }
		.uBtn { color: dodgerblue; }
		.dBtn { color: tomato; }
		
		.modal_all {
			display: none;
			position: absolute;
			justify-content: center;
			background: rgba(0,0,0,0.3);
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
		}
		.modal_wrap {
			font-size: 20px;
			position: absolute;
			z-index: 100;
			top:247px;
			width: 240px;
			height: 200px;
			background: white;
			box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16),
						0 2px 10px 0 rgba(0,0,0,0.12);
			border: 2px solid #444;
			border-radius: 5px;
			text-align: center;
			padding-top: 40px;
		}
		.alert_wrap {
			display: inline-block;
			width: 80px;
			height: 45px;
			font-size: 16px;
			color: white;
			border-radius: 5px;
			line-height: 45px;
			margin-top: 15px;
		}
		.alert_wrap_no {
			background-color: yellowgreen;
			margin-right: 10px;
		}
		.alert_wrap_yes {
			background-color: salmon;
		}
		.name {
			color: dodgerblue;
		}
	</style>
</head>
<body>
	<div class="modal_all">
		<div class="modal_wrap">
			<div>"<span class="name"></span>"학생을<br>삭제하시겠습니까?</div>
			<a href="#" class="alert_wrap alert_wrap_no">아니요</a>
			<a href="#" class="alert_wrap alert_wrap_yes">예</a>
		</div>
	</div>
	<div class="content">
		<a href="index.jsp">
			<div class="shs_title">
				JAVA기반 스마트하이브리드<br>
				개발자 과정 2기
			</div>
		</a>
		<div class="shs_manager">
			- 출석부 -
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
						<td colspan="5">등록된 학생이 없습니다.</td>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			
			var id, name;
			
			$(".dBtn").click(function(){
				$(".modal_all").css("display","flex");
				
				// parent(): 상위에 있는 모든 ()태그명
				// closest(): parent()의 상위들중에 가장 가까운 ()태그명
				id = $(this).closest("tr").find(".sid").text();
				name = $(this).closest("tr").find(".sname").text();
				$(".name").text(name);
			});
			$(".alert_wrap_no").click(function(){
				$(".modal_all").css("display","none");
			});
			
			$(".alert_wrap_yes").click(function(){
				location.href="SHSDelete?id="+id;
			});
		});
	</script>
</body>
</html>