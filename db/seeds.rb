# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 大カテゴリ
ladies = Category.create(name: "レディース")
mens = Category.create(name: "メンズ")
kids = Category.create(name: "ベビー・キッズ")
interiors = Category.create(name: "インテリア・住まい・小物")
bmg = Category.create(name: "本・音楽・ゲーム")
hobbies = Category.create(name: "おもちゃ・ホビー・グッズ")
cosmetics = Category.create(name: "コスメ・香水・美容")
appliances = Category.create(name: "家電・スマホ・カメラ")
sports = Category.create(name: "スポーツ・レジャー")
handmades = Category.create(name: "ハンドメイド")
tickets = Category.create(name: "チケット")
automobiles = Category.create(name: "自動車・オートバイ")
others = Category.create(name: "その他")
# 中カテゴリ(レディース)
ladies_tops = ladies.children.create(name: "トップス")
ladies_jeckets = ladies.children.create(name: "ジャケット/アウター")
ladies_pants = ladies.children.create(name: "パンツ")
ladies_skirts = ladies.children.create(name: "スカート")
ladies_onepieces = ladies.children.create(name: "ワンピース")
ladies_shoes = ladies.children.create(name: "靴")
ladies_roomwares = ladies.children.create(name: "ルームウェア/パジャマ")
ladies_legwares = ladies.children.create(name: "レッグウェア")
ladies_hats = ladies.children.create(name: "帽子")
ladies_bags = ladies.children.create(name: "バッグ")
ladies_accesories = ladies.children.create(name: "アクセサリー")
ladies_hear_accesories = ladies.children.create(name: "ヘアアクセサリー")
ladies_trinkets = ladies.children.create(name: "小物")
ladies_watch = ladies.children.create(name: "時計")
# 中カテゴリ(メンズ)
mens_tops = mens.children.create(name: "トップス")
mens_jacket = mens.children.create(name: "ジャケット/アウター")
mens_pants = mens.children.create(name: "パンツ")
mens_shoes = mens.children.create(name: "靴")
mens_bags = mens.children.create(name: "バッグ")
mens_suits = mens.children.create(name: "スーツ")
mens_hats = mens.children.create(name: "帽子")
mens_accessories = mens.children.create(name: "アクセサリー")
mens_trinkets = mens.children.create(name: "小物")
mens_watch = mens.children.create(name: "時計")
mens_swimsuits = mens.children.create(name: "水着")
mens_legwears = mens.children.create(name: "レッグウェア")
mens_underwares = mens.children.create(name: "アンダーウェア")
mens_others = mens.children.create(name: "その他")
#中カテゴリ(キッズ)
kids_sub =[]
kids_array = "ベビー服(女の子用) ~95cm,ベビー服(男の子用) ~95cm,ベビー服(男女兼用) ~95cm,キッズ服(女の子用) 100cm~,キッズ服(男の子用) 100cm~,キッズ服(男女兼用) 100cm~,キッズ靴,子ども用ファッション小物,おむつ/トイレ/バス,外出/移動用品,授乳/食事,ベビー家具/寝具/室内用品,おもちゃ,行事/記念品".split(",")
kids_array.each do |name|
  sub_category = kids.children.create(name: name)
  kids_sub.push(sub_category)
end
# 中カテゴリ(インテリア・住まい・小物)
interiors_sub = []
interiors_array = "キッチン/食器,ベッド/マットレス,ソファ/ソファベッド,椅子/チェア,机/テーブル,収納家具,ラグ/カーペット/マット,カーテン/ブラインド,ライト/照明,寝具,インテリア小物,季節/年中行事,その他".split(",")
interiors_array.each do |name|
  sub_category = interiors.children.create(name: name)
  interiors_sub.push(sub_category)
end
# 中カテゴリ(本・音楽・ゲーム)
bmg_sub = []
bmg_array = "本,漫画,雑誌,CD,DVD/ブルーレイ,レコード,テレビゲーム".split(",")
bmg_array.each do |name|
  sub_category =bmg.children.create(name: name)
  bmg_sub.push(sub_category)
end
# 中カテゴリ(おもちゃ・ホビー・グッズ)
hobbies_sub = []
hobbies_array = "おもちゃ,タレントグッズ,コミック/アニメグッズ,トレーディングカード,フィギュア,楽器/器材,コレクション,ミリタリー,美術品,アート用品,その他".split(",")
hobbies_array.each do |name|
  sub_category = hobbies.children.create(name: name)
  hobbies_sub.push(sub_category)
end
# 中カテゴリ(コスメ・香水・美容)
cosmetics_sub = []
cosmetics_array = "ベースメイク,メイクアップ,ネイルケア,香水,スキンケア/基礎化粧品,ヘアケア,ボディケア,オーラルケア,リラクゼーション,ダイエット,その他".split(",")
cosmetics_array.each do |name|
  sub_category = cosmetics.children.create(name: name)
  cosmetics_sub.push(sub_category)
