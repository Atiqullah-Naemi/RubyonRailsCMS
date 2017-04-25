class Setting < ApplicationRecord

	mount_uploader :logo, ImageUploader

	def self.site_name
		Setting.first.try(:site_name)
	end

	def self.logo
		Setting.first.try(:logo)
	end

	def self.posts_per_page
		Setting.first.try(:posts_per_page)
	end

end
