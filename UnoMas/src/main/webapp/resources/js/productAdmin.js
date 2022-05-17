/**
 * 
 */
/* 타이머 */
function remaindTime() {
    var now = new Date();
    var end = new Date(now.getFullYear(),now.getMonth(),now.getDate(),21,30,00);
    var open = new Date(now.getFullYear(),now.getMonth(),now.getDate(),09,00,00);
  
    var nt = now.getTime();
    var ot = open.getTime();
    var et = end.getTime();
  
	if(nt<ot){
		$(".time").fadeIn();
		$("p.time-title").html("오픈까지 남은 시간");
     
		sec = parseInt(ot - nt) / 1000;
		day  = parseInt(sec/60/60/24);
		sec = (sec - (day * 60 * 60 * 24));
		hour = parseInt(sec/60/60);
		sec = (sec - (hour*60*60));
		min = parseInt(sec/60);
		sec = parseInt(sec-(min*60));

		    if(hour<10){
			hour="0"+hour;
		}
		    if(min<10){
			min="0"+min;
		}
		    if(sec<10){
			sec="0"+sec;
		}
		
		$(".hours").html(hour);
		$(".minutes").html(min);
		$(".seconds").html(sec);
		
	} else if(nt>et){
		$("p.time-title").html("마감");
		$(".time").fadeOut();
		$(".hours").html("--");
		$(".minutes").html("--");
		$(".seconds").html("--");
		
	} else {
		$(".time").fadeIn();
		$("p.time-title").html("마감까지 남은 시간");
		
		sec =parseInt(et - nt) / 1000;
		day  = parseInt(sec/60/60/24);
		sec = (sec - (day * 60 * 60 * 24));
		hour = parseInt(sec/60/60);
		sec = (sec - (hour*60*60));
		min = parseInt(sec/60);
		sec = parseInt(sec-(min*60));
		
		if(hour<10){
			hour="0"+hour;
		}
		
		if(min<10){
			min="0"+min;
		}
		
		if(sec<10){
			sec="0"+sec;
		}
		
		$(".hours").html(hour);
		$(".minutes").html(min);
		$(".seconds").html(sec);
   }
}
 setInterval(remaindTime,1000);
 
 
/* 체크박스 전체 선택 해체 */
$(document).ready(function() {
	$("#allCheck").click(function() {
	if($("#allCheck").is(":checked")) {
		$("input[name=chBox]").prop("checked", true);
		
	} else $("input[name=chBox]").prop("checked", false);
	
	});
			
	$("input[name=chBox]").click(function() {
		var total = $("input[name=chBox]").length;
		var checked = $("input[name=chBox]:checked").length;
		
		if(total != checked) {
			$("#allCheck").prop("checked", false);
		} else $("#allCheck").prop("checked", true); 
	});
});
		
/* 오늘 날짜 */
var now = new Date();
var month = now.getMonth()+1;
var date = now.getDate();
$(".month").html(month);
$(".date").html(date);


/* 선택상자 직접 입력 */

//$(function(){
//	$("#selboxDirect").hide();
//	$("#selbox").change(function() {
//
//		if($("#selbox").val() != "냉장보관" && $("#selbox").val() != "실온보관") {
//			$("#selboxDirect").show();
//		}  else {
//			$("#selboxDirect").hide();
//		}
//	}) 
//});

//$(function(){
//	$("#selboxDirect2").hide();
//	$("#selbox2").change(function() {
//
//		if($("#selbox2").val() == "" || $("#selbox2") == onfocus) {
//			$("#selboxDirect2").show();
//			$("#selbox2").hide();
//			
//		}  else {
//			$("#selboxDirect2").hide();
//			$("#selboxDirect2 option:").val() == null;
//		}
//	}) 
//});

/* 재고 상태 라디오버튼 제어 */
//function stockBtn(){
//	var stock = $('prod_stock');
//	if(stock = 0){
//		$('input:radio[name=stock_state]:input[value=' + sold + ']').attr("checked", true);
//	}
//}

/* 대분류 선택에 따른 소분류 카테고리 */
var cates = false;

function update_categories() {
	$("#details").val(0);
	$("#details").find("option[value!=0]").detach();
	$("#details").append(cates.filter(".cate"+$(this).val()));
}

$(function(){
	cates =$("#details").find("option[value!=0]");
	cates.detach();
	
	$("#categories").change(update_categories);
	$("#categories").trigger("change");
})


