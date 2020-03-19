$(document).on('turbolinks:load', function() {
  // タブページの処理
  $(".tabs a").on('click', function(e) {
    e.preventDefault();
    var target = $(this).attr('href');
    if (! $(target).length) return false;

    $('.tab', $(this).closest('.tabs')).removeClass('active');
    $(this).closest('.tab').addClass('active');

    $('.panel', $(target).closest('.panels')).removeClass('active');
    $(target).addClass('active');
  });

  // サイドバーの処理
  $(".lists li").on('click', function(e) {
    e.preventDefault();
    targetLink = $(this).children('a');
    target = $(targetLink).attr('href');

    if ($(this).attr('class') == "sideLink") {
      location.pathname = target;  // 画面遷移
    } else if ($(target).length) {
      $('.sideber-contents li').removeClass('sideActive');
      $(target).addClass('sideActive');
      $("html,body").animate({scrollTop:0},"300");
    }

    $('.my-list li').removeClass('active');
    $(this).addClass('active');
  });
});