end
# 中カテゴリ(家電・スマホ・カメラ)
appliances_sub = []
appliances_array = "スマートフォン/携帯電話,スマホアクセサリー,PC/タブレット,カメラ,テレビ/映像機器,オーディオ機器,美容/健康,冷暖房/空調,生活家電,その他".split(",")
appliances_array.each do |name|
  sub_category = appliances.children.create(name: name)
  appliances_sub.push(sub_category)
end
# 中カテゴリ(スポーツ・レジャー)
sports_sub = []
sports_array = "ゴルフ,フィッシング,自転車,トレーニング/エクササイズ,野球,サッカー/フットサル,テニス,スノーボード,スキー,その他スポーツ,アウトドア,その他".split(",")
sports_array.each do |name|
  sub_category = sports.children.create(name: name)
  sports_sub.push(sub_category)
end
# 中カテゴリ(ハンドメイド)
handmades_sub = []
handmades_array = "アクセサリー(女性用),ファッション/小物,アクセサリー/時計,日用品/インテリア,趣味/おもちゃ,キッズ/ベビー,素材/材料,二次創作物,その他".split(",")
handmades_array.each do |name|
  sub_category = handmades.children.create(name: name)
  handmades_sub.push(sub_category)
end
# 中カテゴリ(チケット)
tickets_sub = []
tickets_array = "音楽,スポーツ,演劇/芸能,イベント,映画,施設利用券,優待券/割引券,その他".split(",")
tickets_array.each do |name|
  sub_category = tickets.children.create(name: name)
  tickets_sub.push(sub_category)
end
# 中カテゴリ(自動車・オートバイ)
automobiles_sub = []
automobiles_array = "自動車本体,自動車タイヤ/ホイール,自動車パーツ,自動車アクセサリー,オートバイ車体,オートバイパーツ,オートバイアクセサリー".split(",")
automobiles_array.each do |name|
  sub_category = automobiles.children.create(name: name)
  automobiles_sub.push(sub_category)
end
# 中カテゴリ(その他)
others_sub =[]
others_array = "まとめ売り,ペット用品,食品,飲料/酒,日用品/生活雑貨/旅行,アンティーク/コレクション,文房具/事務用品,事務/店舗用品,その他".split(",")
others_array.each do |name|
  sub_category = others.children.create(name: name)
  others_sub.push(sub_category)
end

# 小カテゴリ(レディース)
ladies_tops.children.create([{name: "Tシャツ/カットソー(半袖/袖なし)"},{name: "Tシャツ/カットソー(七分/長袖)"},{name: "シャツ/ブラウス(半袖/袖なし)"},{name: "シャツ/ブラウス(七分/長袖)"},
  {name: "ポロシャツ"},{name: "キャミソール"},{name: "タンクトップ"},{name: "ホルターネック"},{name: "ニット/セーター"},{name: "チュニック"},{name: "カーディガン/ボレロ"},{name: "アンサンブル"},{name: "ベスト/ジレ"},{name: "パーカー"}])
ladies_jeckets.children.create([{name: "テーラードジャケット"},{name: "ノーカラージャケット"},{name: "Gジャン/デニムジャケット"},{name: "レザージャケット"},{name: "ダウンジャケット"},
  {name: "ライダースジャケット"},{name: "ミリタリージャケット"},{name: "ダウンベスト"},{name: "ジャンパー/ブルゾン"},{name: "ポンチョ"},{name: "ロングコート"},{name: "トレンチコート"},{name: "ダッフルコート"},{name: "ピーコート"}])
ladies_pants.children.create([{name: "デニム/ジーンズ"},{name: "ショートパンツ"},{name: "カジュアルパンツ"},{name: "ハーフパンツ"},{name: "チノパン"},
  {name: "ワークパンツ/カーゴパンツ"},{name: "クロップドパンツ"},{name: "サロペット/オーバーオール"},{name: "オールインワン"},{name: "サルエルパンツ"},{name: "ガウチョパンツ"}, {name: "その他"}])
ladies_skirts.children.create([{name: "ミニスカート"},{name: "ひざ丈スカート"},{name: "ロングスカート"},{name: "キュロット"},{name: "その他"}])
ladies_onepieces.children.create([{name: "ミニワンピース"},{name: "ひざ丈ワンピース"},{name: "ロングワンピース"},{name: "その他"}])
ladies_shoes.children.create([{name: "ハイヒール/パンプス"},{name: "ブーツ"},{name: "サンダル"},{name: "スニーカー"},
  {name: "ミュール"},{name: "モカシン"},{name: "ローファー/革靴"},{name: "フラットシューズ/バレエシューズ"},{name: "長靴/レインシューズ"},{name: "その他"}])
