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

/* 체크박스 해제 버튼 */
$(document).ready(function() {
	$("#allNonChk").click(function() {
		$(":checkbox").prop("checked",false);
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


function checkFileName(num, type) {
    var regex = new RegExp("(.*?)\.(jpg|jpeg|png|gif)");
    var maxSize = 10 * 1024 * 1024;
	
	var fileSize = $('#uploadImg' + num)[0].files[0].size;
	if (fileSize > maxSize)
	{
		alert('5MB 이하만 첨부 가능합니다.');
		crossBrowsing(num);
		return;
	}
	
	if (!regex.test($('#uploadImg' + num).val()))
	{
		alert('확장자가 jpeg, jpg, png, gif인 이미지 파일만 등록 가능합니다.');
		crossBrowsing(num);
		return;
	}
	
	uploadImg(num, type);
}

function crossBrowsing(num) {
	var agent = navigator.userAgent.toLowerCase();
	
	// 크로스 브라우징 처리
	// IE일 때
	if (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1 ||
		agent.indexOf("msie") != -1)
		$('#uploadImg' + num).replaceWith($('#uploadImg' + num).clone(true));
	else // 그 외 브라우저
		$('#uploadImg' + num).val('');	
}

function uploadImg(num, type) {
	var reader = new FileReader();
	
	reader.onload = e => {
		$('#prevImg' + num).attr('src', e.target.result);
	}
	
	reader.readAsDataURL($('#uploadImg' + num)[0].files[0]);
	
	var form = new FormData();
	form.append('uploadImg' + num, $('#uploadImg' + num)[0].files[0]);
	
	var newUrl = '/UnoMas/product/upload_';
	switch(type) {
		case 'detail':
			newUrl += 'deImg';
			break;
		case 'top':
			newUrl += 'topImg';
			break;
		case 'thumb':
			newUrl += 'thumb';
			break;
		case 'soldout':
			newUrl += 'soldoutImg';
			break;
	}
	
	$.ajax({
		type: 'post',
		url: newUrl,
		data: form,
		processData: false,
		contentType: false,
		success: function(data) {
			if (data != null) {
				alert('이미지 업로드 성공' + data);
				$('#prod_image' + num).val(data);
			}
		},
		error: function() {
			alert('서버 오류로 지연되고 있습니다. 잠시 후 다시 시도해 주세요.');
		}
	});
}

function showFileName(num) {
    var fileTarget = $('#uploadImg'+num);
    
    fileTarget.on('change', function() {
        if (window.FileReader) { // modern browser
            var fileName = $('#uploadImg'+num)[0].files[0].name;
        }
        else { // IE
            var filename = $('#uploadImg'+num).val().split('/').pop().split('\\').pop();
        }
        
        $('#uploadImgName'+num).val(fileName);
    });
}

