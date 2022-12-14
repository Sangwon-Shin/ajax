<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Smart Join Page</title>
<link type="text/css" rel="stylesheet" href="/satang/css/w3.css">
<link type="text/css" rel="stylesheet" href="/satang/css/smart.css">
<script type="text/javascript" src="/satang/js/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#idck').click(function(){
			// 할일
			// 1. 아이디 입력내용 꺼내오고
			var sid = $('#id').val();
//			alert(sid);
			// 2. 입력된 아이디를 서버에 보내고 결과 받고
			// 비동기통신에 해당하므로 ajax()로 처리한다.
			$.ajax({
				url: '/satang/member/idCheck.smart',
				type: 'POST',
				dataType: 'json',
				data: {
					id: sid
				},
				success: function(data){// { "result" : "OK || NO"}
					if(data.result == 'OK'){
						$('#idckmsg').removeClass('w3-text-red').addClass('w3-text-green').html('* 사용가능한 아이디 입니다!');
					} else {
						$('#idckmsg').removeClass('w3-text-green').addClass('w3-text-red').html('# 사용불가능한 아이디 입니다!');
						$('#id').val('');
						$('#id').focus();
					}
					$('#idckmsg').css('display', 'block');
				},
				error: function(){
					alert('### 통신 실패 ###');
				}
			});
		});
	});