ladies_roomwares.children.create([{name: "パジャマ"},{name: "ルームウェア"}])
ladies_legwares.children.create([{name: "ソックス"},{name: "スパッツ/レギンス"},{name: "ストッキング/タイツ"},{name: "レッグウォーマー"},{name: "その他"}])
ladies_hats.children.create([{name: "ニットキャップ/ビーニー"},{name: "ハット"},{name: "ハンチング/ベレー帽"},
  {name: "キャップ"},{name: "キャスケット"},{name: "麦わら帽子"},{name: "その他"}])
ladies_bags.children.create([{name: "ハンドバッグ"},{name: "トートバッグ"},{name: "エコバッグ"},{name: "リュック/バックパック"},{name: "ボストンバッグ"},{name: "スポーツバッグ"},{name: "ショルダーバッグ"},
  {name: "クラッチバッグ"},{name: "ポーチ/バニティ"},{name: "ボディバッグ/ウェストバッグ"},{name: "マザーズバッグ"},{name: "メッセンジャーバッグ"},{name: "ビジネスバッグ"},{name: "旅行用バッグ/キャリーバッグ"},])
ladies_accesories.children.create([{name: "ネックレス"},{name: "ブレスレット"},{name: "バングル/リストバンド"},{name: "リング"},
  {name: "ピアス(片耳用)"},{name: "ピアス(両耳用)"},{name: "イヤリング"},{name: "アンクレット"},{name: "ブローチ/コサージュ"},{name: "チャーム"},{name: "その他"},])
ladies_hear_accesories.children.create([{name: "ヘアゴム/シュシュ"},{name: "ヘアバンド/カチューシャ"},{name: "ヘアピン"},{name: "その他"}])
ladies_trinkets.children.create([{name: "長財布"},{name: "折り財布"},{name: "コインケース/小銭入れ"},{name: "名刺入れ/定期入れ"},{name: "キーケース"},{name: "キーホルダー"},
  {name: "手袋/アームカバー"},{name: "ハンカチ"},{name: "ベルト"},{name: "マフラー/ショール"},{name: "ストール/スヌード"},{name: "バンダナ/スカーフ"},{name: "ネックウォーマー"},{name: "サスペンダー"}])
ladies_watch.children.create([{name: "腕時計(アナログ)"},{name: "腕時計(デジタル)"},{name: "ラバーベルト"},{name: "レザーベルト"},{name: "金属ベルト"},{name: "その他"}])
# 小カテゴリ(メンズ)
mens_tops.children.create([{name: "Tシャツ/カットソー(半袖/袖なし)"},{name: "Tシャツ/カットソー(七分/長袖)"},{name: "シャツ"},{name: "ポロシャツ"},
  {name: "タンクトップ"},{name: "ニット/セーター"},{name: "パーカー"},{name: "カーディガン"},{name: "スウェット"},{name: "ジャージ"},{name: "ベスト"},{name: "その他"}])
mens_jacket.children.create([{name: "テーラードジャケット"},{name: "ノーカラージャケット"},{name: "Gジャン/デニムジャケット"},{name: "レザージャケット"},{name: "ダウンジャケット"},
  {name: "ライダースジャケット"},{name: "ミリタリージャケット"},{name: "ナイロンジャケット"},{name: "フライトジャケット"},{name: "ダッフルコート"},{name: "ピーコート"},{name: "ステンカラーコート"},{name: "トレンチコート"},{name: "モッズコート"}])
mens_pants.children.create([{name: "デニム/ジーンズ"},{name: "ワークパンツ/カーゴパンツ"},{name: "スラックス"},{name: "チノパン"},{name: "ショートパンツ"},
  {name: "ペインターパンツ"},{name: "サルエルパンツ"},{name: "オーバーオール"},{name: "その他"}])
mens_shoes.children.create([{name: "スニーカー"},{name: "サンダル"},{name: "ブーツ"},{name: "モカシン"},{name: "ドレス/ビジネス"},
  {name: "長靴/レインシューズ"},{name: "デッキシューズ"},{name: "その他"}])
mens_bags.children.create([{name: "ショルダーバッグ"},{name: "トートバッグ"},{name: "ボストンバッグ"},{name: "リュック/バックパック"},{name: "ウエストポーチ"},
  {name: "ボディーバッグ"},{name: "ドラムバッグ"},{name: "ビジネスバッグ"},{name: "トラベルバッグ"},{name: "メッセンジャーバッグ"},{name: "エコバッグ"},{name: "その他"}])
