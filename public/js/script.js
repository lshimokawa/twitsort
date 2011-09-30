$(document).ready(function() {

  $('#winner-modal').bind('show', function () {
    $.ajax({
      url: "/raffle",
      success: function(data){
        $('#winner').html(data);
      }
    });
  })

  $("#raffle").click(function() {
    $('#winner-modal').modal({
      closeOnEscape: true
    });
  });

});