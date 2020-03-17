$(function () {
  // カテゴリ一覧を保持する変数
  var categories = []
  // 大中小カテゴリごとの順番を保持
  var first_num = -1
  var second_num = -1
  var third_num = -1
  // 画像保存に用いる変数
  var dropzone = $('.dropzone-area');
  var dropzone2 = $('.dropzone-area2');
  var images = [];
  var inputs = [];
  var input_area = $('.input_area');
  var preview = $('#preview');
  var preview2 = $('#preview2');



  // ページ遷移後にカテゴリ一覧を取得
  $.getJSON(
    '/category',
    function (data) {
      categories = data
      for (var i = 0; i < categories.length; i++) {
        var op = document.createElement("option");
        op.value = categories[i].id;
        op.text = categories[i].name;
        op.dataset.num = i
        $("#category-first").append(op);
      }
    }
  );
  // 大カテゴリに変更があれば発火
  $('#category-first').change(function () {
    // 子要素・孫要素を削除
    second_num = -1;
    third_num = -1;
    var second = $('#category-second');
    var third = $('#category-third');
    second.children().remove();
    third.children().remove();
    // 選択した番号を保持
    first_num = $("#category-first option:selected").data("num");
    for (var i = 0; i < categories[first_num].sub.length; i++) {
      var op = document.createElement("option");
      op.value = categories[first_num].sub[i].id;
      op.text = categories[first_num].sub[i].name;
      op.dataset.num = [i];
      second.append(op);
    }
    if (first_num !== 0) {
      second.show();
      third.hide();
    } else {
      second.hide();
      third.hide();
    }
  });
  // 中カテゴリに変更があれば発火
  $('#category-second').change(function () {
    // 子要素を削除
    var third = $('#category-third')
    third.children().remove();
    // 選択した番号を保持
    second_num = $("#category-second option:selected").data("num");
    for (var i = 0; i < categories[first_num].sub[second_num].sub.length; i++) {
      var op = document.createElement("option");
      op.value = categories[first_num].sub[second_num].sub[i].id;
      op.text = categories[first_num].sub[second_num].sub[i].name;
      third.append(op);
    }
    if (second_num !== 0) {
      third.show();
    } else {
      third.hide();
    }
    third_num = -1;
  });
  // 小カテゴリに変更があれば発火
  $('#category-third').change(function () {
    // 選択した番号を保持
    third_num = $("#category-third option:selected").data("num");
  })
  // 出品ボタンを押した時に、カテゴリを選択していないと忠告する
  $('#submit-sale').on("click", function (e) {
    if ((first_num < 1) || (second_num < 1) || (third_num < 1)) {
      e.preventDefault();
      alert('カテゴリは全て入力してください')
    }
  })

  // 画像を選択したときのアクション
  $(document).on('change', 'input[type= "file"].upload-image', function (event) {
    var file = $(this).prop('files')[0];
    var reader = new FileReader();
    inputs.push($(this));
    var img = $(`<div class= "img_view"><img></div>`);
    reader.onload = function (e) {
      var btn_wrapper = $('<div class="btn_wrapper"><div class="delete-img-btn">削除</div></div>');
      img.append(btn_wrapper);
      img.find('img').attr({
        src: e.target.result
      })
    }
    reader.readAsDataURL(file);
    images.push(img);
    if (images.length <= 4) {
      $('#preview').empty();
      $.each(images, function (index, image) {
        image.data('image', index);
        preview.append(image);
      })
      dropzone.css({
        'width': `calc(100% - (20% * ${images.length}))`
      })
      // 画像が５枚のとき１段目の枠を消し、２段目の枠を出す
    } else if (images.length == 5) {
      $("#preview").empty();
      $.each(images, function (index, image) {
        image.data("image", index);
        preview.append(image);
      });
      dropzone2.css({
        display: "block"
      });
      dropzone.css({
        display: "none"
      });
      preview2.empty();

      // 画像が６枚以上のとき
    } else if (images.length >= 6) {
      // １〜５枚目の画像を抽出
      var pickup_images1 = images.slice(0, 5);

      // １〜５枚目を１段目に表示
      $('#preview').empty();
      $.each(pickup_images1, function (index, image) {
        image.data('image', index);
        preview.append(image);
      })

      // ６枚目以降の画像を抽出
      var pickup_images2 = images.slice(5);

      // ６枚目以降を２段目に表示
      $.each(pickup_images2, function (index, image) {
        image.data('image', index + 5);
        preview2.append(image);
      })

      dropzone.css({
        'display': 'none'
      })
      dropzone2.css({
        'display': 'block',
        'width': `calc(100% - (20% * ${images.length - 5}))`
      })

      // 画像が１０枚になったら枠を消す
      if (images.length == 10) {
        dropzone2.css({
          display: "none"
        });
      }
    }
    var new_image = $(`<input name="product[images_attributes][${images.length}][image]" class="upload-image" data-image= ${images.length} type="file" id="upload-image">`);
    input_area.prepend(new_image);
    $.each(input_area.children(), function (index, input) {
    })
  });
  $(document).on('click', '.delete-img-btn', function () {
    var target_image = $(this).parent().parent();
    $.each(input_area.children(), function (index, input) {
      if (input.dataset.image == target_image.data('image')) {
        input.remove();
        target_image.remove();
        var num = input.dataset.image
        images.splice(num, 1);
        inputs.splice(num, 1);
        if (inputs.length == 0) {
          $('input[type= "file"].upload-image').attr({
            'data-image': 0
          })
        }
      }
    })
    $.each(input_area.children(), function (index, input) {
      input.dataset.image = index
    })
    $('input[type= "file"].upload-image:first').attr({
      'data-image': inputs.length
    })
    $.each(inputs, function (index, input) {
      var input = $(this)
      input.attr({
        'data-image': index
      })
      $('input[type= "file"].upload-image:first').after(input)
    })
    if (images.length <= 4) {
      $('#preview').empty();
      $.each(images, function (index, image) {
        image.data('image', index);
        preview.append(image);
      })
      dropzone.css({
        display: "block",
        width: `calc(100% - (20% * ${images.length}))`

      })
      dropzone2.css({
        display: "none"
      });
      // 画像が５枚のとき１段目の枠を消し、２段目の枠を出す
    } else if (images.length == 5) {
      $("#preview").empty();
      $.each(images, function (index, image) {
        image.data("image", index);
        preview.append(image);
      });
      dropzone2.css({
        display: "block",
        width: '100%'
      });
      dropzone.css({
        display: "none"
      });
      preview2.empty();

      // 画像が６枚以上のとき
    } else if (images.length >= 6) {
      // １〜５枚目の画像を抽出
      var pickup_images1 = images.slice(0, 5);

      // １〜５枚目を１段目に表示
      $('#preview').empty();
      $.each(pickup_images1, function (index, image) {
        image.data('image', index);
        preview.append(image);
      })

      // ６枚目以降の画像を抽出
      var pickup_images2 = images.slice(5);

      // ６枚目以降を２段目に表示
      $.each(pickup_images2, function (index, image) {
        image.data('image', index + 5);
        preview2.append(image);
      })
      dropzone.css({
        'display': 'none'
      })
      dropzone2.css({
        'display': 'block',
        'width': `calc(100% - (20% * ${images.length - 5}))`
      })

      // 画像が１０枚になったら枠を消す
      if (images.length == 10) {
        dropzone2.css({
          display: "none"
        });
      }
    }
    $.each(input_area.children(), function (index, input) {
    })
  })
})
