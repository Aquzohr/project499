$(function(){

  $("#package_occupiedby_member_id").select2({
      theme: "bootstrap",
      placeholder: "Member Code",
      allowClear: true
  });

  $('#package_occupiedby_start_date').change(function(event){

    var start_date = $('#package_occupiedby_start_date').val();

    $('#package_occupiedby_end_date').val(start_date)

  });

  $('#package_occupiedby_end_date').click(function(event){

    var start_date = $('#package_occupiedby_start_date').val();

    $( "#package_occupiedby_end_date" ).attr( 
      "min", start_date
    );

  });

});
