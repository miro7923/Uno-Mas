<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>회사소개</title>
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link rel="stylesheet" href="${path}/resources/css/about_us.css?after" type="text/css">
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="/UnoMas/index"><img src="${path}/resources/img/logo.png" alt="..." /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link" href="#services">서비스</a></li>
                        <li class="nav-item"><a class="nav-link" href="#portfolio">가치</a></li>
                        <li class="nav-item"><a class="nav-link" href="#about">연혁</a></li>
                        <li class="nav-item"><a class="nav-link" href="#team">팀원소개</a></li>
                        <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead">
            <div class="container">
                <div class="masthead-subheading">Welcome To Uno-mas!</div>
                <div class="masthead-heading text-uppercase">만나서 반갑습니다</div>
                <a class="btn btn-primary btn-xl text-uppercase" href="#services">Tell Me More</a>
            </div>
        </header>
        <!-- Services-->
        <section class="page-section" id="services">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">서비스 소개</h2>
                    <h3 class="section-subheading text-muted">우노마스는 스페인어로 '하나 더'라는 뜻입니다.</h3>
                    <p class="serviceP">
                    	요즘 대부분의 사람들은 장을 보기위해 대형마트나 온라인 쇼핑몰을 이용합니다.<br> 
						시간과 장소에 구애받지 않는 편한 주문배송 시스템과 식품의 청결함은 이젠 당연하게 소비자가 가져야할 권리가 되었습니다.<br>
						하지만 우리는 여기서 그치지 않고 어릴 적 재래시장에서 상품을 구매하는 과정에서 받는 '덤'에 주목했습니다.<br>
						뜻밖에 얻는 즐거움으로 행복을 나누고자 Uno-mas를 런칭하게 되었습니다. <br>
                    </p>
                </div>
                <div class="row text-center">
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-shopping-cart fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">새벽배송</h4>
                        <p class="text-muted">저녁에 주문해 놓고 아침에 일어나 상품을 받아보세요!<br>
                        신선한 상품을 빠르게 받아보실 수 있습니다.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-laptop fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">쉬운반품</h4>
                        <p class="text-muted">상품이 오배송 되었거나 파손되어있나요?<br>
                        쉬운반품서비스로 빠르고 간편하게 새로운 상품을<br> 받아보세요.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-lock fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">정보보안</h4>
                        <p class="text-muted">우노마스는 당신의 정보보호에 최선을 다하겠습니다.<br>
                        당신의 동의 없는 정보유출을 막겠습니다.</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- Portfolio Grid-->
        <section class="page-section bg-light" id="portfolio">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">가치</h2>
                    <h3 class="section-subheading text-muted">우노마스의 핵심가치입니다.</h3>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 1-->
                        <div class="portfolio-item">
                                <img class="img-fluid" src="${path}/resources/img/about_us/portfolio/1.jpg" alt="..." />
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">신뢰</div>
                                <div class="portfolio-caption-subheading text-muted">구매완료를 하면 제대로 물건이 도착하는
                                	<br>정상적인 거래를 보장하겠습니다.</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 2-->
                        <div class="portfolio-item">
                                <img class="img-fluid" src="${path}/resources/img/about_us/portfolio/2.jpg" alt="..." />
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">가격</div>
                                <div class="portfolio-caption-subheading text-muted">유통과정 간소화로 원가를 낮추어
                                	<br>저렴한 가격으로 상품을 제공하겠습니다.</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <!-- Portfolio item 3-->
                        <div class="portfolio-item">
                                <img class="img-fluid" src="${path}/resources/img/about_us/portfolio/3.jpg" alt="..." />
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">상품</div>
                                <div class="portfolio-caption-subheading text-muted">품질 좋은 상품만을 취급하며,
                                	<br>유통 중 변질·파손된 상품은 교환해드리겠습니다.</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4 mb-lg-0">
                        <!-- Portfolio item 4-->
                        <div class="portfolio-item">
                                <img class="img-fluid" src="${path}/resources/img/about_us/portfolio/4.jpg" alt="..." />
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">배송</div>
                                <div class="portfolio-caption-subheading text-muted">빠른 배송으로
                                	<br>신선한 상품을 전달하겠습니다.</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6 mb-4 mb-sm-0">
                        <!-- Portfolio item 5-->
                        <div class="portfolio-item">
                                <img class="img-fluid" src="${path}/resources/img/about_us/portfolio/5.jpg" alt="..." />
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">편의성</div>
                                <div class="portfolio-caption-subheading text-muted">불필요한 구매과정을 개선하고
                                	<br>간소화 하겠습니다.</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <!-- Portfolio item 6-->
                        <div class="portfolio-item">
                                <img class="img-fluid" src="${path}/resources/img/about_us/portfolio/6.jpg" alt="..." />
                            <div class="portfolio-caption">
                                <div class="portfolio-caption-heading">행복</div>
                                <div class="portfolio-caption-subheading text-muted">무엇보다 당신의 쇼핑이 즐거운 일임을
                                	<br>느끼도록 노력하겠습니다.</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- About-->
        <section class="page-section" id="about">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">회사 연혁</h2>
                    <h3 class="section-subheading text-muted">우노마스가 걸어온 발자취입니다.</h3>
                </div>
                <ul class="timeline">
                    <li>
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="${path}/resources/img/about_us/about/1.jpg" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>2009-2011</h4>
                                <h4 class="subheading">팀 결성</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">Team April 구성원이 모여 사업구상을 하고,
                            	<br>입출고 시스템을 정립했습니다.</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="${path}/resources/img/about_us/about/2.jpg" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>March 2011</h4>
                                <h4 class="subheading">웹페이지 개설 및 판매 시작</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">웹페이지를 만들고 본격적으로 상품을 판매시작 했습니다.</p></div>
                        </div>
                    </li>
                    <li>
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="${path}/resources/img/about_us/about/3.jpg" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>December 2015</h4>
                                <h4 class="subheading">매출 10억 달성</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">고객님들의 열띤 성원에 매출 10억을 달성했습니다.</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image"><img class="rounded-circle img-fluid" src="${path}/resources/img/about_us/about/4.jpg" alt="..." /></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4>July 2020</h4>
                                <h4 class="subheading">미국 진출</h4>
                            </div>
                            <div class="timeline-body"><p class="text-muted">LA에 지사를 두고 미국 서부 진출을 시작했습니다.</p></div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-image">
                            <h4>
                                우리와
                                <br />
                                함께
                                <br />
                                성장해요!
                            </h4>
                        </div>
                    </li>
                </ul>
            </div>
        </section>
        <!-- Team-->
        <section class="page-section bg-light" id="team">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">팀원소개</h2>
                    <h3 class="section-subheading text-muted">우노마스를 이끌어가는 대표 팀원입니다.</h3>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="${path}/resources/img/about_us/team/yj.jpg" alt="yj" />
                            <h4>황유진</h4>
                            <p class="text-muted">팀장, 상품파트</p>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="${path}/resources/img/about_us/team/se.jpg" alt="se" />
                            <h4>오성은</h4>
                            <p class="text-muted">부팀장, 회원파트</p>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="${path}/resources/img/about_us/team/jy.png" alt="jy" />
                            <h4>김진영</h4>
                            <p class="text-muted">고객센터, 관리자페이지파트</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="${path}/resources/img/about_us/team/sj.jpg" alt="sj" />
                            <h4>박승지</h4>
                            <p class="text-muted">상품파트, 관리자페이지파트</p>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="${path}/resources/img/about_us/team/hb.png" alt="hb" />
                            <h4>반현빈</h4>
                            <p class="text-muted">메인페이지 파트</p>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="team-member">
                            <img class="mx-auto rounded-circle" src="${path}/resources/img/about_us/team/eh.jpg" alt="eh" />
                            <h4>오은현</h4>
                            <p class="text-muted">회원파트</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
