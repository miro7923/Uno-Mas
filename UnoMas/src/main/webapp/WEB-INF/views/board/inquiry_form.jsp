<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">

<!-- Header start -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet" href="${path}/resources/css/order_css/order.css?after22">
<link rel="stylesheet" href="${path}/resources/css/board_css/inquiry_form.css?after" type="text/css">
<!-- Header end -->
<body>
	<!-- Header Section Begin -->
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- Header End -->

 <div class="my-5 container" style="width:820px;" >
    <h2>1:1 문의</h2>
        <div class="my-5 p-2" style="border-top: 3px solid rgb(51,51,51); ">
         <form onsubmit="checkAll()" method="post" enctype="multipart/form-data">
            <div style="width:780px;">
                <div class="row my-4">
                    <div class="col-2" style="line-height: 40px; " > 
                    <label class="mx-2">유형</label> 
                    </div>
	<input type="hidden" name="user_num" value="">
                    <div class="col-5 input-group-prepend" style="display: inline;">
                        <select class="custom-select" id="select1" name="qnacate_num" onchange="submitButtonColorChange()">
                            <option selected disabled>문의 유형을 선택해주세요</option>
                            <option value="1">배송/포장</option>
                            <option value="2">취소/교환/환불</option>
                            <option value="3">이벤트/적립금</option>
                            <option value="4">상품</option>
                            <option value="5">주문/결제</option>
                            <option value="6">회원</option>
                            <option value="7">서비스 이용</option>
                        </select>
                    </div>

                    <div class="col-5 input-group-prepend " style="display: inline;">
                        <select class="custom-select" id="select2" name="qnacate2" onchange="submitButtonColorChange()">
                            <option selected disabled>상세 유형을 선택해주세요</option>

                        </select>    
                    </div>

                    
                </div>

                <div class="row my-4">
                    <div class="col-2" style="line-height: 40px; " > 
                        <label class="mx-2">제목</label> 
                    </div>

                    <div class="col-10">
                    <input type="text" class="form-control" id="subject" name="qna_title" placeholder="제목을 입력해주세요" >
                    </div>
                </div>

                <div class="row my-4">
                    <div class="col-2" style="line-height: 40px; " > 
                        <label class="mx-2">내용</label> 
                    </div>

                    <div class="col-10">
                         <textarea class="form-control" rows="20" id="content" style="resize: none;" name="qna_content"></textarea>
                    </div>

                </div>

                <div class="row my-3">
                    <div class="col-2"> 
                    </div>
                    
                    <div class="col-10" >
                        <div class="row pl-3" >
<!--                             <input class="form-control" type="file" style="width: 100px; height: 100px; background-image:url(https://cdn-icons-png.flaticon.com/512/1555/1555492.png);background-position:top right; background-repeat:no-repeat; background-size: 100px;" name="qna_img" id="qna_img"></input> -->
<!--                         	<label class="form-control" for="input-file" style="width: 100px; height: 100px; background-image:url(https://cdn-icons-png.flaticon.com/512/1555/1555492.png);background-position:top right; background-repeat:no-repeat; background-size: 100px;" ></label> -->
                        	<input id="input-file" type="file" name="qna_image1"></input>
<!--                         	<label class="form-control" for="input-file" style="width: 100px; height: 100px; background-image:url(https://cdn-icons-png.flaticon.com/512/1555/1555492.png);background-position:top right; background-repeat:no-repeat; background-size: 100px;" ></label> -->
                        	<input id="input-file" type="file" name="qna_image2"></input>
                        </div>
                        <div class="row pl-3 my-3">
                            * 4MB 이하의 이미지만 업로드 가능합니다.<br>
                            * 상품과 무관한 내용이거나 음란 및 불법적인 내용은 통보없이 삭제 될 수 있습니다.<br>
                        </div>
                    </div>
                </div>
                
                <div style="border-top: 1px solid rgb(221,221,211);">
                    <button type="submit" class="btn btn-secondary my-5" id="submitButton" disabled style="display: block; margin: auto; width: 160px; height: 56px;">등록</button>
                </div>
            </div>
         </form>   
        </div>
    
    </div>


	<!-- Footer Section Begin -->
	<jsp:include page="../inc/bottom.jsp"></jsp:include>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script src="${path}/resources/js/jquery-3.3.1.min.js"></script>
	<script src="${path}/resources/js/bootstrap.min.js"></script>
	<script src="${path}/resources/js/jquery-ui.min.js"></script>
	<script src="${path}/resources/js/jquery.countdown.min.js"></script>
	<script src="${path}/resources/js/jquery.nice-select.min.js"></script>
	<script src="${path}/resources/js/jquery.zoom.min.js"></script>
	<script src="${path}/resources/js/jquery.dd.min.js"></script>
	<script src="${path}/resources/js/jquery.slicknav.js"></script>
	<script src="${path}/resources/js/owl.carousel.min.js"></script>
	<script src="${path}/resources/js/main.js"></script>
	<script src="${path}/resources/js/complete.js"></script>
	<script src="${path}/resources/js/inquiry_form.js"></script>


</body>
</html>