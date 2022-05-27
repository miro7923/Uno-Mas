$(document).ready(function() {
    showFileName();
    selectRating();
});

function checkFileName() {
    var regex = new RegExp("(.*?)\.(jpg|jpeg|png|gif)");
    var maxSize = 10 * 1024 * 1024;
	
	var fileSize = $('#uploadImg')[0].files[0].size;
	if (fileSize > maxSize)
	{
		alert('5MB 이하만 첨부 가능합니다.');
		crossBrowsing();
	}
	
	if (!regex.test($('#uploadImg').val()))
	{
		alert('확장자가 jpeg, jpg, png, gif인 이미지 파일만 등록 가능합니다.');
		crossBrowsing();
	}
}

function crossBrowsing() {
	var agent = navigator.userAgent.toLowerCase();
	
	// 크로스 브라우징 처리
	// IE일 때
	if (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1 ||
		agent.indexOf("msie") != -1)
		$('#uploadImg').replaceWith($('#uploadImg').clone(true));
	else // 그 외 브라우저
		$('#uploadImg').val('');	
}

function showFileName() {
    var fileTarget = $('#uploadImg');
    
    fileTarget.on('change', function() {
        if (window.FileReader) { // modern browser
            var fileName = $('#uploadImg')[0].files[0].name;
        }
        else { // IE
            var filename = $('#uploadImg').val().split('/').pop().split('\\').pop();
        }
        
        $('#uploadImgName').val(fileName);
    });
}

function removeImg() {
    // @@ 파일업로드 기능 추가하면 추가 수정할 것 @@
	$('#uploadImg').val(null);
	$('#uploadImgName').val('이미지 선택');
}

function selectRating() {
	if ($('#reviewRating').val() > 0) {
		$('#review_rating').val($('#reviewRating').val()).attr('selected', 'selected');
	}
}

function insertNewline() {
	$('#textArea').val().replace(/\r\n|\n/ , "<br>");
}