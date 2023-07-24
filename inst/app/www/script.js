$( document ).ready(function() {

});

$(document).on('shiny:busy', function(event) {
  $("#hourglass").show();
  $("#dualring").show();
});

$(document).on('shiny:idle', function(event) {
  $("#hourglass").hide();
  $("#dualring").hide();
});
