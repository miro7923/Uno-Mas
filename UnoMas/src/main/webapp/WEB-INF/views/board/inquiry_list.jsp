<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">

<!-- Header start -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<link rel="stylesheet" href="${path}/resources/css/order.css?after22">

<!-- Header end -->
<body>
	<!-- Header Section Begin -->
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- Header End -->

 <div class="my-5 container" style="width:820px;">
    <h2>1:1 문의${qnacate.qnacate_name }11</h2>
    <input type="button" value="글쓰기" onclick="location.href='/inquiry_form';">
            <div class="my-5 p-2" style="border-top: 3px solid rgb(51,51,51); ">
                <table class="table">
                    <thead>
                      <tr class="th">
                        <th scope="col" class="th_subject">제목</th>
                        <th scope="col" class="th_regdate">작성일</th>
                        <th scope="col" class="th_answerstatus">답변상태</th>
                      </tr>
                    </thead>
                </table>
						<c:forEach items="${boardList }" var="vo">
                <table class="table">
                    <tbody>
                      <tr class="th">
                        <!--  <td class="td_subject" onclick="asyncMovePage('/inquiry_board')"> -->
                        <td class="td_subject" onclick="board();">
						내용 컬러 #333333 ${vo.qna_title }</td>
                        <td class="td_regdate">작성일 컬러 #999999${vo.qna_regdate }</td>
                        <td class="td_answerstatus">답변대기 ${vo.qna_process }</td> <!-- 답변대기 컬러 #999999 답변완료 컬러 #5f0080; !-->
                      </tr>
                      
                    </tbody>
                </table>
                
                <div class="board" id="bodyContents" >
			        <div class="category py-3">
			            <span class="px-3">${vo.qnacate_num } 1차 카테고리 ${vo.qnaCateVO.qnacate_name }</span>
			            <span> > </span>
			            <span> 2차 카테고리 ${vo.qnacate2 }</span>
			        </div>
			        <div class="question mt-3 pb-5 px-3">
			            <img src="${path}/resources/img/question.svg" class="questionicon"> 
			            <span> 문의 내용 ${vo.qna_content }</span>
			        </div>
			
			        <div class="answer pb-5 px-3" >
			            <img src="${path}/resources/img/answer.svg" class="answericon"> 
			            <span> 답변 내용</span>
			        </div>
			    </div>
			    </c:forEach>
            </div>
           

            <div class="row justify-content-center">
              <div class="col-1 justify-content-center ">
                <ul class="pagination">
                  <li class="page-item">
                    <a class="page-link text-dark" href="#" aria-label="Previous">
                      <span aria-hidden="true">&lt;</span>
                    </a>
                  </li>
                  <li class="page-item"><a class="page-link text-dark" href="#">1</a></li>
                  <li class="page-item">
                    <a class="page-link text-dark" href="#" aria-label="Next">
                      <span aria-hidden="true">&gt;</span>
                    </a>
                  </li>
                </ul>
              </div>
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
	<script src="${path}/resources/js/inquiry_list.js"></script>



</body>
</html>