$(document).on("turbolinks:load", function() {
  // /products/new用のjsファイル
  if (location.pathname === "/products/new" ||location.pathname === "/products") {
    // カテゴリ一覧を保持する変数
    var categories = [];
    // 大中小カテゴリごとの順番を保持
    var first_num = -1;
    var second_num = -1;
    var third_num = -1;

    // 画像保存に用いる変数
    var dropzone = $(".dropzone-area");
    var dropzone2 = $(".dropzone-area2");
    var images = []; //画像ひとつひとつを表示するためのdiv要素を保持
    var inputs = [];
    var input_area = $(".input_area");
    var preview = $("#preview");
    var preview2 = $("#preview2");

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

    // 出品ボタンを押した時に、必要な情報が入力されていないとアラートを表示
    $("#submit-sale").on("click", function(e) {
      var has_error = false;
      var error_message = "";
      var name_form = $("#name_form");
      var detail_form = $("#detail_form");
      var size_form = $("#product_size_id");
      var condition_form = $("#product_condition_id");
      var which_postage_form = $("#product_which_postage_id");
      var price_form = $("#price_form");
      var price = price_form.val();
      // 画像が0枚
      if (images.length == 0) {
        error_message += "画像は1枚以上選択してください\n";
        has_error = true;
      }
      // 名前が空
      if (name_form.val().replace(/\s+/g, "").length == 0) {
        error_message += "商品名を入力してください\n";
        has_error = true;
      }
      // 説明が空
      if (detail_form.val().replace(/\s+/g, "").length == 0) {
        error_message += "商品の説明を入力してください\n";
        has_error = true;
      }
      // カテゴリがひとつでも選択されていない
      if (first_num < 1 || second_num < 1 || third_num < 1) {
        error_message += "カテゴリは全て入力してください\n";
        has_error = true;
      }
      // サイズが空
      if (size_form.val().replace(/\s+/g, "").length == 0) {
        error_message += "サイズを選択してください\n";
        has_error = true;
      }
      // 状態が空
      if (condition_form.val().replace(/\s+/g, "").length == 0) {
        error_message += "状態を選択してください\n";
        has_error = true;
      }

      // 配送料が空
      if (which_postage_form.val().replace(/\s+/g, "").length == 0) {
        error_message += "配送料負担を選択してください\n";
        has_error = true;
      }

      // 金額が空
      if (price_form.val().replace(/\s+/g, "").length == 0) {
        error_message += "販売価格を入力してください\n";
        has_error = true;
      }
      // 金額が範囲外
      if (price < 300 || price > 9999999) {
        error_message += "販売価格は¥300〜¥9999999で入力してください\n";
        has_error = true;
      }
      if (has_error) {
        e.preventDefault();
        alert(error_message);
      }
    });

    // 画像を選択したときのアクション
    $(document).on("change", 'input[type= "file"].upload-image', function(
      event
    ) {
      var file = $(this).prop("files")[0];
      var reader = new FileReader();
      inputs.push($(this));
      var img = $(
        `<div class= "img_view" data-image= ${images.length}><div class="img_box"><img></div></div>`
      );
      // 画像読み込みが終わったら、画像のプレビューを表示
      reader.onload = function(e) {
        var btn_wrapper = $(
          '<div class="btn_wrapper"><div class="delete-img-btn">削除</div></div>'
        );
        img.append(btn_wrapper);
        img.find("img").attr({
          src: e.target.result
        });
      };
      reader.readAsDataURL(file);
      images.push(img);
      // input_areaの子要素に各種属性を再設定
      $.each(input_area.children(), function(index, input) {
        input.name = `product[images_attributes][${index}][image]`;
        input.id = `product_images_attributes_${index}_image`;
        input.dataset.image = index;
      });
      // ドロップゾーンのfor属性を更新
      $.each($(".dropzone-box"), function(index, elem) {
        elem.htmlFor = `product_images_attributes_${images.length}_image`;
      });

      // 新しいインプットフィールドを追加
      var new_image = $(
        `<input name="product[images_attributes][${images.length}][image]" class="upload-image" data-image= ${images.length} type="file" id="product_images_attributes_${images.length}_image">`
      );
      input_area.append(new_image);
      $.each($(".dropzone-box"), function(index, elem) {
        elem.htmlFor = `product_images_attributes_${images.length}_image`;
      });
      redrawImages();
    });

    // 画像の削除ボタンを押した時に発火
    $(document).on("click", ".delete-img-btn", function() {
      var target_image = $(this)
        .parent()
        .parent(); // データを保持している要素を取得
      // 該当するデータと要素を削除する
      $.each(input_area.children(), function(index, input) {
        if (input.dataset.image == target_image.data("image")) {
          input.remove();
          var num = input.dataset.image;
          images.splice(num, 1);
          inputs.splice(num, 1);
        }
      });
      // input_areaの子要素に各種属性を再設定
      $.each(input_area.children(), function(index, input) {
        input.name = `product[images_attributes][${index}][image]`;
        input.id = `product_images_attributes_${index}_image`;
        input.dataset.image = index;
      });
      // ドロップゾーンのfor属性を更新
      $.each($(".dropzone-box"), function(index, elem) {
        elem.htmlFor = `product_images_attributes_${images.length}_image`;
      });
      // input_areaが空になった場合、フィールドを付与する
      if (input_area.children().length == 0) {
        var new_input = $(
          `<input name="product[images_attributes][0][image]" class="upload-image" data-image= 0 type="file" id="product_images_attributes_0_image">`
        );
        input_area.append(new_input);
      }
      redrawImages();
    });

    // 投稿画像たちを再描画するメソッド
    function redrawImages() {
      if (images.length <= 4) {
        $("#preview").empty();
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
        $("#preview").empty();
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
        $("#preview").empty();
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
