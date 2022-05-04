# JAVA Spring) 1인가구를 위한 쇼핑몰 Uno más 개발일지 6 - 로그인 페이지, 아이디 찾기 페이지, 비밀번호 찾기 페이지, 새로운 비밀번호 변경 페이지 제작

* 작성일 : 2022.05.02
* 작성자 : 오은현
* 팀원 : 김진영, 박승지, 반현빈, 오성은, 오은현, 윤정환, 황유진
* GitHub Repository : [https://github.com/miro7923/Uno-Mas](https://github.com/miro7923/Uno-Mas)<br><br><br>

# 개발환경
* Window10
* OpenJDK 8
* Spring Tool Suite 4.10.0
* Spring framework 4.3.1.RELEASE
* Tomcat 8.5
* MySQL Workbench 8.0.19<br><br><br>

# 기간
* 2022.4.13 ~ 2022.5.20<br><br><br>

# 주제
* 웹 백엔드 수업 중 마지막 과제로 팀 프로젝트를 진행하게 되었다.
* 조건은 `Spring` 기반으로 웹 사이트를 제작하는 것이다.
* 총 팀원은 7명이며, 우리 팀은 `1인 가구를 위한 쇼핑몰`을 주제로 정했다.
* 프로젝트 이름으로 정해진 `Uno más`는 스페인어로 `하나 더`라는 뜻이다. <br><br><br>

# 진행상황 1 - 로그인 페이지 frontend
## login.jsp
* 사용자가 홈페이지에 로그인을 할 수 있는 페이지를 만들었다.

## 로그인 페이지
<p align="center"><img src="https://miro7923.github.io/assets/images/login.jpg" width="800"></p>
* 로그인의 전체적인 모양은 "마켓컬리"를 참고했다.
* 버튼의 색은 "우노마스"에서 주색상으로 정한 #B9CE45를 사용했다. 아마 많은 페이지에서 볼 수 있는 색상일 것이다.
* 로그인페이지에서 아이디찾기와 비밀번호 찾기로 바로 이동할 수 있게 버튼을 구현하였다.
* 로그인정보도 저장할 수 있도록 체크박스 형식을 이용했다.

### 로그인 페이지 출력 ajax
<p align="center"><img src="https://miro7923.github.io/assets/images/loginAjax.jpg" width="800"></p>
* 아이디를 입력하지 않은 경우 비밀번호 아래칸에 빨간색으로 '아이디를 입력하세요.' 라는 글자를 나오게 했다.
* 비밀번호를 입력하지 않은 경우도 위와 동일한 방법으로 만들었다.
* 아이디와 비밀번호를 모두 입력한 경우 경고글이 나오지 않는다.
<br><br>

# 진행상황 2 - 아이디/비밀번호 찾기 페이지 frontend
## findID.jsp
* 사용자가 본인의 아이디/비밀번호를 잊어 로그인이 어려울 경우 잊은 아이디 또는 비밀번호를 찾을 수 있는 페이지를 만들었다.
  
## 아이디 찾기 페이지
<p align="center"><img src="https://miro7923.github.io/assets/images/fid.jpg" width="800"></p>
* 로그인 페이지와 유사하게 디자인하였으며 ajax기능 또한 비슷하게 만들었다.
* 아이디는 이름정보와 이메일을 이용하여 찾을 수 있도록 구성하였다.

## 비밀번호 찾기 페이지
<p align="center"><img src="https://miro7923.github.io/assets/images/fpw.jpg" width="800"></p>
* 아이디 찾기 페이지와 비슷한 디자인으로 구성하였다.
* 비밀번호는 이름과 아이디, 이메일정보를 입력할 수 있도록 input 태그를 만들었고, 이메일로 본인 인증을 할 수 있도록 버튼을 생성하였다.
<br><br>

# 진행상황 3 - 새로운 비밀번호로 변경 페이지 frontend
## changePW.jsp
* 비밀번호 찾기에서 이메일을 통한 본인 인증 후 새로운 비밀번호를 설정 할 수 있도록 페이지를 구현했다.

## 새로운 비밀번호 설정 페이지
<p align="center"><img src="https://miro7923.github.io/assets/images/chPW.jpg" width="800"></p>
* 해당 페이지에서는 처음 입력한 새로운 비밀번호와 두번째 입력한 새로운 비밀번호 재확인의 비밀번호가 동일해야만 변경되도록 ajax를 설정하였다.
* 만일 서로 다를경우 비밀번호가 다르니 확인해달라는 경고문구를 보이게 했다. 

# 마감까지 
* `D-18`