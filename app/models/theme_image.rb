class ThemeImage < ApplicationRecord
  mount_uploader :image, ImageUploader
end
