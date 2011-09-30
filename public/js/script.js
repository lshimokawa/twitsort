$(document).ready(function() {
  $("#hashtag").focus(function() {
    $(this).val('');
  });

  $('#my-modal').bind('show', function () {
    $.ajax({
      url: "/raffle",
      success: function(data){
        $('#winner').html(data);
      }
    });
  })

  $("#raffle").click(function() {
    $('#my-modal').modal({
      closeOnEscape: true
    });
  });

});