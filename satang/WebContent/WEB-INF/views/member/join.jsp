<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>W3.CSS</title>
    <!-- 서버입장에서는 WebContent 가 루트폴더라서 satang 폴더 명시해야한다 -->
    <link type="text/css" rel="stylesheet" href="/satang/css/w3.css">
    <link type="text/css" rel="stylesheet" href="/satang/css/smart.css">
    <script type="text/javascript" src="/satang/js/jquery-3.6.1.min.js"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
    		$('#idck').click(function(){
    			// 할 일
    			// 1. 아이디 입력 내용 꺼내오기
    			var sid = $('#id').val();
    			//alert(sid);
    			// 2. 입력된 아이디를 서버에 보내고 결과 받기
    			// 비동기통신에 해당하므로 ajax() 로 처리
    			$.ajax({
    				url: '/satang/member/idCheck.smart',
    				type: 'POST',
    				dataType: 'json',
    				data: {
    					id: sid
    				},
    				success: function(data) {
    					if(data.result == 'OK') {
    						$('#idckmsg').removeClass('w3-text-red').addClass('w3-text-green').html('* 사용가능한 아이디입니다');
    					} else {
    						$('#idckmsg').removeClass('w3-text-green').addClass('w3-text-red').html('# 사용불가능한 아이디입니다');
    						$('#id').val('');
    						$('#id').focus();
    					}
    						$('#idckmsg').css('display', 'block');
    				},
    				error: function() {
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
        <!-- 아래에 원래 w3-padding 클래스속성이 있었는데 이건 important라서 pdh30이 안먹힘 -->
        <div>
            <form method="get" action="result.html" name="frm" id="frm"
                class="w3-col w3-round-large w3-card-4 mgb20 pdh30">
                <div class="w3-col mgb15">
                    <div class="w3-col m3 w3-right-align pdr10 ft16 w3-text-grey">
                        <label for="id">Name:</label>
                    </div>
                    <div class="w3-col m9">
                        <input type="text" name="name" id="name" class="w3-col m10 w3-input w3-border"
                            placeholder="이름을 입력하세요" required>
                    </div>
                </div>
                <div class="w3-col mgb15">
                    <div class="w3-col m3 w3-right-align pdr10 ft16 w3-text-grey">
                        <label for="id">ID:</label>
                    </div>
                    <div class="w3-col m9">
                        <div class="w3-col m10">
                            <div class="w80 w3-right w3-button w3-blue w3-hover-aqua" id="idck">check</div>
                            <div class="w3-rest pdr10">
                                <input type="text" name="id" id="id" class="w3-col w3-input w3-border"
                                    placeholder="아이디를 입력하세요" required>
                            </div>
                            <p class="w3-col w3-center" id="idckmsg" style="display: none; margin-top: 5px; margin-bottom: 0px;"># 사용할 수 없는 아이디</p> <!-- 추가됨 -->
                        </div>
                    </div>
                </div>
                <div class="w3-col mgb15">
                    <div class="w3-col m3 w3-right-align pdr10 ft16 w3-text-grey">
                        <label for="pw">PW:</label>
                    </div>
                    <div class="w3-col m9">
                        <input type="password" name="pw" id="pw" class="w3-col m10 w3-input w3-border"
                            placeholder="비밀번호를 입력하세요" required>
                    </div>
                </div>
                <div class="w3-col mgb15">
                    <div class="w3-col m3 w3-right-align pdr10 ft16 w3-text-grey">
                        <label for="repw">rePW:</label>
                    </div>
                    <div class="w3-col m9">
                        <!-- 확인용 태그이므로 name 속성 제외 -->
                        <input type="password" id="repw" class="w3-col m10 w3-input w3-border"
                            placeholder="비밀번호를 한번 더 입력하세요" required>
                    </div>
                </div>
                <div class="w3-col mgb15">
                    <div class="w3-col m3 w3-right-align pdr10 ft16 w3-text-grey">
                        <label for="text">e-mail:</label>
                    </div>
                    <div class="w3-col m9">
                        <input type="text" name="email" id="email" class="w3-col m10 w3-input w3-border"
                            placeholder="이메일을 입력하세요" required>
                    </div>
                </div>
                <div class="w3-col mgb15">
                    <div class="w3-col m3 w3-right-align pdr10 ft16 w3-text-grey">
                        <label for="text">Phone:</label>
                    </div>
                    <div class="w3-col m9">
                        <input type="text" name="phone" id="phone" class="w3-col m10 w3-input w3-border"
                            placeholder="전화번호를 입력하세요" required>
                    </div>
                </div>
                <div class="w3-col mgb15">
                    <div class="w3-col m3 w3-right-align pdr10 ft16 w3-text-grey">
                        <label for="gen">Gender:</label>
                    </div>
                    <div class="w3-col m9">
                        <div class="w3-col m10" id="gen">
                            <div class="w3-half w3-center">
                                <input type="radio" name="gen" id="mgen" class="w3-radio" value="M"
                                    onchange="getGen(this)">
                                <label for="mgen" class="w3-col m6 glbl ft12">남자</label>
                            </div>
                            <div class="w3-half w3-center">
                                <input type="radio" name="gen" id="fgen" class="w3-radio" value="F"
                                    onclick="getGen(this)">
                                <label for="fgen" class="w3-col m6 glbl ft12">여자</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="w3-col mgb15" id="selAvt" style="display: none;">
                    <div class="w3-col m3 w3-right-align pdr10 ft16 w3-text-grey">
                        <label>Avatar:</label>
                    </div>
                    <div class="w3-col m9">
                        <div class="w3-col m10 w3-center">
                            <!-- male avatars -->
                            <div class="w3-col inblock" id="mavt">
                                <div class="avtfr inblock">
                                    <label class="w3-col avtimg w3-border">
                                        <img src="/satang/img/avatar/img_avatar1.png" class="avtimg">
                                    </label>
                                    <div class="w3-col">
                                        <input type="radio" name="avt" id="a1" val="1">
                                    </div>
                                </div>
                                <div class="avtfr inblock">
                                    <label class="w3-col avtimg w3-border">
                                        <img src="/satang/img/avatar/img_avatar2.png" class="avtimg">
                                    </label>
                                    <div class="w3-col">
                                        <input type="radio" name="avt" id="a2" val="2">
                                    </div>
                                </div>
                                <div class="avtfr inblock">
                                    <label class="w3-col avtimg w3-border">
                                        <img src="/satang/img/avatar/img_avatar3.png" class="avtimg">
                                    </label>
                                    <div class="w3-col">
                                        <input type="radio" name="avt" id="a3" val="3">
                                    </div>
                                </div>
                            </div>
                            <!-- female avatars -->
                            <div class="w3-col" id="favt">
                                <div class="avtfr inblock">
                                    <label class="w3-col avtimg w3-border">
                                        <img src="/satang/img/avatar/img_avatar4.png" class="avtimg">
                                    </label>
                                    <div class="w3-col">
                                        <input type="radio" name="avt" id="a4" val="4">
                                    </div>
                                </div>
                                <div class="avtfr inblock">
                                    <label class="w3-col avtimg w3-border">
                                        <img src="/satang/img/avatar/img_avatar5.png" class="avtimg">
                                    </label>
                                    <div class="w3-col">
                                        <input type="radio" name="avt" id="a5" val="5">
                                    </div>
                                </div>
                                <div class="avtfr inblock">
                                    <label class="w3-col avtimg w3-border">
                                        <img src="/satang/img/avatar/img_avatar6.png" class="avtimg">
                                    </label>
                                    <div class="w3-col">
                                        <input type="radio" name="avt" id="a6" val="6">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <!-- button tags -->
        <!-- 아래 hidden(smart.css에 정의됨)이 없으면 w3-round-large가 안먹힘 -->

        <div class="w3-col w3-round-large w3-card-4 hidden">
            <div class="w3-col w3-third w3-green w3-hover-lime w3-button" id="hbtn">home</div>
            <div class="w3-col w3-third w3-orange w3-hover-khaki w3-button" id="jbtn">join</div>
            <div class="w3-col w3-third w3-blue w3-hover-aqua w3-button" id="lbtn">login</div>
        </div>
    </div>
    </div>
    </div>
    <script type="text/javascript">
        function getGen(el) {
            var gval = el.value;
            if (gval == 'M') {
                document.getElementById('favt').style.display = 'none';
                document.getElementById('mavt').style.display = 'block';
                document.getElementById('selAvt').style.display = 'block';
            } else if (gval == 'F') {
                document.getElementById('favt').style.display = 'block';
                document.getElementById('mavt').style.display = 'none';
                document.getElementById('selAvt').style.display = 'block';
            }
        }

    </script>
</body>

</html>