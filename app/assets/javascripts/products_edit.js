$(document).on("turbolinks:load", function() {
  if (/\/products\/\d+\/edit/.test(location.pathname)) {
    // 商品情報を入れる
    product_id = location.pathname.replace(/[^0-9]/g, "");
    product_images = [];
    product_categories = [];
    // カテゴリ一覧を保持する変数
    var categories = [];
    // 大中小カテゴリごとの順番を保持
    var first_num = -1;
    var second_num = -1;
    var third_num = -1;
    // 画像編集・保存に用いる変数
    var dropzone = $(".dropzone-area");
    var dropzone2 = $(".dropzone-area2");
    var images = []; //画像ひとつひとつを表示するためのdiv要素を保持
    var current_img_num = 0; //新規画像用のインプットフィールド用のナンバリング
    var input_area = $(".input_area");
    var preview = $("#preview");
    var preview2 = $("#preview2");
    // 商品情報を取得
    $.getJSON(`/products/${product_id}`, function(data) {
      product_images = data.images;
      current_img_num = product_images.length;
      // 画像表示と各種操作のための準備
      $.each(product_images, function(i, image) {
        // 表示用の要素を追加
        var img = $(
          `<div class= "img_view" data-image= ${i}><div class="img_box"><img></div></div>`
        );
        var btn_wrapper = $(
          `<div class="btn_wrapper"><label class="edit-img-btn img-btn" for="product_images_attributes_${i}_image">編集</label><div class="delete-img-btn img-btn">削除</div></div>`
        );
        img.append(btn_wrapper);
        img.find("img").attr({
          src: image.image.url
        });
        images.push(img);
      });
      product_categories = data.categories;
      $("#loading").hide();
      $(".please_click").show();
      redrawImages();
      // 新しいインプットフィールドを追加
      var new_image = $(
        `<input name="product[images_attributes][${current_img_num}][image]" class="upload-image js-file" data-image= ${current_img_num} type="file" id="product_images_attributes_${current_img_num}_image">`
      );
      input_area.append(new_image);
      $.each($(".dropzone-box"), function(index, elem) {
        elem.htmlFor = `product_images_attributes_${current_img_num}_image`;
      });
    });
    // ページ遷移後にカテゴリ一覧を取得
    $.getJSON("/category", function(data) {
      categories = data;
      for (var i = 0; i < categories.length; i++) {
        var op = document.createElement("option");
        op.value = categories[i].id;
        op.text = categories[i].name;
        op.dataset.num = i;
        $("#category-first").append(op);
      }
      // 対象の大カテゴリを選択、中カテゴリを作成
      $.each($("#category-first").children(), function(i, opt) {
        if (opt.value == product_categories[0].id) {
          opt.selected = true;
        }
      });
      first_num = $("#category-first option:selected").data("num");
      for (var i = 0; i < categories[first_num].sub.length; i++) {
        var op = document.createElement("option");
        op.value = categories[first_num].sub[i].id;
        op.text = categories[first_num].sub[i].name;
        op.dataset.num = [i];
        $("#category-second").append(op);
      }
      $.each($("#category-second").children(), function(i, opt) {
        if (opt.value == product_categories[1].id) {
          opt.selected = true;
        }
      });
      second_num = $("#category-second option:selected").data("num");
      for (
        var i = 0;
        i < categories[first_num].sub[second_num].sub.length;
        i++
      ) {
        var op = document.createElement("option");
        op.value = categories[first_num].sub[second_num].sub[i].id;
        op.text = categories[first_num].sub[second_num].sub[i].name;
        $("#category-third").append(op);
      }
      $.each($("#category-third").children(), function(i, opt) {
        if (opt.value == product_categories[2].id) {
          opt.selected = true;
        }
      });
    });
    // 大カテゴリに変更があれば発火
    $("#category-first").change(function() {
      // 子要素・孫要素を削除
      second_num = -1;
      third_num = -1;
      var second = $("#category-second");
      var third = $("#category-third");
      second.children().remove();
      third.children().remove();
      // 選択した番号を保持
      first_num = $("#category-first option:selected").data("num");
      // 子要素のカテゴリをセット
      for (var i = 0; i < categories[first_num].sub.length; i++) {
        var op = document.createElement("option");
        op.value = categories[first_num].sub[i].id;
        op.text = categories[first_num].sub[i].name;
        op.dataset.num = [i];
        second.append(op);
      }
      // 中小カテゴリの表示・非表示
      if (first_num !== 0) {
        second.show();
        third.hide();
      } else {
        second.hide();
        third.hide();
      }
    });
    // 中カテゴリに変更があれば発火
    $("#category-second").change(function() {
      // 子要素を削除
      third_num = -1;
      var third = $("#category-third");
      third.children().remove();
      // 選択した番号を保持
      second_num = $("#category-second option:selected").data("num");
      // 子要素のカテゴリをセット
      for (
        var i = 0;
        i < categories[first_num].sub[second_num].sub.length;
        i++
      ) {
        var op = document.createElement("option");
        op.value = categories[first_num].sub[second_num].sub[i].id;
        op.text = categories[first_num].sub[second_num].sub[i].name;
        third.append(op);
      }
      // 小カテゴリの表示・非表示
      if (second_num !== 0) {
        third.show();
      } else {
        third.hide();
      }
    });
    // 小カテゴリに変更があれば発火
    $("#category-third").change(function() {
      // 選択した番号を保持
      third_num = $("#category-third option:selected").data("num");
    });
    $(document).on("change", ".js-file", function(e) {
      const targetIndex = $(this).data("image");
      const file = e.target.files[0];
      var reader = new FileReader();
      var img = $(
        `<div class= "img_view" data-image= ${targetIndex}><div class="img_box"><img></div></div>`
      );
      // 画像読み込みが終わったら、画像のプレビューを表示
      reader.onload = function(e) {
        var btn_wrapper = $(
          `<div class="btn_wrapper"><label class="edit-img-btn img-btn" for="product_images_attributes_${targetIndex}_image">編集</label><div class="delete-img-btn img-btn">削除</div></div>`
        );
        img.append(btn_wrapper);
        img.find("img").attr({
          src: e.target.result
        });
      };
      reader.readAsDataURL(file);
      // imagesの何番目に含まれているかをチェックする
      var image_index = -1;
      $.each(images, function(i, elem) {
        if (elem.data("image") == targetIndex) {
          image_index = i;
        }
      });
      // indexが-1でないなら、既存画像なので入れ替え
      if (image_index > -1) {
        images[image_index] = img;
      }
      // 新規画像なら追加
      else {
        images.push(img);
        // 新しいインプットフィールドを追加
        current_img_num++;
        var new_image = $(
          `<input name="product[images_attributes][${current_img_num}][image]" class="upload-image js-file" data-image= ${current_img_num} type="file" id="product_images_attributes_${current_img_num}_image">`
        );
        input_area.append(new_image);
        $.each($(".dropzone-box"), function(index, elem) {
          elem.htmlFor = `product_images_attributes_${current_img_num}_image`;
        });
      }
      redrawImages();
    });
    $(document).on("click", ".delete-img-btn", function(e) {
      // data-imageの番号を取得
      // $(this)だと適切な要素を取得できなかったため、このような記述となった
      var targetIndex = e.target.parentNode.parentNode.dataset.image;
      // 該当indexを振られているチェックボックスを取得する
      var hiddenCheck = $(`input[data-image="${targetIndex}"].hidden-destroy`);
      // もしチェックボックスが存在すればチェックを入れる
      if (hiddenCheck.length > 0) {
        hiddenCheck[0].checked = true;
      }
      // チェックボックスがないなら新規画像なので、inputフォームを消す
      else {
        $(`input[data-image="${targetIndex}"].js-file`)[0].remove();
      }
      //data-imageが一致するものがimages内の何番目か取得
      var image_index = -1;
      $.each(images, function(i, elem) {
        if (elem.attr("data-image") == targetIndex) {
          image_index = i;
        }
      });
      if (image_index === -1) {
        alert("エラーが発生しました、正しく処理がなされない場合があります");
      }
      images.splice(image_index, 1);
      redrawImages();
    });
    // 投稿画像たちを再描画するメソッド
    function redrawImages() {
      $("#preview").empty();
      $("#preview2").empty();
      if (images.length <= 4) {
        $.each(images, function(index, image) {
          image.data("image", index);
          preview.append(image);
        });
        dropzone.css({
          display: "block",
          width: `calc(100% - (20% * ${images.length}))`
        });
        dropzone2.css({
          display: "none"
        });
        // 画像が５枚のとき１段目の枠を消し、２段目の枠を出す
      } else if (images.length == 5) {
        $.each(images, function(index, image) {
          image.data("image", index);
          preview.append(image);
        });
        dropzone2.css({
          display: "block",
          width: "100%"
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
        $.each(pickup_images1, function(index, image) {
          image.data("image", index);
          preview.append(image);
        });
        // ６枚目以降の画像を抽出
        var pickup_images2 = images.slice(5);
        // ６枚目以降を２段目に表示
        $.each(pickup_images2, function(index, image) {
          image.data("image", index + 5);
          preview2.append(image);
        });
        dropzone.css({
          display: "none"
        });
        dropzone2.css({
          display: "block",
          width: `calc(100% - (20% * ${images.length - 5}))`
        });
        // 画像が１０枚になったら枠を消す
        if (images.length == 10) {
          dropzone2.css({
            display: "none"
          });
        }
      }
    }
  }
});
