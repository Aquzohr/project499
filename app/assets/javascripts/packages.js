$(function(){

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
  });

  $('#new_nt_package').validate({
        rules: {
            'package[name]': {
              required: true,
            },
            'package[price]': {
              min: 1
            },
            'package[nontrainer_package_attributes][freeze_time]': { 
              required: true,
              min: 1
            },
        },
   });

  $('#new_t_package').validate({
        rules: {
            'package[name]': {
              required: true,
            },
            'package[price]': {
              min: 1
            },
            'package[trainer_package_attributes][session]': { 
              required: true,
              min: 1
            },
        },
   });


});