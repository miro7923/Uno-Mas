<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<head>
<meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Uno más</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <!-- 경로 맨 뒤에 ?after는 가끔 캐시 사용 Disable 해도 수정사항 반영 안 될때가 있어서 달아놓음 -->
    <!-- 한번씩 캐시 삭제도 다 했고 아무 문제 없는데 css, js 수정사항이 적용이 안된다면 ?after1 or ?after2와 같이 경로 맨 뒤에 붙인 글자 내용을 바꿔보면 됨 -->
    <link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css?after" type="text/css">
    <link rel="stylesheet" href="${path}/resources/css/font-awesome.min.css?after" type="text/css">
    <link rel="stylesheet" href="${path}/resources/css/themify-icons.css?after" type="text/css">
    <link rel="stylesheet" href="${path}/resources/css/elegant-icons.css?after" type="text/css">
    <link rel="stylesheet" href="${path}/resources/css/owl.carousel.min.css?after" type="text/css">
    <link rel="stylesheet" href="${path}/resources/css/nice-select.css?after" type="text/css">
    <link rel="stylesheet" href="${path}/resources/css/jquery-ui.min.css?after" type="text/css">
    <link rel="stylesheet" href="${path}/resources/css/slicknav.min.css?after" type="text/css">
    <link rel="stylesheet" href="${path}/resources/css/style.css?after" type="text/css">
    <link rel="stylesheet" href="${path}/resources/css/headerFooter.css?after" type="text/css">
    
    <link rel="stylesheet" href="${path}/resources/css/board_css/inquiry_list.css?after" type="text/css">
    <link rel="stylesheet" href="${path}/resources/css/board_css/inquiry_form.css?after" type="text/css">
    <link rel="stylesheet" href="${path}/resources/css/board_css/board_main.css?after" type="text/css">
    <link rel="stylesheet" href="${path}/resources/css/board_css/board_sub_menu.css?after" type="text/css">
</head>