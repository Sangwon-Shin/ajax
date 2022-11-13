<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>aJax index</title>
<link type="text/css" rel="stylesheet" href="/satang/css/w3.css">
<link type="text/css" rel="stylesheet" href="/satang/css/smart.css">
<script type="text/javascript" src="/satang/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		/*  $('#jbtn').click(function(){
			$(location).attr('href', '/satang/member/join.smart');
		});*/
		
		$('#mlist').click(function(){
			$('#lContent').html('');
			$.ajax({
				url: '/satang/member/memberList.smart',
				type: 'post',
				dataType: 'json',
				success: function(data){
					// 이 경우 data에 담긴 내용은 배열일 것이다.
					// {"result": [ {"id": ????, "mno" : ???}, {} ]}
					for(i = 0 ; i < data.result.length ; i++ ){
						var jdata = data["result"][i];
						var str = '<div class="w3-col w3-button w3-lime mgb15" onclick="alert(\'' + jdata.mail + '\');" id="'+ jdata.id +'">'
						+ jdata.name + '</div>';
						$('#lContent').append(str);
					$('#lContent').removeClass('w3-hide');
					},
				error: function(){
					alert('### 통신 에러 ###');
				}
			});
		});
	});
</script>
</head>
<body>
	<div class="w3-content mxw700 w3-center">
		<h1 class="w3-padding w3-card-4 w3-purple">aJax Index Page</h1>
		<div class="w3-col">
			<div class="w3-button w3-orange" id="jbtn">회원가입</div>
			<div class="w3-button w3-blue" id="lbtn">로그인</div>
			<div class="w3-button w3-pink" id="mlist">회원리스트</div>
			<!--  
				위 버튼이 클릭되서 리스트버튼이 완성되면
				회원버튼이 클릭되면 그 회원의 메일을 
				경고창(alert())에 띄워주는 기능을 추가하세요.
				
				요청 주소 :  /member/getMail.smart 로 하고
				서블릿 이름 : MemberMail
				로 해서 처리하세요.
			-->
			
			<div class="w3-col w3-margin-top w3-hide" id="lContent">
			</div>
		</div>
	</div>
</body>
</html>