mens_suits.children.create([{name: "スーツジャケット"},{name: "スーツベスト"},{name: "スラックス"},{name: "セットアップ"},{name: "その他"}])
mens_hats.children.create([{name: "キャップ"},{name: "ハット"},{name: "ニットキャップ/ビーニー"},{name: "ハンチング/ベレー帽"},{name: "キャスケット"},{name: "サンバイザー"},{name: "その他"}])
mens_accessories.children.create([{name: "ネックレス"},{name: "ブレスレット"},{name: "バングル/リストバンド"},{name: "リング"},{name: "ピアス(片耳用)"},{name: "ピアス(両耳用)"},{name: "アンクレット"},{name: "その他"}])
mens_trinkets.children.create([{name: "長財布"},{name: "折り財布"},{name: "マネークリップ"},{name: "コインケース/小銭入れ"},{name: "名刺入れ/定期入れ"},{name: "キーケース"},
  {name: "キーホルダー"},{name: "ネクタイ"},{name: "手袋"},{name: "ハンカチ"},{name: "ベルト"},{name: "マフラー"},{name: "ストール"},{name: "バンダナ"}])
mens_watch.children.create([{name: "腕時計(アナログ)"},{name: "腕時計(デジタル)"},{name: "ラバーベルト"},{name: "レザーベルト"},{name: "金属ベルト"},{name: "その他"}])
mens_swimsuits.children.create([{name: "一般水着"},{name: "スポーツ用"},{name: "アクセサリー"},{name: "その他"}])
mens_legwears.children.create([{name: "ソックス"},{name: "レギンス/スパッツ"},{name: "レッグウォーマー"},{name: "その他"}])
mens_underwares.children.create([{name: "トランクス"},{name: "ボクサーパンツ"},{name: "その他"}])
mens_others.children.create([])

# 小カテゴリ(キッズ)
kids_grandchildren = []
kids_grandchildren.push("トップス,アウター,パンツ,スカート,ワンピース,ベビードレス,おくるみ,下着/肌着,パジャマ,ロンパース,その他".split(","))
kids_grandchildren.push("トップス,アウター,パンツ,おくるみ,下着/肌着,パジャマ,ロンパース,その他".split(","))
kids_grandchildren.push("トップス,アウター,パンツ,おくるみ,下着/肌着,パジャマ,ロンパース,その他".split(","))
kids_grandchildren.push("コート,ジャケット/上着,トップス(Tシャツ/カットソー),トップス(トレーナー),トップス(チュニック),トップス(タンクトップ),トップス(その他),スカート,パンツ,ワンピース,セットアップ,パジャマ,フォーマル/ドレス,和服".split(","))
kids_grandchildren.push("コート,ジャケット/上着,トップス(Tシャツ/カットソー),トップス(トレーナー),トップス(その他),パンツ,セットアップ,パジャマ,フォーマル/ドレス,和服,浴衣,甚平,水着,その他".split(","))
kids_grandchildren.push("コート,ジャケット/上着,トップス(Tシャツ/カットソー),トップス(トレーナー),トップス(その他),ボトムス,パジャマ,その他".split(","))
kids_grandchildren.push("スニーカー,サンダル,ブーツ,長靴,その他".split(","))
kids_grandchildren.push("靴下/スパッツ,帽子,エプロン,サスペンダー,タイツ,ハンカチ,バンダナ,ベルト,マフラー,傘,手袋,スタイ,バッグ,その他".split(","))
kids_grandchildren.push("おむつ用品,おまる/補助便座,トレーニングパンツ,ベビーバス,お風呂用品,その他".split(","))
kids_grandchildren.push("ベビーカー,抱っこひも/スリング,チャイルドシート,その他".split(","))
kids_grandchildren.push("ミルク,ベビーフード,ベビー用食器,その他".split(","))
kids_grandchildren.push("ベッド,布団/毛布,イス,たんす,その他".split(","))
kids_grandchildren.push("おふろのおもちゃ,がらがら,オルゴール,ベビージム,手押し車/カタカタ,知育玩具,その他".split(","))
kids_grandchildren.push("お宮参り用品,お食い初め用品,アルバム,手形/足形,その他".split(","))

kids_sub.each_with_index do |sub, i|
  kids_grandchildren[i].each do |name|
    sub.children.create(name: name)
  end
end

