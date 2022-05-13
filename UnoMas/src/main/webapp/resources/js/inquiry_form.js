  // select1 과 select2 모두 선택되면(value값이 1이상이면) 버튼의 색상변경 (클래스추가)
  const select1 = document.querySelector("#select1");
  const select2 = document.querySelector("#select2");
  const submitButton = document.querySelector("#submitButton");
  
  function checkAll() { // 유효성 검사 함수
    
    var subject = document.querySelector("#subject");
    if(subject.value == "") {
        alert("제목을 입력해주세요.");
        subject.focus();
        return false;
    }

    if(content.value == "") {
        alert("내용을 입력해주세요.");
        content.focus();
        return false;
    }

  }


  function submitButtonColorChange() { // 셀렉트박스를 모두 선택해야 등록버튼이 활성화 되는 함수
  if (parseInt(select1.value)>=1 && parseInt(select2.value)>=1){

      submitButton.classList.remove("btn-secondary");
      submitButton.classList.add("btn-primary");
      submitButton.disabled = false;
      }
  }

  select1.onchange = function() { // 문의유형 선택시 상세유형이 변경되도록 하는 함수

      const select1_Option = select1.options[select1.selectedIndex].value;
  
  
  var subOptions = {
  deliv : ['상품이 다른곳으로 갔어요', '배송 상품이 안 왔어요', '배송정보 변경 해주세요', '포장 상태가 좋지 않아요', '기타'],
  change : ['주문취소 해주세요', '상품 반품을 원해요', '상품 교환을 원해요','불량상품 환불 해주세요', '파손 상품 환불 해주세요','기타'],
  event : ['쿠폰 관련 문의드려요', '적립금 관련 문의드려요', '이벤트 관련 문의드려요', '증정품 관련 문의드려요', '할인 관련 문의드려요', '기타'],
  product : ['상품이 다른곳으로 갔어요', '배송 상품이 안 왔어요', '상품에 대해 알려주세요', '기타'],
  order: ['주문/결제는 어떻게 하나요?', '오류로 주문/결제가 안 돼요','기타'],
  member: ['로그인/회원 문의하고 싶어요', '회원탈퇴 문의' ,'기타'],
  service : ['이용 중 오류가 발생했어요','제안하고 싶어요','배송비에 대해 궁금합니다','기타']
  }

  switch (select1_Option) {
      case "1":
      subOption = subOptions.deliv;
      break;
      case "2":
      subOption = subOptions.change;
      break;    
      case "3":
      subOption = subOptions.event;
      break;    
      case "4":
      subOption = subOptions.product;
      break;    
      case "5":
      subOption = subOptions.order;
      break;    
      case "6":
      subOption = subOptions.member;
      break;   
      case "7":
      subOption = subOptions.service;
      break;
  }

  select2.options.length = 0;

  var option = document.createElement('option');
  option.setAttribute('selected', true);
  option.setAttribute('disabled', true);
  
  option.innerText = "상세 유형을 선택해주세요";
  select2.append(option);

  for (var i = 0; i < subOption.length; i++) {
      var option = document.createElement('option');
      
      option.value = i;
      option.innerText = subOption[i]; 
      select2.append(option);
  }
}