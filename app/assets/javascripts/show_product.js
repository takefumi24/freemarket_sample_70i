$(document).on('turbolinks:load', function() { 
  let imgList = $('.content-images__list');
  let active = $('.show-active');
  
  active.removeClass('show-active');
  imgList.removeClass('active-img');

  $('.show-slide:first').addClass('show-active');
  $('.content-images__list:first').addClass('active-img')

  imgList.hover(function() {
    $('.show-active').removeClass('show-active');
    imgList.removeClass('active-img');
    $(this).addClass('active-img');

    let clickIndex = imgList.index($(this));

    $('.show-slide').eq(clickIndex).addClass('show-active');
  });
});