# 小カテゴリ(インテリア・住まい・小物)
interiors_grandchildren = []
interiors_grandchildren.push("食器,調理器具,収納/キッチン雑貨,弁当用品,カトラリー(スプーン等),テーブル用品,容器,エプロン,アルコールグッズ,浄水機,その他".split(","))
interiors_grandchildren.push("セミシングルベッド,シングルベッド,セミダブルベッド,ダブルベッド,ワイドダブルベッド,クイーンベッド,キングベッド,脚付きマットレスベッド,マットレス,すのこベッド,ロフトベッド/システムベッド,簡易ベッド/折りたたみベッド,収納付き,その他".split(","))
interiors_grandchildren.push("ソファセット,シングルソファ,ラブソファ,トリプルソファ,オットマン,コーナーソファ,ビーズソファ/クッションソファ,ローソファ/フロアソファ,ソファベッド,応接セット,ソファカバー,リクライニングソファ,その他".split(","))
interiors_grandchildren.push("一般,スツール,ダイニングチェア,ハイバックチェア,ロッキングチェア,座椅子,折り畳みイス,デスクチェア,その他".split(","))
interiors_grandchildren.push("こたつ,カウンターテーブル,サイドテーブル,センターテーブル,ダイニングテーブル,座卓/ちゃぶ台,アウトドア用,パソコン用,事務机/学習机,その他".split(","))
interiors_grandchildren.push("リビング収納,キッチン収納,玄関/屋外収納,バス/トイレ収納,本収納,本/CD/DVD収納,洋服タンス/押入れ収納,電話台/ファックス台,ドレッサー/鏡台,棚/ラック,ケース/ボックス,その他".split(","))
interiors_grandchildren.push("ラグ,カーペット,ホットカーペット,玄関/キッチンマット,トイレ/バスマット,その他".split(","))
interiors_grandchildren.push("カーテン,ブラインド,ロールスクリーン,のれん,その他".split(","))
interiors_grandchildren.push("蛍光灯/電球,天井照明,フロアスタンド,その他".split(","))
interiors_grandchildren.push("布団/毛布,枕,シーツ/カバー,その他".split(","))
interiors_grandchildren.push("ごみ箱,ウェルカムボード,オルゴール,クッション,クッションカバー,スリッパラック,ティッシュボックス,バスケット/かご,フォトフレーム,マガジンラック,モビール,花瓶,灰皿,傘立て".split(","))
interiors_grandchildren.push("正月,成人式,バレンタインデー,ひな祭り,子どもの日,母の日,父の日,サマーギフト/お中元,夏/夏休み,ハロウィン,敬老の日,七五三,お歳暮,クリスマス".split(","))
interiors_grandchildren.push([])

interiors_sub.each_with_index do |sub, i|
  interiors_grandchildren[i].each do |name|
    sub.children.create(name: name)
  end
end

# 小カテゴリ(本・音楽・ゲーム)
bmg_grandchildren = []
bmg_grandchildren.push("文学/小説,人文/社会,ノンフィクション/教養,地図/旅行ガイド,ビジネス/経済,健康/医学,コンピュータ/IT,趣味/スポーツ/実用,住まい/暮らし/子育て,アート/エンタメ,洋書,絵本,参考書,その他".split(","))
bmg_grandchildren.push("全巻セット,少年漫画,少女漫画,青年漫画,女性漫画,同人誌,その他".split(","))
bmg_grandchildren.push("アート/エンタメ/ホビー,ファッション,ニュース/総合,趣味/スポーツ,その他".split(","))
bmg_grandchildren.push("邦楽,洋楽,アニメ,クラシック,K-POP/アジア,キッズ/ファミリー,その他".split(","))
bmg_grandchildren.push("外国映画,日本映画,アニメ,TVドラマ,ミュージック,お笑い/バラエティ,スポーツ/フィットネス,キッズ/ファミリー,その他".split(","))
bmg_grandchildren.push("邦楽,洋楽,その他".split(","))
bmg_grandchildren.push("家庭用ゲーム本体,家庭用ゲームソフト,携帯用ゲーム本体,携帯用ゲームソフト,PCゲーム,その他".split(","))

bmg_sub.each_with_index do |sub, i|
  bmg_grandchildren[i].each do |name|
    sub.children.create(name: name)
  end
end

