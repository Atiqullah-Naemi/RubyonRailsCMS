class Slider < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :page
end
