$(function(){
	$("#serve_member_id").select2({
		theme: "bootstrap",
		placeholder: "Member Code",
		allowClear: true
	});

  $.validator.setDefaults({
    highlight: function(element) {
        $(element).closest('.form-group').addClass('has-error');
        $(element).closest('.form-control').addClass('is-invalid');
    },
    unhighlight: function(element) {
        $(element).closest('.form-group').removeClass('has-error');
    },
    errorElement: 'span',
    errorClass: 'invalid-feedback',
    errorPlacement: function(error, element) {
        if(element.parent('.input-group').length) {
            error.insertAfter(element.parent());
        } else {
            error.insertAfter(element);
        }
    }
  })

	$('#new_serve').validate({
    rules: {
        'serve[member_id]':'required',
    }
  });

});
