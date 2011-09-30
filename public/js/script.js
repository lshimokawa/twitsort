$(document).ready(function() {
  $("#div-results").hide();

  $("#button-sortear").click(function() {
    $.ajax({
      url: "/raffle",
      success: function(data){
        $("#div-results").show();
        $('#winner').html(data);
      }
    });
  });

});
