<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/defaultCss.css">
<link rel="stylesheet" href="${path}/resources/css/user_css/basicModal.css">

<script src="${path}/resources/js/user_js/basicModal.js"></script>
<title>Insert title here</title>
</head>
<body>
  	<div id="myModal" class="modal">
      <div class="modal-content">
      	 <form method="post">
         	<p class="x-box" onClick="close_pop();"><span>X</span></p>

		 	<p style="color: red; font-size: 11pt;" name="warnning-text"></p>
         	<p class="pw-text" name="modal-text">비밀번호 입력</p>
         
         	<input type="password" class="modal-pw" name="pw"><br>
            
         	<input type="submit" id="submit" class="modal-submit" value="확인">
         </form>  
      </div>
    </div>

</body>

<script src="${path}/resources/js/user_js/basicModal.js"></script>
</html>