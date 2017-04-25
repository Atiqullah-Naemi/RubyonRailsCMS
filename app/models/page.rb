class Page < ApplicationRecord
	
	mount_uploader :image, ImageUploader
	belongs_to :user
	has_many :sliders
	accepts_nested_attributes_for :sliders, reject_if: proc { |att| att['image'].blank? }, allow_destroy: true

	def self.search(query)
		where("title like ? OR content like ?", "%#{query}%", "%#{query}%")
	end
end
