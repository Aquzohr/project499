$(function(){

	console.log("test");

	console.log($("#home").length);

	if($("#home").length != 0) {
		$("#container").removeClass( "container" )
	}else{
		$("#container").addClass( "container" )
	}

});