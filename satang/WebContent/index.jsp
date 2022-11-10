<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		$(location).attr('href', '/satang/member/join.smart');
	
	
		$('#mlist').click(function(){
			$('#lContent').html('');
			$.ajax({
				url: '/satang/member/memberList.smart',
				type: 'post',
				dataType: 'json',
				success: function(data) {
					// 이 경우 data 에 담긴 내용은 배열일 것이다.
					// [ {"id": ????, "mno": ???}, { }, { } ]
					
					for(i = 0; i < data.length; i++){
						var jdata = data[i];
						var str = '<div class="w3-col w3-button w3-blue" id="'+ jdata.mno +'">' + jdata.id + '</div>';
						$('#lContent').append(str);
					}
				},
				error: function() {
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
			<div class="w3-button w3-orange" id="lbtn">로그인</div>
			<div class="w3-button w3-orange" id="mlist">회원리스트</div>
			<div class="w3-col w3-hide" id="lContent">
			</div>
		</div>
	</div>
</body>
</html>