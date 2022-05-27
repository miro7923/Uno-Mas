/**
 * 
 */
 function search_admin_faq() {
 	var search_type_val = document.getElementById("search_type");
   	var type_val = search_type_val.options[search_type_val.selectedIndex].value;
   	var keyword_val = document.getElementById("keyword").value;
   	var url = "/admin/faq_board?search_type="+type_val+"&keyword="+encodeURIComponent(keyword_val);
    		
    location.href=url;
}

function search_admin_notice() {
    		var search_type_val = document.getElementById("search_type");
    		var type_val = search_type_val.options[search_type_val.selectedIndex].value;
    		var keyword_val = document.getElementById("keyword").value;
    		var url = "/admin/notice_board?search_type="+type_val+"&keyword="+encodeURIComponent(keyword_val);
    		
    		location.href=url;
    	}