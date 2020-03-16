$(document).on('turbolinks:load', function() {
  let form = $('#creditCard_form');
  Payjp.setPublicKey('pk_test_5d4ae61c977c4ab9c9c4fa8a');

  $('#token_submit').on('click', function(e) {
    e.preventDefault();
    form.find('input[type=submit]').prop('disabled', true);
    let card = {
      number: parseInt($('#credit_card_number').val()),
      cvc: parseInt($('#credit_card_security_code').val()),
      exp_month: parseInt($('#credit_card_exp_month').val()),
      exp_year: parseInt($('#credit_card_exp_year').val())
    };
    Payjp.createToken(card, function(status, response) {
      if (status === 200) {
        $('#credit_card_number').removeAttr('name');
        $('#credit_card_security_code').removeAttr('name');
        $('#credit_card_exp_month').removeAttr('name');
        $('#credit_card_exp_year').removeAttr('name');

        let token = response.id;
        form.append($('<input type="hidden" name="payjp-token" class="payjp-token" />').val(token));
        form.get(0).submit();
        alert('登録が完了しました');
      } else {
        alert('カードの情報が正しくありません');
      }
    });
  });
});
