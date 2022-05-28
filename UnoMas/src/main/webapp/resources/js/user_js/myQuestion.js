function deleteAction(data) {
	if(confirm("삭제하시겠습니까?") == true){
		location.href='/board/qna_delete?qna_num='+data+'&pageInfo=my';
	}
}