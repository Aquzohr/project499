function printReceipt() {

    $("body > div > div").removeClass("container");
    $("body > div > div > div > div").removeClass("well");

    window.print();

    $("body > div > div").addClass("container");
    $("body > div > div > div > div").addClass("well");
}

$(function(){

	$("#receipt_member_id").select2({
		theme: "bootstrap",
		placeholder: "Member Code",
		allowClear: true
	});

});