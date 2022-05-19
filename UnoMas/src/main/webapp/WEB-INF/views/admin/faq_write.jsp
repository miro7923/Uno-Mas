<%@page import="com.april.unomas.domain.AdminVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%AdminVO vo = (AdminVO) session.getAttribute("saveID");%>
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
    
    
    <div class="css-171zbec eug5r8l1">
        <h3 class="css-1ttk28w eug5r8l0">자주하는 질문</h3>
        <div class="css-185m8ch e1153ede0">
            <form method="post">
            <input type="hidden" name="admin_num" value="<%=vo.getAdmin_num()%>">
                <div class="css-17bp14q e1vbjq4w3">
                    <div class="css-mm5tap e1vbjq4w2"><label for="inquiry-subject" data-testid="label-text">제목<span data-testid="label-required-text" class="css-hwfcu5 e1vbjq4w0">*</span></label></div>
                    <div class="css-12l4j2c e1vbjq4w1">
                        <div class="css-1waqr6j e1uzxhvi4">
                            <div height="44" class="css-t7kbxx e1uzxhvi1"><input data-testid="input-box" id="inquiry-subject" name="faq_title" placeholder="제목을 적으세요" type="text" height="44" class="css-1fapsij e1uzxhvi0"></div>
                        </div>
                    </div>
                </div>
                <div class="css-17bp14q e1vbjq4w3">
                    <div class="css-mm5tap e1vbjq4w2"><label for="inquiry-subject" data-testid="label-text">카테고리<span data-testid="label-required-text" class="css-hwfcu5 e1vbjq4w0">*</span></label></div>
                    <div class="css-12l4j2c e1vbjq4w1">
                        <div class="css-1waqr6j e1uzxhvi4">
                            <div height="44" class="css-t7kbxx e1uzxhvi1">
                            
<!--                             <input data-testid="input-box" placeholder="카테고리를 적으세요" type="text"   > -->
                            <select id="inquiry-subject" name="qnacate_num" class="css-1fapsij e1uzxhvi0">
                            	<option value="">카테고리를 선택하세요</option>
                            	<option value="1">배송/포장</option>
                            	<option value="2">취소/교환/환불</option>
                            	<option value="3">이벤트/적립금</option>
                            	<option value="4">상품</option>
                            	<option value="5">주문/결제</option>
                            	<option value="6">회원</option>
                            	<option value="7">서비스 이용</option>
                            </select>
                            
                            </div>
                        </div>
                    </div>
                </div>
                <div class="css-rm6te4 e1fgvk594">
                    <div class="css-17bp14q e1vbjq4w3">
                        <div class="css-mm5tap e1vbjq4w2"><label for="inquiry-contents" data-testid="label-text">내용<span data-testid="label-required-text" class="css-hwfcu5 e1vbjq4w0">*</span></label></div>
                        <div class="css-12l4j2c e1vbjq4w1">
                            <div class="css-0 e1tjt2bn7">
                                <div class="css-77m6at e1tjt2bn5"><textarea id="inquiry-contents" inputmode="text" aria-label="textarea-message" name="faq_content" class="css-835sfl e1tjt2bn1" placeholder="내용을 적으세요"></textarea>
                                    <span class="content-length-counter css-zgkz6w e1tjt2bn0"><span><span class="css-pa1wgl e1tjt2bn2">0자 </span><span class="css-1eqlkgi e1tjt2bn3">/ 500자</span></span></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
               
                
                <div class="css-1spu0j4 ebvrvv11"><button type="submit" class="css-13kn1it ebvrvv10">등록</button></div>
            </form>
        </div>
    </div>
    
    
</div>
                        
                        
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
		$(document).ready(function() {
			$("#qni_category").change(function() {
// 				alert($(this).val());
				var changeVal = $(this).val();
				location.href="/admin/faq_sort${pagingVO.makeQuery(pageNum) }&qnacate_num="+changeVal;
			});
		});
	</script>
        
<!--  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

  <jsp:include page="../inc/adminFooter.jsp"></jsp:include>