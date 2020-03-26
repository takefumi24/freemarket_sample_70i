$(document).on('turbolinks:load', function() {
  var fadeout = function(){
    $('.notification').fadeOut('slow');
  }
  
  setTimeout(fadeout, 2000);
});