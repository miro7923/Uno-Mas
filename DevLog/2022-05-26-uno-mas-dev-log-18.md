# JAVA Spring) 1인가구를 위한 쇼핑몰 Uno más 개발일지 18 - 결제기능 추가(아임포트 API)

* 작성일 : 2022.05.26
* 작성자 : 황유진

* 팀원 : 김진영, 박승지, 반현빈, 오성은, 오은현, 황유진
* 팀장 : 황유진
* 부팀장 : 오성은
* GitHub Repository : [https://github.com/miro7923/Uno-Mas](https://github.com/miro7923/Uno-Mas)<br><br><br>

# 개발환경
* MacBook Air (M1, 2020)
* OpenJDK 8
* Spring Tool Suite 4.14.0
* Spring framework 4.3.1.RELEASE
* Tomcat 8.5
* MySQL Workbench 8.0.19<br><br><br>

# 기간
* 2022.4.13 ~ 2022.5.27<br><br><br>

# 주제
* 웹 백엔드 수업 중 마지막 과제로 팀 프로젝트를 진행하게 되었다.
* 조건은 `Spring` 기반으로 웹 사이트를 제작하는 것이다.
* 총 팀원은 6명이며, 우리 팀은 `1인 가구를 위한 쇼핑몰`을 주제로 정했다.
* 팀 이름으로 정해진 `Uno más`는 스페인어로 `하나 더`라는 뜻이다. <br><br><br>

# 진행상황 

<p align="center"><img src="https://miro7923.github.io/assets/images/unomas_pay1.png" width="900"></p>

* 쇼핑몰 결제기능을 추가했다!
* 아임포트에서 개발자 연습용으로 무료로 제공하는 결제 API가 있어 이걸 이용했다.
* 참고글
* [[개인프로젝트] 아임포트(i'mport) 결제 기능 구현하기](https://velog.io/@poseassome/%EA%B0%9C%EC%9D%B8%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-%EC%95%84%EC%9E%84%ED%8F%AC%ED%8A%B8import-%EA%B2%B0%EC%A0%9C-%EA%B8%B0%EB%8A%A5-%EA%B5%AC%ED%98%84%ED%95%98%EA%B8%B0)
* [[JAVA, SPRING, Iamport] 아임포트 검증하기(WEB,APP)](https://tyrannocoding.tistory.com/44)
* [아임포트(iamport) 결제연동을 위한 매뉴얼 GitHub](https://github.com/iamport/iamport-manual)

## pom.xml

```xml
<properties>
    <java-version>1.8</java-version>
    <org.springframework-version>4.3.8.RELEASE</org.springframework-version>
    <org.aspectj-version>1.6.10</org.aspectj-version>
    <org.slf4j-version>1.6.6</org.slf4j-version>
</properties>

<!-- 상단 properties 아래에 추가 -->
<repositories>
  <repository>
    <id>jitpack.io</id>
    <url>https://jitpack.io</url>
  </repository>
</repositories>

...

<!-- dependencies 안에 추가 -->
<dependency>
  <groupId>com.github.iamport</groupId>
  <artifactId>iamport-rest-client-java</artifactId>
  <version>0.2.14</version>
</dependency>
```

* 시작 전에 결제 정보 검증을 위해 아임포트에서 제공하는 API를 사용할 수 있도록 의존성을 추가해 준다.

## order.js

```javascript
var IMP = window.IMP; // 생략 가능

$(document).ready(function() {
    ...
	
    IMP.init("가맹점식별코드"); // 예: imp00000000
});
```

* [KG이니시스 테스트모드](https://guide.iamport.kr/8f617f32-564d-464e-9850-bf7648c609b0)로 진행할 것이다.
* 나는 `JSP` 페이지와 `JS` 파일을 따로 분리했기 때문에 `API` 호출을 위한 코드를 작성했다.

* 전체 코드

```javascript
function requestPay() {
    // 수령자 배송지 설정 
    var addr = '';
    var postalcode = '';
    if ($('input:radio[name=deliverSpot]:checked').val() == 1) {
        // 기본배송지 사용
        addr = $('#roadAddr').val() + ' ' + $('#detailAddr').val();
        postalcode = $('#postalcode').val();
    }
    else {
        // 신규배송지 사용
        addr = $('#newRoadAddress').val() + ' ' + $('#newDetailAddress').val();
        postalcode = $('#newPostalcode').val();
    }
	
    var uid = '';
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ // param
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: $('#orderCode').val(),
        name: $('#prodName0').val(),
        amount: $('#total').val(),
        buyer_email: $('#userEmail').text(),
        buyer_name: $('#userName').text(),
        buyer_tel: $('#phone').val(),
        buyer_addr: addr,
        buyer_postcode: postalcode
    }, function (rsp) { // callback
        if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
            uid = rsp.imp_uid;
            // 결제검증
            $.ajax({
                url: '/order/verify_iamport/' + rsp.imp_uid,
                type: 'post'
            }).done(function(data) {
                // 결제를 요청했던 금액과 실제 결제된 금액이 같으면 해당 주문건의 결제가 정상적으로 완료된 것으로 간주한다.
                if ($('#total').val() == data.response.amount) {
                    // jQuery로 HTTP 요청
                    // 주문정보 생성 및 테이블에 저장 
                    // @@ 주문정보는 상품 개수만큼 생성되어야 해서 상품 개수만큼 반복문을 돌린다
                    // 이때 order code는 모두 같아야 한다.
                    var roadAddr = '';
                    var detailAddr = '';
                    var recipient = '';
                    if ($('input:radio[name=deliverSpot]:checked').val() == 1) {
                        roadAddr = $('#roadAddr').val();
                        detailAddr = $('#detailAddr').val();
                        recipient = $('#name').val();
                    }
                    else {
                        roadAddr = $('#newRoadAddress').val();
                        detailAddr = $('#newDetailAddress').val();
                        recipient = $('#newName').val();
                    }
		        	
                    for (var i = 0; i < $('#prodCnt').val(); i++) {
                        // 데이터를 json으로 보내기 위해 바꿔준다.
                        var orderVO = JSON.stringify({
                            order_code: $('#orderCode').val(),
                            cart_num: $('#cartNum'+i).val(),
                            order_postalcode: postalcode,
                            order_roadaddr: roadAddr,
                            order_detailaddr: detailAddr,
                            user_num: $('#userNum').val(),
                            prod_num: $('#prodNum'+i).val(),
                            order_quantity: $('#prodQuantity'+i).val(),
                            order_total: $('#orderTotal'+i).val(),
                            user_point: $('#userPoint').val(),
                            order_recipient: recipient,
                            order_memo: $('#ask').val()
                        });
					
                        jQuery.ajax({
                            url: "/order/complete", // 예: https://www.myservice.com/payments/complete
                            type: "POST",
                            dataType: 'json',
                            contentType: 'application/json',
                            data: orderVO
                        });
                    }
	        	
                    createPayInfo(uid);
                }
                else {
                    alert('결제 실패');
                }
            })
            } else {
                alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
            }
        });
}

function createPayInfo(uid) {
    // 결제정보 생성 및 테이블 저장 후 결제완료 페이지로 이동 
    $.ajax({
        type: 'get',
        url: '/order/pay_info',
        data: {
            'imp_uid': uid,
            'amount': $('#total').val(),
            'ship': $('#shippingFee').val(),
            'point': $('#userPoint').val()
        },
        success: function(data) {
            alert('결제가 완료 되었습니다.');
            // 결제완료 페이지로 이동
            location.replace('/order/complete?pay_num='+data);
        },
        error: function() {
            alert('결제정보 저장 통신 실패');
        }
    });
}
```

* 결제 부분

```javascript
 var uid = '';
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ // param
        pg: "html5_inicis",
        pay_method: "card",
        merchant_uid: $('#orderCode').val(),
        name: $('#prodName0').val(),
        amount: $('#total').val(),
        buyer_email: $('#userEmail').text(),
        buyer_name: $('#userName').text(),
        buyer_tel: $('#phone').val(),
        buyer_addr: addr,
        buyer_postcode: postalcode
    }, function (rsp) { // callback
        if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
            uid = rsp.imp_uid;
            // 결제검증
            $.ajax({
                url: '/order/verify_iamport/' + rsp.imp_uid,
                type: 'post'
            }).done(function(data) {
                ...
}
```

* 먼저 결제 정보를 아임포트 서버로 보내 결제를 완료한다.
* 결제가 완료되면 결제 정보를 담은 json 데이터가 리턴된다. 여기서 결제건의 인덱스 번호인 `imp_uid`를 이용해 정말 정상적으로 결제가 된 것인지 검증을 하기 위해 이동한다.

## 아임포트 결제모듈 테스트
* [아임포트 결제모듈 테스트 ver.JAVA](https://github.com/iamport/iamport-rest-client-java/blob/master/src/test/java/com/siot/IamportRestClient/IamportRestTest.java)

* 시작 전에 아임포트사에서 제공하는 테스트 코드를 따라 써 보면서 테스트를 진행했다. API에서 제공되는 객체와 메서드들이 어떤 것들이 있는지 살펴보기 좋았다. 전체적으로 개발자에게 아주 친절한 느낌! 

## OrderController.java

```java
private IamportClient client = new IamportClient("REST API", "REST API Secret");

@ResponseBody
@RequestMapping(value = "/verify_iamport/{imp_uid}", method = RequestMethod.POST)
public IamportResponse<Payment> verifyIamportPOST(@PathVariable(value = "imp_uid") String imp_uid) throws IamportResponseException, IOException {
    return client.paymentByImpUid(imp_uid);
}
```

* 아까 리턴받은 결제 번호를 이용해 서버에 해당 결제 정보가 있는지 확인한 뒤 가져온다.
* 아임포트 서버에 접속해서 정보를 가져오기 위해서는 그냥은 안 되고 인증에 필요한 `key` 정보가 있어야 하기 때문에 내 계정에서 `key` 정보를 가져와서 넣어준다. 
* [iamport REST Client for JAVA](https://github.com/iamport/iamport-rest-client-java) 아임포트사에서 제공하는 공식 문서를 참고해서 진행했다. 정리가 잘 되어 있어 보기 편했다. 

## order.js

```javascript
// 결제검증
$.ajax({
    url: '/order/verify_iamport/' + rsp.imp_uid,
    type: 'post'
}).done(function(data) {
    // 결제를 요청했던 금액과 실제 결제된 금액이 같으면 해당 주문건의 결제가 정상적으로 완료된 것으로 간주한다.
    if ($('#total').val() == data.response.amount) {
        // jQuery로 HTTP 요청
        // 주문정보 생성 및 테이블에 저장 
        // @@ 주문정보는 상품 개수만큼 생성되어야 해서 상품 개수만큼 반복문을 돌린다
        // 이때 order code는 모두 같아야 한다.
        
        // 이번 주문의 배송지 설정 
        var roadAddr = '';
        var detailAddr = '';
        var recipient = '';
        
        // 기본 배송지로 설정된 경우
        if ($('input:radio[name=deliverSpot]:checked').val() == 1) {
            roadAddr = $('#roadAddr').val();
            detailAddr = $('#detailAddr').val();
            recipient = $('#name').val();
        }
        // 신규 배송지로 설정된 경우 
        else {
            roadAddr = $('#newRoadAddress').val();
            detailAddr = $('#newDetailAddress').val();
            recipient = $('#newName').val();
        }
        
        for (var i = 0; i < $('#prodCnt').val(); i++) {
            // 데이터를 json으로 보내기 위해 바꿔준다.
            var orderVO = JSON.stringify({
                order_code: $('#orderCode').val(),
                cart_num: $('#cartNum'+i).val(),
                order_postalcode: postalcode,
                order_roadaddr: roadAddr,
                order_detailaddr: detailAddr,
                user_num: $('#userNum').val(),
                prod_num: $('#prodNum'+i).val(),
                order_quantity: $('#prodQuantity'+i).val(),
                order_total: $('#orderTotal'+i).val(),
                user_point: $('#userPoint').val(),
                order_recipient: recipient,
                order_memo: $('#ask').val()
            });
        
            jQuery.ajax({
                url: "/order/complete", // 예: https://www.myservice.com/payments/complete
                type: "POST",
                dataType: 'json',
                contentType: 'application/json',
                data: orderVO
            });
        }
    
        createPayInfo(uid);
    }
    else {
        alert('결제 실패');
    }
```

* 결제 검증이 완료되면 주문 정보를 생성해서 DB 테이블에 저장해야 한다.
* 우리 프로젝트에는 주문정보를 저장하는 테이블과 결제정보를 저장하는 테이블 두 개가 존재한다. 두 개를 따로 둔 이유는 하나의 결제건에 대해서 어떤 상품들을 주문했는지를 알 수 있어야 하기 때문이다.
* 만약 결제테이블 하나만 써서 고객의 결제정보를 관리한다면 DB 테이블의 로우 하나에는 상품정보 하나만 저장할 수 있다. 하지만 쇼핑몰에서 고객은 항상 하나의 상품만 주문하지 않고 여러 개의 상품을 주문할 수 있다. 이 때 각 상품을 어떤 옵션으로 몇 개를 주문했는지도 알고 있어야 그걸 참고해서 상품을 배송할 수 있고 고객 문의를 처리하거나 고객에게 결제건에 대한 정보를 제공할 때 사용할 수 있다. 
* 그래서 주문테이블을 따로 두어서 하나의 결제건에서 다수의 상품이 주문되었을 경우 각 상품 정보를 저장할 수 있도록 했다. 이때 `PK`는 주문번호와 상품번호를 복합키로 사용했다. 주문테이블의 데이터는 고유한 `PK`가 있어야 각 주문건을 구별할 수 있는데 주문번호만 `PK`로 두면 주문번호 하나에 상품정보 하나만 들어갈 수 있기 때문에 주문테이블과 결제테이블을 따로 사용하는 의미가 없어진다.

<p align="center"><img src="https://miro7923.github.io/assets/images/unomas_pay2.png" width="900"></p>

* 그런데 주문번호와 상품번호를 복합키로 사용하면 어떤 주문번호로 그에 해당되는 상품정보를 모두 불러올 수 있고 여러개의 주문번호도 등록할 수 있다. 그리고 각 상품을 몇 개 주문했는지에 대한 정보도 저장할 수 있다.
* 그렇기 때문에 주문정보를 DB 테이블에 저장하기 위해서는 이번 결제건에서 주문된 상품 종류의 개수만큼 반복문을 돌려 주문정보를 생성해야 한다. 

```java
@ResponseBody
@RequestMapping(value = "/complete", method = RequestMethod.POST)
public ResponseEntity<String> completePOST(@RequestBody OrderVO vo) throws Exception {
    // 결제 완료된 주문정보 DB에 저장
    orderService.createOrder(vo);
    
    return new ResponseEntity<String>("주문정보 생성 완료", HttpStatus.OK);
}
```

```javascript
for (var i = 0; i < $('#prodCnt').val(); i++) {
    // 데이터를 json으로 보내기 위해 바꿔준다.
    var orderVO = JSON.stringify({
        order_code: $('#orderCode').val(),
        cart_num: $('#cartNum'+i).val(),
        order_postalcode: postalcode,
        order_roadaddr: roadAddr,
        order_detailaddr: detailAddr,
        user_num: $('#userNum').val(),
        prod_num: $('#prodNum'+i).val(),
        order_quantity: $('#prodQuantity'+i).val(),
        order_total: $('#orderTotal'+i).val(),
        user_point: $('#userPoint').val(),
        order_recipient: recipient,
        order_memo: $('#ask').val()
    });

    jQuery.ajax({
        url: "/order/complete", // 예: https://www.myservice.com/payments/complete
        type: "POST",
        dataType: 'json',
        contentType: 'application/json',
        data: orderVO
    });
}

createPayInfo(uid);
```

* 주문정보를 모두 생성하고 나면 결제 정보를 생성하기 위한 메서드 `createPayInfo(uid)`를 호출한다.

```javascript
function createPayInfo(uid) {
    // 결제정보 생성 및 테이블 저장 후 결제완료 페이지로 이동 
    $.ajax({
        type: 'get',
        url: '/order/pay_info',
        data: {
            'imp_uid': uid,
            'amount': $('#total').val(),
            'ship': $('#shippingFee').val(),
            'point': $('#userPoint').val()
        },
        success: function(data) {
            alert('결제가 완료 되었습니다.');
            // 결제완료 페이지로 이동
            location.replace('/order/complete?pay_num='+data);
        },
        error: function() {
            alert('결제정보 저장 통신 실패');
        }
    });
}
```

* 결제 정보 생성을 위해 필요한 정보를 추가적으로 담은 후 해당 `url`로 이동한다.

```java
@RequestMapping(value = "/pay_info", method = RequestMethod.GET)
public ResponseEntity<Integer> payInfoPOST(Model model,
        HttpServletRequest request, HttpServletResponse response,
        @RequestParam String imp_uid, @RequestParam int amount,
        @RequestParam int ship, @RequestParam double point, HttpSession session) throws Exception {
    
    IamportResponse<Payment> result = client.paymentByImpUid(imp_uid);
        
    // 결제 정보 저장
    PayVO payVO = new PayVO();
    payVO.setOrder_code(Integer.parseInt(result.getResponse().getMerchantUid()));
    payVO.setPay_card_company(result.getResponse().getCardName());
    payVO.setPay_card_num(result.getResponse().getCardNumber());
    payVO.setPay_installment(result.getResponse().getCardQuota());
    payVO.setPay_method(result.getResponse().getPayMethod());
    payVO.setPay_num(Integer.parseInt(result.getResponse().getMerchantUid()));
    payVO.setPay_shippingfee(ship);
    payVO.setPay_total_price(result.getResponse().getAmount().intValue());
    payVO.setUser_num((int) session.getAttribute("saveNUM"));
    
    orderService.createPay(payVO);
    
    // 방금 생성된 결제 정보의 인덱스 번호 가져옴 
    payVO = orderService.getLastPay();
    model.addAttribute("payVO", payVO);
    
    // 회원 적립금 추가
    userService.updatePoint((int)session.getAttribute("saveNUM"), (int)point);
    
    // 적립금 테이블에 내역 추가
    PointVO pointVO = new PointVO();
    pointVO.setOrder_code(payVO.getOrder_code());
    pointVO.setPoint_content("결제");
    pointVO.setPoint_cost((int)point);
    pointVO.setUser_num((int)session.getAttribute("saveNUM"));
    
    orderService.createPointInfo(pointVO);
    
    return new ResponseEntity<Integer>(payVO.getPay_num(), HttpStatus.OK);
}
```

* 결제 정보는 아임포트 서버에서 불러와 생성한다. 
* 결제 번호 컬럼에 `Auto increasement` 속성을 걸어 놓아서 테이블에 데이터가 삽입될 때 결제 번호가 결정된다. 결제 완료 화면에 결저 번호도 뿌려줄 것이라 결제 정보를 저장한 뒤 해당 정보를 다시 가져와서 `model` 객체에 저장하도록 했다.
* 결제 정보 저장이 완료되면 결제번호 정보를 리턴한다.

* 여기까지 하면 모든 결제 프로세스가 완료되고 결제완료 페이지로 이동한다.<br><br><br>

# 구현하며 했던 고민

```javascript
for (var i = 0; i < $('#prodCnt').val(); i++) {
    // 데이터를 json으로 보내기 위해 바꿔준다.
    var orderVO = JSON.stringify({
        order_code: $('#orderCode').val(),
        cart_num: $('#cartNum'+i).val(),
        order_postalcode: postalcode,
        order_roadaddr: roadAddr,
        order_detailaddr: detailAddr,
        user_num: $('#userNum').val(),
        prod_num: $('#prodNum'+i).val(),
        order_quantity: $('#prodQuantity'+i).val(),
        order_total: $('#orderTotal'+i).val(),
        user_point: $('#userPoint').val(),
        order_recipient: recipient,
        order_memo: $('#ask').val()
    });

    jQuery.ajax({
        url: "/order/complete", // 예: https://www.myservice.com/payments/complete
        type: "POST",
        dataType: 'json',
        contentType: 'application/json',
        data: orderVO,
        success: function(data) {
            alert(data);
        },
        error: function() {
            alert('주문정보 생성 실패!');
        }
    });
}
```

* 처음에는 `requestPay()` 메서드의 주문정보를 생성하는 부분을 이런식으로 작성해서 통신의 성공 유무를 확인하려 했다. 그런데 통신에 실패해서 주문정보 생성에 실패했다는 메시지가 출력되는데 주문정보는 내가 의도한 대로 생성이 잘 되는... 결과적으로 동작에는 아무 문제가 없는 상황이 발생되었다. 원인이 궁금해서 정말 여러 가지 방법으로 테스트를 해 보았지만 주문 정보 생성은 정말정말 잘 되는데 에러 데이터는 계속 리턴되는 희안한 상황이 계속되었다. 아직까지도 원인을 못 찾음...
* 프로젝트 진행 마감날도 다가오고 일단 전체적인 동작에는 문제가 없기 때문에 `ajax` 통신의 `success` 이하 부분은 삭제하고 가기로 했다.

## => 해결!

```java
@ResponseBody
@RequestMapping(value = "/complete", method = RequestMethod.POST)
public ResponseEntity<String> completePOST(@RequestBody OrderVO vo) throws Exception {
    // 결제 완료된 주문정보 DB에 저장
    orderService.createOrder(vo);

    return new ResponseEntity<String>("주문정보 생성 완료", HttpStatus.OK);
}
```
* 처음엔 DB에 데이터를 삽입하는 동작을 수행하는 컨트롤러 메서드에서 따로 조건 처리를 해주지 않고 그냥 저장한 뒤 `String` 데이터와 함께 항상 200을 리턴하도록 했다. 그런데 이게 문제였던 것 같다. 

```java
@ResponseBody
@RequestMapping(value = "/complete", method = RequestMethod.POST)
public ResponseEntity<Integer> completePOST(@RequestBody OrderVO vo) throws Exception {
    // 결제 완료된 주문정보 DB에 저장
    int result = orderService.createOrder(vo);

    if (result == 0) {
        log.info("@@@@@@@@@@@ 주문정보 저장 실패");
        return new ResponseEntity<Integer>(0, HttpStatus.NOT_ACCEPTABLE);
    }

    log.info("@@@@@@@@@@@@ 주문정보 저장 성공");
    return new ResponseEntity<Integer>(1, HttpStatus.CREATED);
}
```

* 리턴 데이터를 정수형으로 바꿔주니까 작동이 잘 되었다... 문자열 데이터를 파싱하는 과정에서 문제가 있었던 것일까? 문자열 리턴값을 영어로 썼을 때에도 똑같이 `error`가 리턴되었기 때문에 한글을 사용한 것이 문제가 되는 것은 아닌 것 같고, `json`을 이용한 `post` 통신에서 문자열을 리턴값으로 받아오는 것 자체가 `HTTP 상태 코드`와 상관없이 `error`를 리턴시키는 원인인 듯 하다.

```javascript
jQuery.ajax({
    url: "/order/complete", // 예: https://www.myservice.com/payments/complete
    type: "POST",
    dataType: 'json',
    contentType: 'application/json',
    data: orderVO,
    success: function(data) {
        if (data != 1) {
            alert('주문정보 생성 실패');
        }
    },
    error: function() {
        alert('주문정보 생성 실패');
    }
});
```

* 수정한 컨트롤러 메서드에 따라 콜백 받는 부분도 약간 수정해 주었다. 원인을 찾기까지 좀 오래 걸렸지만 새로운 거 하나 배웠다...<br><br><br>

# 마감까지
* `D-1`<br><br><br>

# 참고
* [[개인프로젝트] 아임포트(i'mport) 결제 기능 구현하기](https://velog.io/@poseassome/%EA%B0%9C%EC%9D%B8%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-%EC%95%84%EC%9E%84%ED%8F%AC%ED%8A%B8import-%EA%B2%B0%EC%A0%9C-%EA%B8%B0%EB%8A%A5-%EA%B5%AC%ED%98%84%ED%95%98%EA%B8%B0)
* [[JAVA, SPRING, Iamport] 아임포트 검증하기(WEB,APP)](https://tyrannocoding.tistory.com/44)
* [아임포트(iamport) 결제연동을 위한 매뉴얼 GitHub](https://github.com/iamport/iamport-manual)
* [아임포트 REST API](https://api.iamport.kr/)
* [iamport REST Client for JAVA](https://github.com/iamport/iamport-rest-client-java)