</script>
</head>
<body>
	<div class="w3-content mxw700">
		<h1 class="w3-padding w3-pink w3-center w3-card-4 w3-round-large mgb20">Smart Join</h1>
		
		<form method="get" action="result.html" name="frm" id="frm" class="w3-col w3-round-large w3-card-4 mgb20 pdh30">
			<!-- 이름 입력 태그 -->
			<div class="w3-col mgb15">
				<div class="w3-col m3 w3-right-align w3-text-grey pdr10 ft18">
					<label for="name">이 름 : </label>
				</div>
				<div class="w3-col m9">
					<input type="text" name="name" id="name" class="w3-col m10 w3-input w3-border" 
															placeholder="이름을 입력하세요!" required>
				</div>
			</div>
			<!-- 아이디 입력 태그 -->
			<div class="w3-col mgb15">
				<div class="w3-col m3 w3-right-align w3-text-grey pdr10 ft18">
					<label for="id">I D : </label>
				</div>
				<div class="w3-col m9">
					<div class="w3-col m10">
						<div class="w80 w3-right w3-button w3-blue w3-hover-aqua" id="idck">check</div>
						<div class="w3-rest pdr10">
							<input type="text" name="id" id="id" class="w3-col w3-input w3-border" 
																placeholder="아이디를 입력하세요!" required>
						</div>
						<p class="w3-col w3-center" id="idckmsg" style="display: none; margin-top: 5px; margin-bottom: 0px;"># 사용할 수 없는 아이디 입니다.</p>
					</div>
				</div>
			</div>
			<!-- 비밀번호 입력 태그 -->
			<div class="w3-col mgb15">
				<div class="w3-col m3 w3-right-align w3-text-grey pdr10 ft18">
					<label for="pw">P W : </label>
				</div>
				<div class="w3-col m9">
					<input type="password" name="pw" id="pw" class="w3-col m10 w3-input w3-border" 
															placeholder="비밀번호를 입력하세요!" required>
				</div>
			</div>
			<!-- 비밀번호 확인 입력 태그 -->
			<div class="w3-col mgb15">
				<div class="w3-col m3 w3-right-align w3-text-grey pdr10 ft18">
					<label for="repw">rePW : </label>
				</div>
				<div class="w3-col m9">
					<input type="password" id="repw" class="w3-col m10 w3-input w3-border" 
															placeholder="비밀번호를 입력하세요!" required>
				</div>
			</div>
			<!-- 이메일 입력 태그 -->
			<div class="w3-col mgb15">
				<div class="w3-col m3 w3-right-align w3-text-grey pdr10 ft18">
					<label for="mail">mail : </label>
				</div>
				<div class="w3-col m9">
					<input type="text" name="mail" id="mail" class="w3-col m10 w3-input w3-border" 
															placeholder="이메일을 입력하세요!" required>
				</div>
			</div>
			<!-- 전화번호 입력 태그 -->
			<div class="w3-col mgb15">
				<div class="w3-col m3 w3-right-align w3-text-grey pdr10 ft18">
					<label for="phone">phone : </label>
				</div>
				<div class="w3-col m9">
					<input type="text" name="phone" id="phone" class="w3-col m10 w3-input w3-border" 
															placeholder="전화번호를 입력하세요!" required>
				</div>
			</div>
			<!-- 성별 선택 태그 -->
			<div class="w3-col mgb15">
				<div class="w3-col m3 w3-right-align w3-text-grey pdr10 ft18">
					<label>gender : </label>
				</div>
				<div class="w3-col m9">
					<div class="w3-col m10">
						<div class="w3-half w3-center"><!-- w3-half ==> w3-col s6 m6 l6 -->
							<input type="radio" name="gen" id="mgen" class="w3-radio" value="M" onchange="getGen(this)">
							<label for="mgen" class="glbl ft12">남 자</label>
						</div>
						<div class="w3-half w3-center">
							<input type="radio" name="gen" id="fgen" class="w3-radio" value="F" onclick="getGen(this)">
							<label for="fgen" class="glbl ft12">여 자</label>
						</div>
					</div>
				</div>
			</div>
			<!-- 아바타 선택 태그 -->
			<div class="w3-col mgb15" id="selAvt" style="display: none;">
				<div class="w3-col m3 w3-right-align w3-text-grey pdr10 ft18">
					<label>avatar : </label>
				</div>
				<div class="w3-col m9">
					<div class="w3-col m10 w3-center">
						<!-- 남자아바타 선택 그룹 -->
						<div class="w3-col" id="mavt">
							<div class="inblock">
								<div class="avtfr inblock">
									<label for="a1" class="w3-col avtimg w3-border">
										<img src="../img/avatar/img_avatar1.png" class="avtimg">
									</label>
									<div class="w3-col">
										<input type="radio" name="avt" id="a1" value="1" class="w3-radio">
									</div>
								</div>
							</div>
							<div class="inblock">
								<div class="avtfr inblock">
									<label for="a2" class="w3-col avtimg w3-border">
										<img src="../img/avatar/img_avatar2.png" class="avtimg">
									</label>
									<div class="w3-col">
										<input type="radio" name="avt" id="a2" value="2" class="w3-radio">
									</div>
								</div>
							</div>
							<div class="inblock">
								<div class="avtfr inblock">
									<label for="a3" class="w3-col imgbox hidden w3-border">
										<img src="../img/avatar/img_avatar3.png" class="w3-col avtimg">
									</label>
									<div class="w3-col">
										<input type="radio" name="avt" id="a3" value="3" class="w3-radio">
									</div>
								</div>
							</div>
						</div>
						<!-- 여자아바타 선택 그룹 -->
						<div class="w3-col" id="favt">
							<div class="inblock">
								<div class="avtfr inblock">
									<label for="a4" class="w3-col avtimg w3-border">
										<img src="../img/avatar/img_avatar4.png" class="avtimg">
									</label>
									<div class="w3-col">
										<input type="radio" name="avt" id="a4" value="4" class="w3-radio">
									</div>
								</div>
							</div>
							<div class="inblock">
								<div class="avtfr inblock">
									<label for="a5" class="w3-col avtimg w3-border">
										<img src="../img/avatar/img_avatar5.png" class="avtimg">
									</label>
									<div class="w3-col">
										<input type="radio" name="avt" id="a5" value="5" class="w3-radio">
									</div>
								</div>
							</div>
							<div class="inblock">
								<div class="avtfr inblock">
									<label for="a6" class="w3-col imgbox hidden w3-border">
										<img src="../img/avatar/img_avatar6.png" class="w3-col avtimg">
									</label>
									<div class="w3-col">
										<input type="radio" name="avt" id="a6" value="6" class="w3-radio">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		
		<!-- 버튼 태그 -->
		<div class="w3-col w3-round-large w3-card-4 hidden">
			<div class="w3-col w3-third w3-green w3-hover-lime w3-button" id="hbtn">home</div>
			<div class="w3-col w3-third w3-orange w3-hover-khaki w3-button" id="jbtn">join</div>
			<div class="w3-col w3-third w3-blue w3-hover-aqua w3-button" id="lbtn">login</div>
		</div>
	</div>
	
<script type="text/javascript">
	function getGen(el){
		var gval = el.value;
		if(gval == 'M'){
			document.getElementById('favt').style.display = 'none';
			document.getElementById('mavt').style.display = 'block';
			document.getElementById('selAvt').style.display = 'block';
		} else if(gval == 'F') {
			document.getElementById('favt').style.display = 'block';
			document.getElementById('mavt').style.display = 'none';
			document.getElementById('selAvt').style.display = 'block';
		}
	}
</script>
</body>
</html>