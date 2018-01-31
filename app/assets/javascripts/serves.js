$(function(){
	$("#serve_member_id").select2({
		theme: "bootstrap",
		placeholder: "Member Code",
		allowClear: true
	});

	$('#new_serve').validate({
        rules: {
            'serve[member_id]':'required',
        },
        highlight: function(element) {
            $(element).closest('.form-group').addClass('has-error');
        },
        unhighlight: function(element) {
            $(element).closest('.form-group').removeClass('has-error');
        },
        errorElement: 'span',
        errorClass: 'help-block',
        errorPlacement: function(error, element) {
            if(element.parent('.input-group').length) {
                error.insertAfter(element.parent());
            } else {
                error.insertAfter(element);
            }
        }
    });

});
