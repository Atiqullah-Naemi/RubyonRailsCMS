class Home < ApplicationRecord

	mount_uploader :image, ImageUploader
	
	def self.home_title
		Home.first.try(:title)
	end

	def self.home_content
		Home.first.try(:content)
	end

	def self.home_image
		Home.first.try(:image)
	end

	def self.home_first_button
		Home.first.try(:first_button)
	end

	def self.home_second_button
		Home.first.try(:second_button)
	end
end
