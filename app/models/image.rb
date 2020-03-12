class Image < ApplicationRecord
  belongs_to :product, optional: true
  # mount_uploaders :image_url, ImageUploader
end