# 小カテゴリ(おもちゃ・ホビー・グッズ)
hobbies_grandchildren = []
hobbies_grandchildren.push("キャラクターグッズ,ぬいぐるみ,小物/アクセサリー,模型/プラモデル,ミニカー,トイラジコン,プラモデル,ホビーラジコン,鉄道模型,その他".split(","))
hobbies_grandchildren.push("アイドル,ミュージシャン,タレント/お笑い芸人,スポーツ選手,その他".split(","))
hobbies_grandchildren.push("ストラップ,キーホルダー,バッジ,カード,クリアファイル,ポスター,タオル,その他".split(","))
hobbies_grandchildren.push("遊戯王,マジック：ザ・ギャザリング,ポケモンカードゲーム,デュエルマスターズ,バトルスピリッツ,プリパラ,アイカツ,カードファイト!! ヴァンガード,ヴァイスシュヴァルツ,プロ野球オーナーズリーグ,ベースボールヒーローズ,ドラゴンボール,スリーブ,その他".split(","))
hobbies_grandchildren.push("コミック/アニメ,特撮,ゲームキャラクター,SF/ファンタジー/ホラー,アメコミ,スポーツ,ミリタリー,その他".split(","))
hobbies_grandchildren.push("エレキギター,アコースティックギター,ベース,エフェクター,アンプ,弦楽器,管楽器,鍵盤楽器,打楽器,和楽器,楽譜/スコア,レコーディング/PA機器,DJ機器,DTM/DAW".split(","))
hobbies_grandchildren.push("武具,使用済切手/官製はがき,旧貨幣/金貨/銀貨/記念硬貨,印刷物,ノベルティグッズ,その他".split(","))
hobbies_grandchildren.push("トイガン,個人装備,その他".split(","))
hobbies_grandchildren.push("陶芸,ガラス,漆芸,金属工芸,絵画/タペストリ,版画,彫刻/オブジェクト,書,写真,その他".split(","))
hobbies_grandchildren.push("画材,額縁,その他".split(","))
hobbies_grandchildren.push("トランプ/UNO,カルタ/百人一首.ダーツ,ビリヤード,麻雀,パズル/ジグソーパズル,囲碁/将棋,オセロ/チェス,人生ゲーム,野球/サッカーゲーム,スポーツ,三輪車/乗り物,ヨーヨー,模型製作用品".split(","))

hobbies_sub.each_with_index do |sub, i|
  hobbies_grandchildren[i].each do |name|
    sub.children.create(name: name)
  end
end

# 小カテゴリ(コスメ・香水・美容)
cosmetics_grandchildren = []
cosmetics_grandchildren.push("ファンデーション,化粧下地,コントロールカラー,BBクリーム,CCクリーム,コンシーラー,フェイスパウダー,トライアルセット/サンプル,その他".split(","))
cosmetics_grandchildren.push("アイシャドウ,口紅,リップグロス,リップライナー,チーク,フェイスカラー,マスカラ,アイライナー,つけまつげ,アイブロウペンシル,パウダーアイブロウ,眉マスカラ,トライアルセット/サンプル,メイク道具/化粧小物".split(","))
cosmetics_grandchildren.push("ネイルカラー,カラージェル,ネイルベースコート/トップコート,ネイルアート用品,ネイルパーツ,ネイルチップ/付け爪,手入れ用具,除光液,その他".split(","))
cosmetics_grandchildren.push("香水(女性用),香水(男性用),ユニセックス,ボディミスト,その他".split(","))
cosmetics_grandchildren.push("化粧水/ローション,乳液/ミルク,美容液,フェイスクリーム,洗顔料,クレンジング/メイク落とし,パック/フェイスマスク,ジェル/ゲル,ブースター/導入液,アイケア,リップケア,トライアルセット/サンプル,洗顔グッズ,その他".split(","))
cosmetics_grandchildren.push("シャンプー,トリートメント,コンディショナー,リンス,スタイリング剤,カラーリング剤,ブラシ,その他".split(","))
cosmetics_grandchildren.push("オイル/クリーム,ハンドクリーム,ローション,日焼け止め/サンオイル,ボディソープ,入浴剤,制汗/デオドラント,フットケア,その他".split(","))
cosmetics_grandchildren.push("口臭防止/エチケット用品,歯ブラシ,その他".split(","))
cosmetics_grandchildren.push("エッセンシャルオイル,芳香器,お香/香炉,キャンドル,リラクゼーショングッズ,その他".split(","))
cosmetics_grandchildren.push("ダイエット食品,エクササイズ用品,体重計,体脂肪計,その他".split(","))
cosmetics_grandchildren.push("健康用品,看護/介護用品,救急/衛生用品,その他".split(","))

cosmetics_sub.each_with_index do |sub, i|
  cosmetics_grandchildren[i].each do |name|
    sub.children.create(name: name)
  end
end

