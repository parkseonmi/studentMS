<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생수정</title>
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
			text-align: right;
		}
		.div_input {
			padding: 3px 20px;
		}
		.div_input > label {
			float: left;
			line-height: 40px;
		}
		.shs_input {
			width: 270px;
			display: inline-block;
			height: 40px;
			font-size: 16px;
			color: #515151;
			outline: none;
			border: 1px solid #aaa;
			padding: 0 10px;
		}
		.btn_wrap {
			display: flex;
			padding: 15px 0;
			justify-content: space-evenly;
		}
		hr {
			margin: 2px 0px;
			border: 1px dashed #515151;
		}
		#input_id {
			background: lightyellow;
			border: 1px solid #aaa !important;
			cursor: not-allowed;
		}
		.err_msg {
			color: tomato;
			font-size: 14px;
			display: none;
			text-align: left;
			padding-left: 80px;
		}
	</style>
</head>
<body>
	<div class="content">
		<a href="index.shs">
			<div class="shs_title">
				JAVA기반 스마트하이브리드<br>
				개발자 과정 2기
			</div>
		</a>
		<div class="shs_manager">
			- 학사수정 -
		</div>
		<form action="SHSUpdate" id="frm_update" name="frm_insert" method="POST">
			<div class="in_content">
				<hr>
				<div class="div_input">
					<label for="input_id">아이디 : </label>
					<input type="text" id="input_id" name="input_id" class="shs_input" placeholder="ID" readonly="readonly" value="${memInfo.sid}"><br>
				</div>
				<hr>
				<div class="div_input">
					<label for="input_name">이름 : </label>
					<input type="text" id="input_name" name="input_name" class="shs_input" placeholder="NAME" value="${memInfo.sname}"><br>
					<span class="err_msg"></span>
				</div>
				<div class="div_input">
					<label for="input_age">나이 : </label>
					<input type="text" id="input_age" name="input_age" class="shs_input" placeholder="AGE" value="${memInfo.sage}"><br>
					<span class="err_msg"></span>
				</div>
				<div class="div_input">
					<label for="input_major">전공 : </label>
					<input type="text" id="input_major" name="input_major" class="shs_input" placeholder="MAJOR" value="${memInfo.smajor}"><br>
					<span class="err_msg"></span>
				</div>
				<div class="div_input">
					<label for="input_phone">번호 : </label>
					<input type="text" id="input_phone" name="input_phone" class="shs_input" placeholder="PHONE" value="${memInfo.sphone}"><br>
					<span class="err_msg"></span>
				</div>
			</div>
			<div class="div_index btn_wrap">
				<a href="SHSSelect" class="btn_index btn3">취소</a>
				<a href="#" class="btn_index btn1 submitBtn">수정</a>
			</div>
		</form>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/validation.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.shs_input').focus(function(event) {
				$(this).css('border', '1px solid yellowgreen');
			});
			$('.shs_input').blur(function(event) {
				$(this).css('border', '1px solid #aaa');
			});
			
			
			
			// keyup()을 활용한 유효성 체크(input 값)
			$('#input_name').keyup(function(){
				nameCheck();
			});
			
			$('#input_age').keyup(function(){
				ageCheck();
			});
			
			$('#input_major').keyup(function(){
				majorCheck();
			});
			
			$('#input_phone').keyup(function(){
				phoneCheck();
			});
			
			
			
			// 유효성 체크(이름, 나이, 전공, 핸드폰번호)
			// 유효한 값이면 => submit();
			$(".submitBtn").click(function(){
				if (!nameCheck()) {
					$('#input_name').focus();
					return false;
				}
				if (!ageCheck()) {
					$('#input_age').focus();
					return false;
				}
				if (!majorCheck()) {
					$('#input_major').focus();
					return false;
				}
				if (!phoneCheck()) {
					$('#input_phone').focus();
					return false;
				}
				
				// 유효한 값 인증
				$("#frm_update").submit();
			});		});
	</script>
</body>
</html>