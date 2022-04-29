/**
 * 
 */
function remaindTime() {
    var now = new Date();
    var end = new Date(now.getFullYear(),now.getMonth(),now.getDate(),21,00,00);
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
 
 
