$(document).on('turbolinks:load', function() { 
  let imgList = $('.content-images__list');
  let active = $('.active');
  
  active.removeClass('active');
  imgList.removeClass('active-img');

  $('.slide:first').addClass('active');
  $('.content-images__list:first').addClass('active-img')

  imgList.hover(function() {
    $('.active').removeClass('active');
    imgList.removeClass('active-img');
    $(this).addClass('active-img');

    let clickIndex = imgList.index($(this));

    $('.slide').eq(clickIndex).addClass('active');
  });
});