<!--                             <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Larry Parker Twitter Profile"><i class="fab fa-twitter"></i></a> -->
<!--                             <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Larry Parker Facebook Profile"><i class="fab fa-facebook-f"></i></a> -->
<!--                             <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Larry Parker LinkedIn Profile"><i class="fab fa-linkedin-in"></i></a> -->
        <!-- Contact-->
        <section class="page-section" id="contact">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Contact Us</h2>
                </div>
                <form id="contactForm" data-sb-form-api-token="6400dfe3-6565-4b75-b865-2261324a6439">
                    <div class="row align-items-stretch mb-5">
                        <div class="col-md-6">
                            <div class="form-group">
                                <!-- Name input-->
                                <input class="form-control" id="name" type="text" placeholder="이름" data-sb-validations="required" />
                                <div class="invalid-feedback" data-sb-feedback="name:required">이름을 입력해주세요.</div>
                            </div>
                            <div class="form-group">
                                <!-- Email address input-->
                                <input class="form-control" id="email" type="email" placeholder="이메일" data-sb-validations="required,email" />
                                <div class="invalid-feedback" data-sb-feedback="email:required">이메일을 입력해주세요.</div>
                                <div class="invalid-feedback" data-sb-feedback="email:email">올바른 이메일 형식이 아닙니다.</div>
                            </div>
                            <div class="form-group mb-md-0">
                                <!-- Phone number input-->
                                <input class="form-control" id="phone" type="tel" placeholder="연락처" data-sb-validations="required" />
                                <div class="invalid-feedback" data-sb-feedback="phone:required">연락처를 입력해주세요.</div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group form-group-textarea mb-md-0">
                                <!-- Message input-->
                                <textarea class="form-control" id="message" placeholder="무엇을 도와드릴까요?" data-sb-validations="required"></textarea>
                                <div class="invalid-feedback" data-sb-feedback="message:required">메시지를 입력해주세요.</div>
                            </div>
                        </div>
                    </div>
                    <!-- Submit success message-->
                    <!---->
                    <div class="d-none" id="submitSuccessMessage">
                        <div class="text-center text-white mb-3">
                            <div class="fw-bolder">최대한 빠르게 회신해드리겠습니다.</div>
                        </div>
                    </div>
                    <!-- Submit error message-->
                    <!---->
                    <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">문의 전송에 실패했습니다.</div></div>
                    <!-- Submit Button-->
                    <div class="text-center"><button class="btn btn-primary btn-xl text-uppercase disabled" id="submitButton" type="submit">Send Message</button></div>
                </form>
            </div>
        </section>
        <!-- Footer-->
        <footer class="footer py-4">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-4 text-lg-start">Copyright &copy; uno más 2022</div>
                    <div class="col-lg-4 my-3 my-lg-0">
                    </div>
                    <div class="col-lg-4 text-lg-end">
                        <a class="link-dark text-decoration-none me-3" href="#!">Privacy Policy</a>
                        <a class="link-dark text-decoration-none" href="#!">Terms of Use</a>
                    </div>
                </div>
            </div>
        </footer>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${path}/resources/js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
