<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>


	<footer class="footer-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="footer-left">
                    	<h3 class="footerCS">고객행복센터</h3>
						<div class="CSNumber">
							<h3>
								<span class="number">1544-1544</span>
							</h3>
							<dl class="numberExpln">
								<dt>
									<a href="/UnoMas/board/faq_paging">365고객센터</a>
								</dt>
								<dd>오전 9시 - 오후 6시</dd>
							</dl>
						</div>
                        <h3 class="footerInquiry">
                           	<a href="/UnoMas/board/inquiry_paging">1:1문의</a>
                        </h3>
                        <dl class="inquiryExpln">
                        	<dt>24시간 접수 가능</dt>
                        	<dd>고객센터 운영시간에 순차적으로 답변해드리겠습니다.</dd>
                        </dl>
                    </div>
                </div>
                <div class="col-lg-6 company">
                    <ul class="list">
                    	<li>
                    		<a class="link" href="/UnoMas/about_us">회사소개</a>
                    	</li>
                    </ul>
                    법인명 (상호) : 주식회사 우노마스
                    <span class="bar">I</span>
                    사업자등록번호 : 123-45-67890
                     사업자정보 확인<br>
                    통신판매업 : 제 2022-서울강남-01234 호
                    <span class="bar">I</span>
                    개인정보보호책임자 : 홍길동<br>
                    주소 : 부산광역시 부산진구 동천로109 삼한골든게이트 7층
                    <span class="bar">I</span>
                    대표이사 : 김철수<br>
                    입점문의 : 입점문의하기
                    <span class="bar">I</span>
                    마케팅제휴 : business@unomas.com<br>
                    채용문의 : recruit@unomas.com
                    팩스 : 070-1234-5678
                    <span class="bar">I</span>
                    이메일 : help@unomas.com<br>
                    대량주문 문의 : bulkoder@unomas.com
                    
                </div>
            </div>
        </div>
        <div class="copyright-reserved">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="copyright-text">
Copyright &copy; Uno más <script>document.write(new Date().getFullYear());</script> All rights reserved.
                        </div>
                        <div class="payment-pic">
                            <img src="${path}/resources/img/payment-method.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>