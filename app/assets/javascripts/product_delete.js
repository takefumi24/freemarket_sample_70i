$(document).on('turbolinks:load', function() {
  $('#deletebtn').on('click', function() {
    var deleteConfirm = confirm('削除してよろしいでしょうか？');

    if(deleteConfirm == true) {
      var clickElem = $(this)
      var productID = clickElem.attr('data-id');
      var url = clickElem.attr('data-url');

      $.ajax({
        url: url,
        type: 'POST',
        data: {'id': productID,'_method': 'DELETE'} 
      })

     .done(function() {
        alert('削除が完了しました。');
        location.href= "/";
      })

     .fail(function() {
        alert('削除に失敗しました。');
      });

    } else {
      (function(e) {
        e.preventDefault()
      });
    };
  });
});