/**
 * 
 */
 
 function isEmpty(obj, msg) {
  	if(typeof obj == "string") {
  		obj = document.querySelector("#" + obj);
  	}
  	if(obj.value == "") {
  		alert(msg);
  		obj.focus();
  		return true;
  	}
  	return false;
  }
  function faqCK() {
  	var f = document.fr;
  	var qni_category = document.getElementById("qni_category");
  	if(isEmpty(f.faq_title,"제목을 입력하세요!")) return false;
  	if(parseInt(qni_category.value) < 1){alert("카테고리를 선택하세요!"); return false;}
  	if(isEmpty(f.faq_content,"내용을 입력하세요!")) return false;
  	
  	return true;
  
  }
  function noticeCK() {
	var f = document.fr;
	if(isEmpty(f.notice_title,"제목을 입력하세요!")) return false;
	if(isEmpty(f.notice_content,"내용을 입력하세요!")) return false;
}

