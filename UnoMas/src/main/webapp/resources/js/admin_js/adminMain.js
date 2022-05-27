/**
 * 
 */
 function deleteAction(data) {
		if(confirm("삭제하시겠습니까?") == true){
			location.href='/board/qna_delete?qna_num='+data;
		}
	}
 $(document).ready(function() {
			$("#qni_category").change(function() {
				var changeVal = $(this).val();
				location.href="/admin/faq_sort?qnacate_num="+changeVal;
			});
		});
		
var preContent;

  function view_content(obj)
  {
    var div = obj.parentNode;

    for (var i=1, m=div.childNodes.length;i<m;i++) {
      if (div.childNodes[i].nodeType != 1) continue;    // text node.
      else if (obj == div.childNodes[ i ]) continue;

      obj = div.childNodes[ i ];
      break;
    }

    if (preContent && obj!=preContent){
      obj.style.display = "block";
      preContent.style.display = "none";
    }
    else if (preContent && obj==preContent) preContent.style.display = ( preContent.style.display == "none" ? "block" : "none" );
    else if (preContent == null ) obj.style.display = "block";

    preContent = obj;
  }

  { // 초기출력
    var no = "faq_";
    if ( document.getElementById( no ) ) view_content( document.getElementById( no ) );
  }
