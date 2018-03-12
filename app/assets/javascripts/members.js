$(function(){

  $('#member_start_date').change(function(event){

    var start_date = $('#member_start_date').val();

    $('#member_end_date').val(start_date)

  });

  $('#member_end_date').click(function(event){

    var start_date = $('#member_start_date').val();

    $( "#member_end_date" ).attr( 
      "min", start_date
    );

  });

});