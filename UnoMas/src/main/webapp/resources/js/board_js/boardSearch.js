
function search_faq() {
    		var type_val = document.getElementById("search_type_faq").value;
    		var keyword_val = document.getElementById('keyword_faq').value;
    		var url = "/UnoMas/board/faq_search?search_type="+type_val+"&keyword="+encodeURIComponent(keyword_val);
    		
    		location.href=url;
    	}
    	
function search_qni() {
    		var search_type_val = document.getElementById("search_type_qni");
    		var type_val = search_type_val.options[search_type_val.selectedIndex].value;
    		var keyword_val = document.getElementById("keyword_qni").value;
    		var url = "/UnoMas/board/qni_search?search_type="+type_val+"&keyword="+encodeURIComponent(keyword_val);
    		
    		location.href=url;
    	}
    	
function search_prod() {
	var type_val = document.getElementById("search_type_prod").value;
	var keyword_val = document.getElementById("keyword_prod").value;
    var url = "/UnoMas/product/product_search?search_type="+type_val+"&keyword="+encodeURIComponent(keyword_val);
    		
    location.href=url;
}

$("#keyword_prod").keyup(function(e){
	if(e.keyCode == 13) {
		var type_val = document.getElementById("search_type_prod").value;
		var keyword_val = document.getElementById("keyword_prod").value;
	    var url = "/UnoMas/product/product_search?search_type="+type_val+"&keyword="+encodeURIComponent(keyword_val);
	    		
	    location.href=url;
	}	
});

$("#keyword_faq").keyup(function(e){
	if(e.keyCode == 13) {
		var type_val = document.getElementById("search_type_faq").value;
    	var keyword_val = document.getElementById('keyword_faq').value;
    	var url = "/UnoMas/board/faq_search?search_type="+type_val+"&keyword="+encodeURIComponent(keyword_val);
    		
    	location.href=url;
	}
});

$("#keyword_qni").keyup(function(e){
	if(e.keyCode == 13) {
		var search_type_val = document.getElementById("search_type_qni");
    	var type_val = search_type_val.options[search_type_val.selectedIndex].value;
    	var keyword_val = document.getElementById("keyword_qni").value;
    	var url = "/UnoMas/board/qni_search?search_type="+type_val+"&keyword="+encodeURIComponent(keyword_val);
    		
    	location.href=url;
	}
});