# 小カテゴリ(家電・スマホ・カメラ)
appliances_grandchildren = []
appliances_grandchildren.push("スマートフォン本体,バッテリー/充電器,携帯電話本体,PHS本体,その他".split(","))
appliances_grandchildren.push("Android用ケース,iPhone用ケース,カバー,イヤホンジャック,ストラップ,フィルム,自撮り棒,その他".split(","))
appliances_grandchildren.push("タブレット,ノートPC,デスクトップ型PC,ディスプレイ,電子ブックリーダー,PC周辺機器,PCパーツ,その他".split(","))
appliances_grandchildren.push("デジタルカメラ,ビデオカメラ,レンズ(単焦点),レンズ(ズーム),フィルムカメラ,防犯カメラ,その他".split(","))
appliances_grandchildren.push("テレビ,プロジェクター,ブルーレイレコーダー,DVDレコーダー,ブルーレイプレーヤー,DVDプレーヤー,映像用ケーブル,その他".split(","))
appliances_grandchildren.push("ポータブルプレーヤー,イヤフォン,ヘッドフォン,アンプ,スピーカー,ケーブル/シールド,ラジオ,その他".split(","))
appliances_grandchildren.push("ヘアドライヤー,ヘアアイロン,美容機器,電気シェーバー,電動歯ブラシ,その他".split(","))
appliances_grandchildren.push("エアコン,空気清浄器,加湿器,扇風機,除湿機,ファンヒーター,電気ヒーター,オイルヒーター,ストーブ,ホットカーペット,こたつ,電気毛布,その他".split(","))
appliances_grandchildren.push("冷蔵庫,洗濯機,炊飯器,電子レンジ/オーブン,調理機器,アイロン,掃除機,エスプレッソマシン,コーヒーメーカー,衣類乾燥機,その他".split(","))
appliances_grandchildren.push(["その他"])

appliances_sub.each_with_index do |sub, i|
  appliances_grandchildren[i].each do |name|
    sub.children.create(name: name)
  end
end

# 小カテゴリ(スポーツ・レジャー)
sports_grandchildren = []
sports_grandchildren.push("クラブ,ウエア(男性用),ウエア(女性用),バッグ,シューズ(男性用),シューズ(女性用),アクセサリー,その他".split(","))
sports_grandchildren.push("ロッド,リール,ルアー用品,ウエア,釣り糸/ライン,その他".split(","))
sports_grandchildren.push("自転車本体,ウエア,パーツ,アクセサリー,バッグ,工具/メンテナンス,その他".split(","))
sports_grandchildren.push("ランニング,ウォーキング,ヨガ,トレーニング用品,その他".split(","))
sports_grandchildren.push("ウェア,シューズ,グローブ,バット,アクセサリー,防具,練習機器,記念グッズ,応援グッズ,その他".split(","))
sports_grandchildren.push("ウェア,シューズ,ボール,アクセサリー,記念グッズ,応援グッズ,その他".split(","))
sports_grandchildren.push("ラケット(硬式用),ラケット(軟式用),ウェア,シューズ,ボール,アクセサリー,記念グッズ,応援グッズ,その他".split(","))
sports_grandchildren.push("ボード,バインディング,ブーツ(男性用),ブーツ(女性用),ブーツ(子ども用),ウエア/装備(男性用),ウエア/装備(女性用),ウエア/装備(子ども用),アクセサリー,バッグ,その他".split(","))
sports_grandchildren.push("板,ブーツ(男性用),ブーツ(女性用),ブーツ(子ども用),ビンディング,ウエア(男性用),ウエア(女性用),ウエア(子ども用),ストック,その他".split(","))
sports_grandchildren.push("ダンス/バレエ,サーフィン,バスケットボール,バドミントン,バレーボール,スケートボード,陸上競技,ラグビー,アメリカンフットボール,ボクシング,ボウリング,その他".split(","))
sports_grandchildren.push("テント/タープ,ライト/ランタン,寝袋/寝具,テーブル/チェア,ストーブ/コンロ,調理器具,食器,登山用品,その他".split(","))
sports_grandchildren.push("旅行用品,その他".split(","))

sports_sub.each_with_index do |sub, i|
  sports_grandchildren[i].each do |name|
    sub.children.create(name: name)
  end
end

# 小カテゴリ(ハンドメイド)
handmades_grandchildren = []
handmades_grandchildren.push("ピアス,イヤリング,ネックレス,ブレスレット,リング,チャーム,ヘアゴム,アンクレット,その他".split(","))
handmades_grandchildren.push("バッグ(女性用),バッグ(男性用),財布(女性用),財布(男性用),ファッション雑貨,その他".split(","))
handmades_grandchildren.push("アクセサリー(男性用),時計(女性用),時計(男性用),その他".split(","))
handmades_grandchildren.push("キッチン用品,家具,文房具,アート/写真,アロマ/キャンドル,フラワー/ガーデン,その他".split(","))
handmades_grandchildren.push("クラフト/布製品,おもちゃ/人形,その他".split(","))
handmades_grandchildren.push("ファッション雑貨,スタイ/よだれかけ,外出用品,ネームタグ,その他".split(","))
handmades_grandchildren.push("各種パーツ,生地/糸,型紙/パターン,その他".split(","))
handmades_grandchildren.push("Ingress,クリエイターズ宇宙兄弟".split(","))
handmades_grandchildren.push([])

handmades_sub.each_with_index do |sub, i|
  handmades_grandchildren[i].each do |name|
    sub.children.create(name: name)
  end
