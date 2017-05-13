class Post < ApplicationRecord
	mount_uploader :image, ImageUploader
	
	belongs_to :user
	has_many :post_categories
	has_many :categories, through: :post_categories
	has_many :post_tags
	has_many :tags, through: :post_tags
	has_many :comments

	validates :title, presence: true
	validates :content, presence: true

	def self.search(query)
		where("title like ? OR content like ?", "%#{query}%", "%#{query}%")
	end

end
