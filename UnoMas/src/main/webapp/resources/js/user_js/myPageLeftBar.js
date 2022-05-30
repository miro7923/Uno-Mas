$(function(){
	let total_url = new URL(window.location.href);
	let current_url = total_url.pathname;

//	$("a[href$="+ current_url + "]").css("color","red");
//	console.log("이게 나오나.." + $("a[href$="+ current_url + "]"))
	if($("a").attr("href") == current_url) {
		$("a[href="+ current_url + "]").css('color','blue');
		
	}
 });