$(function(){
	let total_url = new URL(window.location.href);
	let current_url = total_url.pathname;
	$(`a[href='${current_url+total_url.search}']`).css({'color':'#B9CE45', 'font-weight':'bold'});
 });