end

# 小カテゴリ(チケット)
tickets_grandchildren = []
tickets_grandchildren.push("男性アイドル,女性アイドル,韓流,国内アーティスト,海外アーティスト,音楽フェス,声優/アニメ,その他".split(","))
tickets_grandchildren.push("サッカー,野球,テニス,格闘技/プロレス,相撲/武道,ゴルフ,バレーボール,バスケットボール,モータースポーツ,ウィンタースポーツ,その他".split(","))
tickets_grandchildren.push("ミュージカル,演劇,伝統芸能,落語,お笑い,オペラ,サーカス,バレエ,その他".split(","))
tickets_grandchildren.push("声優/アニメ,キッズ/ファミリー,トークショー/講演会,その他".split(","))
tickets_grandchildren.push("邦画,洋画,その他".split(","))
tickets_grandchildren.push("遊園地/テーマパーク,美術館/博物館,スキー場,ゴルフ場,フィットネスクラブ,プール,ボウリング場,水族館,動物園,その他".split(","))
tickets_grandchildren.push("ショッピング,レストラン/食事券,フード/ドリンク券,宿泊券,その他".split(","))
tickets_grandchildren.push([])

tickets_sub.each_with_index do |sub, i|
  tickets_grandchildren[i].each do |name|
    sub.children.create(name: name)
  end
end
# 小カテゴリ(自動車・オートバイ)
automobiles_grandchildren = []
automobiles_grandchildren.push("国内自動車本体,外国自動車本体".split(","))
automobiles_grandchildren.push("タイヤ/ホイールセット,タイヤ,ホイール,その他".split(","))
automobiles_grandchildren.push("サスペンション,ブレーキ,外装、エアロパーツ,ライト,内装品、シート,ステアリング,マフラー・排気系,エンジン、過給器、冷却装置,クラッチ、ミッション、駆動系,電装品,補強パーツ,汎用パーツ,外国自動車用パーツ,その他".split(","))
automobiles_grandchildren.push("車内アクセサリー,カーナビ,カーオーディオ,車外アクセサリー,メンテナンス用品,チャイルドシート,ドライブレコーダー,レーダー探知機,カタログ/マニュアル,セキュリティ,ETC,その他".split(","))
automobiles_grandchildren.push([])
automobiles_grandchildren.push("タイヤ,マフラー,エンジン、冷却装置,カウル、フェンダー、外装,サスペンション,ホイール,シート,ブレーキ,タンク,ライト、ウィンカー,チェーン、スプロケット、駆動系,メーター,電装系,ミラー".split(","))
automobiles_grandchildren.push("ヘルメット/シールド,バイクウエア/装備,アクセサリー,メンテナンス,カタログ/マニュアル,その他".split(","))

automobiles_sub.each_with_index do |sub, i|
  automobiles_grandchildren[i].each do |name|
    sub.children.create(name: name)
  end
end

# 小カテゴリ(その他)
others_grandchildren = []
others_grandchildren.push([])
others_grandchildren.push("ペットフード,犬用品,猫用品,魚用品/水草,小動物用品,爬虫類/両生類用品,かご/おり,鳥用品,虫類用品,その他".split(","))
others_grandchildren.push("菓子,米,野菜,果物,調味料,魚介類(加工食品),肉類(加工食品),その他 加工食品,その他".split(","))
others_grandchildren.push("コーヒー,ソフトドリンク,ミネラルウォーター,茶,ウイスキー,ワイン,ブランデー,焼酎,日本酒,ビール、発泡酒,その他".split(","))
others_grandchildren.push("タオル/バス用品,日用品/生活雑貨,洗剤/柔軟剤,旅行用品,防災関連グッズ,その他".split(","))
others_grandchildren.push("雑貨,工芸品,家具,印刷物,その他".split(","))
others_grandchildren.push("筆記具,ノート/メモ帳,テープ/マスキングテープ,カレンダー/スケジュール,アルバム/スクラップ,ファイル/バインダー,はさみ/カッター,カードホルダー/名刺管理,のり/ホッチキス,その他".split(","))
others_grandchildren.push("オフィス用品一般,オフィス家具,店舗用品,OA機器,ラッピング/包装,その他".split(","))
others_grandchildren.push("まとめ売り,ペット用品,食品,飲料/酒,日用品/生活雑貨/旅行,アンティーク/コレクション,文房具/事務用品,事務/店舗用品,その他".split(","))

others_sub.each_with_index do |sub, i|
  others_grandchildren[i].each do |name|
    sub.children.create(name: name)
  end
end

require './db/seeds/brand.rb'
require './db/seeds/condition.rb'
require './db/seeds/sending_method.rb'
require './db/seeds/size.rb'
