class Image < ApplicationRecord
  belongs_to :product, optional: true

  # 画像アップロード実装後
  # mount_uploaders :image_url, ImageUploader
end
