$(document).on('turbolinks:load', function() {
  
  $("#failure").on('click', function(e) {
    e.preventDefault();
    $('#card-error').text('※クレジットカードを登録してください。');
  });
  
})