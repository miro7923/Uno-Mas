<%@page import="com.april.unomas.domain.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/defaultCss.css">
<link rel="stylesheet" href="${path}/resources/css/user_css/basicModal.css">


</head>
<body>
  	<div id="myModal" class="modal">
      <div class="modal-content">
      	 <form method="post">
         	<p class="x-box" onClick="close_pop();"><span>X</span></p>

         	<p class="pw-text" name="modal-text">비밀번호 입력</p>
         	<input type="text" name="id" value="${saveID }" hidden>
         	<input type="password" class="modal-pw" name="pw"><br>
         	<p style="color: red; font-size: 11pt;" name="warn-text"></p>
            
         	<input type="button" class="modal-submit" value="확인" onclick="pwCheckFunc()">
         </form>  
      </div>
    </div>

</body>

<script src="${path}/resources/js/user_js/basicModal.js"></script>
</html>