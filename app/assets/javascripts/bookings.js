$(function(){

  $("#booking_member_id").select2({
    theme: "bootstrap",
    placeholder: "Member Code",
    allowClear: true
  });

  $("#booking_staff_id").select2({
    theme: "bootstrap",
    placeholder: "Staff Code",
    allowClear: true
  });

  $('#booking_start_datetime').change(function(event){

    var start_date = $('#booking_start_datetime').val();

    $('#booking_end_datetime').val(start_date)

  });

  $('#booking_end_datetime').click(function(event){

    var start_date = $('#booking_start_datetime').val();

    $( "#booking_end_datetime" ).attr( 
      "min", start_date
    );

  });

});