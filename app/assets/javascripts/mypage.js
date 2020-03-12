$(function () {
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
    $('.my-list li').removeClass('active');
    $(this).addClass('active');
    targetLink = $(this).children('a');
    target = $(targetLink).attr('href');
    if (! $(target).length) return false;
    $('.sideber-contents li').removeClass('sideActive');
    $(target).addClass('sideActive');
  });
});