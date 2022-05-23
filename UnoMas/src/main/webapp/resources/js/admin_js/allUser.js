$(function(){
	let url = new URL(window.location.href);
	let url_param = url.searchParams.get("standard"); 

	if(url_param == "drop") {
		$("#standard_drop").attr('class','top_a');
	} else if(url_param == "asc") {
		$("#standard_asc").attr('class','top_a');
	} else {
		$("#standard_default").attr('class','top_a');
	}

})


//function showModal(){
//	$('#myModal').show();
//}