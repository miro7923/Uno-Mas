/* 상품명 중복체크*/
function prodCheck() {

	if($("[name=prod_name]").val() == ""){
        $("[name=prod_name]").focus();
        return false;
    }
	if($("select[name=categories]").val() == 0){
        $("select[name=categories]").focus();
        return false;
    }
	if($("select[name=prod_category]").val() == 0){
        $("select[name=prod_category]").focus();
        return false;
    }
	if($("[name=prod_explain]").val() == ""){
        $("[name=prod_explain]").focus();
        return false;
    }
	if($("[name=prod_price]").val() == ""){
        $("[name=prod_price]").focus();
        return false;
    }
	if($("[name=prod_discntrate]").val() == ""){
        $("[name=prod_discntrate]").focus();
        return false;
    }
	if($("[name=prod_stock]").val() == ""){
        $("[name=prod_stock]").focus();
        return false;
    }
	if($("select[name=prod_sellunit]").val() == 0){
        $("select[name=prod_sellunit]").focus();
        return false;
    }
    if($("[name=prod_weight]").val() == ""){
        $("[name=prod_weight]").focus();
        return false;
    }
    if($("[name=prod_country]").val() == ""){
        $("[name=prod_country]").focus();
        return false;
    }
    if($("[name=prod_expire]").val() == ""){
        $("[name=prod_expire]").focus();
        return false;
    }
    if($("select[name=prod_packing]").val() == 0){
        $("select[name=prod_packing]").focus();
        return false;
    }
    if($("select[name=prod_keep]").val() == 0){
        $("select[name=prod_keep]").focus();
        return false;
    }
    
    var obj = $("form[role='form']");
	obj.submit();
}

//function numberCk() {
//    var number = RegExp(/^(0|[1-9]+[0-9])$/);
//    if(!number.test($("[name=prod_price]").val())){
//        $("[name=prod_price]").focus();
//        return false;
//    }
//}

function discntrateCk(){
    var discntrate = RegExp(/^(0|[1-9]+[0-9]{1,2})$/);
    if(!discntrate.test($("[name=prod_discntrate]").val())){
        $("[name=prod_discntrate]").focus();
        return false;
    }
}