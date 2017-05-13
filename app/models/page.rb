class Page < ApplicationRecord
	
	mount_uploader :image, ImageUploader
	belongs_to :user
	has_many :sliders
	has_many :repeaters
	accepts_nested_attributes_for :sliders, reject_if: proc { |att| att['image'].blank? }, allow_destroy: true
	accepts_nested_attributes_for :repeaters, reject_if: proc { |atts| atts['image'].blank? }, allow_destroy: true

	def self.search(query)
		where("title like ? OR content like ?", "%#{query}%", "%#{query}%")
	end
end
