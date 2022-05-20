<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
  
<!DOCTYPE html>
<html>
  <jsp:include page="../inc/adminHeader.jsp"></jsp:include>
        
<!--  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
        
        
      <div class="container">
            <div class="row">
            
                <div class="col-lg-12">
                
                    <div class="faq-accordin">
                        
                        <div class="page_aticle">
    <div class="head_aticle">
        <h2 class="tit">유저 목록<span class="tit_sub"></span></h2>
    </div>
    
    <select id="search_type" name="search_type">
<!--     	<option value="">검색조건</option> -->
    	<option value="title">제목</option>
<!--     	<option value="cate">카테고리</option> -->
<!--     	<option value="content">내용</option> -->
    </select>
    <input type="text" id="keyword" name="keyword" value="" placeholder="검색어 입력">
<%--     <button onclick="location.href='/qni_paging?page=1&perPageNum=${pList.perPageNum}&search_type=$search_type.val()&keyword=encodeURIComponent($keyword.val())'">검색</button> --%>
    <button id="search_btn" onclick="search()">검색</button>
    
    <script type="text/javascript">
    	function search() {
    		var search_type_val = document.getElementById("search_type");
    		var type_val = search_type_val.options[search_type_val.selectedIndex].value;
    		var keyword_val = document.getElementById("keyword").value;
    		var url = "/board/faq_paging?search_type="+type_val+"&keyword="+encodeURIComponent(keyword_val);
    		
    		location.href=url;
    	}
    </script>
    
    <form name="frmList" onsubmit="return chkFormList(this)">
        <input type="hidden" name="id" value="notice">
        


        <table class="xans-board-listheader jh" style="width: 100%;">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>가입일</th>
<!--                     <th>탈퇴일</th> -->
                </tr>
            </thead>
            <tbody>
            <c:forEach items="${userList }" var="vo">
                <tr>
                    <td width="50" nowrap="" align="center" >${vo.user_num }</td>
                    <td style="padding-left:10px; text-align:left; color:#999">
                        <a href="#"><b>${vo.user_id }</b></a>
                    </td>
                    <td width="100" nowrap="" align="center">
                        ${vo.user_name } </td>
                    <td width="100" nowrap="" align="center" class="eng2">${vo.user_regdate }</td>
<%--                     <td width="30" nowrap="" align="center" class="eng2">${vo.user_deldate }</td> --%>
                </tr>
            </c:forEach>

            </tbody>
        </table>
        
        <div class="layout-pagination">
        <div class="pagediv">

 <div class="row justify-content-center" style="justify-content: center!important;">
              <div class="col-1 justify-content-center ">
                <ul class="pagination">
                  <li class="page-item">
                    <a class="page-link text-dark" href='<c:url value="/admin/main${pagingVO.makeQuery(pagingVO.startPage-1) }"/>' aria-label="Previous">
                      <span aria-hidden="true">&lt;</span>
                    </a>
                  </li>
                  <c:forEach begin="${pagingVO.startPage }" end="${pagingVO.endPage }" var="pageNum">
                  <li class="page-item"><a class="page-link text-dark" href='<c:url value="/admin/main${pagingVO.makeQuery(pageNum) }"/>'>${pageNum }</a></li>
                  </c:forEach>
                  <li class="page-item">
                    <a class="page-link text-dark" href='<c:url value="/admin/main${pagingVO.makeQuery(pagingVO.endPage+1) }"/>' aria-label="Next">
                      <span aria-hidden="true">&gt;</span>
                    </a>
                  </li>
                </ul>
              </div>
            </div>

                    </div> <!-- paging div -->
        
        <table class="xans-board-search xans-board-search2">
            <tbody>
                <tr>

                    <td>
                    
                    <select id="search_type" name="search_type">
<!--     	<option value="">검색조건</option> -->
    	<option value="title">제목</option>
<!--     	<option value="cate">카테고리</option> -->
<!--     	<option value="content">내용</option> -->
    </select>
    <input type="text" id="keyword" name="keyword" value="" placeholder="검색어 입력">
<%--     <button onclick="location.href='/qni_paging?page=1&perPageNum=${pList.perPageNum}&search_type=$search_type.val()&keyword=encodeURIComponent($keyword.val())'">검색</button> --%>
    <button id="search_btn" onclick="search()">검색</button>
                                        
                   
                    
                    </td>
                </tr>
            </tbody>
        </table>
        </div><!-- paging 검색 div -->
    </form>
</div>
                        
                        
                    </div>
                </div>
            </div>
        </div>  
        
        
<!--  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

  <jsp:include page="../inc/adminFooter.jsp"></jsp:include>