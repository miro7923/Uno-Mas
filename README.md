# Uno Más

<p align="center"><img src="/images/unomas-logo.png" width="400"></p>

* 쇼핑몰 웹 프로젝트
* 기간 : 2022.04.13 ~ 2022.06.02
* 환경 : Apache Tomcat 8.5, Chrome 브라우저
* 주제 : 식자재 쇼핑몰
* 개발 : Spring Tool Suite 4, MySQL Workbench
* 사용 언어 : JAVA(JDK 1.8), MySQL8, HTML5, CSS3, JavaScript, JSP & Servlet
* 사용 기술 : Spring Framework, MyBatis, MVC Model2, jQuery, Ajax, Open API(다음 우편번호, 아임포트 결제, JAVA 메일)
* 디자인 프레임워크 : Bootstrap

# 프로젝트 상세내용
## 주제
```
* 1인 가구를 위해 소용량 식자재를 저렴하게 파는 쇼핑몰
```

## 목적
```
* 1인 가구가 계속 늘어나고 있지만 1인 가구를 위해 소량 포장된 식자재를 저렴한 가격에 파는 쇼핑몰이 많지 않다. 
* 저렴하게 사고 싶어서 마트에 가면 대량으로 포장된 상품을 사야만 하는데 1인 가구는 대용량 식자재가 상하기 전에 소비하는 것이 쉽지 않다.

- 1인 가구도 부담 없이 구매할 수 있도록 소량 포장된 식자재를 저렴하게 구매할 수 있는 쇼핑몰 기획
- 하나의 상품에 대한 공동구매를 통해 내가 원하는 수량만큼 저렴하게 구매할 수 있는 서비스 기획 
```

## 구현 목표
* 회원
```
* 식자재 종류별로 구분된 상품 목록 확인 및 구매 가능
* 구매한 상품에 대한 후기와 문의글 확인 및 작성 가능
* 공동구매 참여 가능
```

* 관리자
```
* 상품 등록 및 판매 현황 확인
* 결제 & 배송 관리
* 고객 문의 관리
```

## ERD 다이어그램

<p align="center"><img src="/images/erdDiagram.png"></p>

## 구동 화면
* 메인 페이지
<p align="center"><img src="/images/unomasMain.png"></p>

## 개발일지
1. [주제 결정 및 역할 분배 (작성자 : 황유진)](DevLog/2022-04-14-uno-mas-dev-log-01.md)<br>
2. [Spring Legacy 프로젝트를 위한 .gitignore 설정 (작성자 : 황유진)](DevLog/2022-04-20-uno-mas-dev-log-02.md)<br>
3. [Spring Legacy 프로젝트와 GitHub 원격저장소 연결하고 사이트 템플릿 초기설정 (작성자 : 황유진)](DevLog/2022-04-21-uno-mas-dev-log-03.md)<br>
4. [상품 상세 페이지, 리뷰 작성 페이지, 문의 작성 페이지 제작 (작성자 : 황유진)](DevLog/2022-04-25-uno-mas-dev-log-04.md)<br>
5. [카테고리별 상품 목록 페이지, 신상품 목록 페이지, 특가 목록 페이지 제작 (작성자 : 황유진)](DevLog/2022-04-26-uno-mas-dev-log-05.md)<br>
6. [주문페이지와 주문완료페이지 제작 (작성자 : 황유진)](DevLog/2022-04-28-uno-mas-dev-log-06.md)<br>
7. [쇼핑몰 RDBMS 설계 및 생성 (작성자 : 황유진)](DevLog/2022-05-01-uno-mas-dev-log-07.md)<br>
8. [(TDD) Junit4를 사용한 DB 연결 테스트 코드 작성 (작성자 : 황유진)](DevLog/2022-05-02-uno-mas-dev-log-08.md)<br>
9. [카테고리별로 해당되는 상품 목록 출력하기 (작성자 : 황유진)](DevLog/2022-05-03-uno-mas-dev-log-09.md)<br>
10. [상품목록 페이징 처리 (작성자 : 황유진)](DevLog/2022-05-03-uno-mas-dev-log-10.md)<br>
11. [로그인 페이지, 아이디 찾기 페이지, 비밀번호 찾기 페이지, 새로운 비밀번호 변경 페이지 제작 (작성자 : 오은현)](DevLog/2022-05-03-uno-mas-dev-log-11.md)<br>
12. [회원정보 수정, 취소/반품안내 페이지 제작 (작성자 : 오은현)](DevLog/2022-05-03-uno-mas-dev-log-12.md)<br>
13. [대분류별 상품목록페이지에서 소분류별 상품 출력하는 기능 구현 (작성자 : 황유진)](DevLog/2022-05-05-uno-mas-dev-log-13.md)<br>
14. [신상품 페이지와 특가상품 페이지에서 할인상품의 할인율과 할인가 보여주기 (작성자 : 황유진)](DevLog/2022-05-10-uno-mas-dev-log-14.md)<br>
15. [후기글 첨부 이미지의 수정과 삭제 (작성자 : 황유진)](DevLog/2022-05-17-uno-mas-dev-log-15.md)<br>
16. [Ajax로 이미지파일 업로드 (작성자 : 황유진)](DevLog/2022-05-18-uno-mas-dev-log-16.md)<br>
17. [새로고침 없이 게시판 목록 불러오기 (작성자 : 황유진)](DevLog/2022-05-22-uno-mas-dev-log-17.md)<br>
18. [결제기능 추가(아임포트 API) (작성자 : 황유진)](DevLog/2022-05-26-uno-mas-dev-log-18.md)<br>
19. [주문시 베송지 목록 새 창에서 선택된 배송지 정보 가져오는 기능 추가 (작성자 : 황유진)](DevLog/2022-05-27-uno-mas-dev-log-19.md)<br>
