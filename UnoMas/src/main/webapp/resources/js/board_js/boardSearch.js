
 function search_faq() {
    		var type_val = document.getElementById("search_type_faq").value;
    		var keyword_val = document.getElementById('keyword_faq').value;
    		var url = "/board/faq_paging?search_type="+type_val+"&keyword="+encodeURIComponent(keyword_val);
    		
    		location.href=url;
    	}
    	
function search_qni() {
    		var search_type_val = document.getElementById("search_type_qni");
    		var type_val = search_type_val.options[search_type_val.selectedIndex].value;
    		var keyword_val = document.getElementById("keyword_qni").value;
    		var url = "/board/qni_paging?search_type="+type_val+"&keyword="+encodeURIComponent(keyword_val);
    		
    		location.href=url;
    	}
    	
function search_prod() {
	var type_val = document.getElementById("search_type_prod").value;
	var keyword_val = document.getElementById("keyword_prod").value;
    var url = "/product/product_search?search_type="+type_val+"&keyword="+encodeURIComponent(keyword_val);
    		
    location.href=url;
}

function search_enter_prod() {
	if(window.event.keyCode == 13){
		var type_val = document.getElementById("search_type_prod").value;
		var keyword_val = document.getElementById("keyword_prod").value;
	    var url = "/product/product_search?search_type="+type_val+"&keyword="+encodeURIComponent(keyword_val);
	    		
	    location.href=url;
	}
}

function search_enter_prod() {
	if(window.event.keyCode == 13){
		var type_val = document.getElementById("search_type_faq").value;
    	var keyword_val = document.getElementById('keyword_faq').value;
    	var url = "/board/faq_paging?search_type="+type_val+"&keyword="+encodeURIComponent(keyword_val);
    		
    	location.href=url;
	}
}

function search_enter_qni() {
	if(window.event.keyCode == 13){
		var search_type_val = document.getElementById("search_type_qni");
    	var type_val = search_type_val.options[search_type_val.selectedIndex].value;
    	var keyword_val = document.getElementById("keyword_qni").value;
    	var url = "/board/qni_paging?search_type="+type_val+"&keyword="+encodeURIComponent(keyword_val);
    		
    	location.href=url;
	}
}