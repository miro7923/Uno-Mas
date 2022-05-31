/**
 * 
 */
function search_admin_faq() {
 	var search_type_val = document.getElementById("search_type_faq");
   	var type_val = search_type_val.options[search_type_val.selectedIndex].value;

   	var keyword_val = document.getElementById("keyword").value;
   	var url = "/UnoMas/admin/faq_board?search_type="+type_val+"&keyword="+encodeURIComponent(keyword_val);

    		
    location.href=url;
}

$("#keyword_faq").keyup(function(e){
	if(e.keyCode == 13) {
		var search_type_val = document.getElementById("search_type_faq").value;
		var type_val = search_type_val.options[search_type_val.selectedIndex].value;
    	var keyword_val = document.getElementById('keyword_faq').value;
    	var url = "/admin/faq_board?search_type="+type_val+"&keyword="+encodeURIComponent(keyword_val);
    		
    	location.href=url;
	}
});

function search_admin_notice() {
    		var search_type_val = document.getElementById("search_type_notice");
    		var type_val = search_type_val.options[search_type_val.selectedIndex].value;

    		var keyword_val = document.getElementById("keyword").value;
    		var url = "/UnoMas/admin/notice_board?search_type="+type_val+"&keyword="+encodeURIComponent(keyword_val);

    		
    		location.href=url;
    	}

$("#keyword_notice").keyup(function(e){
	if(e.keyCode == 13) {
		var search_type_val = document.getElementById("search_type_notice");
    	var type_val = search_type_val.options[search_type_val.selectedIndex].value;
    	var keyword_val = document.getElementById("keyword_notice").value;
    	var url = "/admin/notice_search?search_type="+type_val+"&keyword="+encodeURIComponent(keyword_val);
    		
    	location.href=url;
	}
});