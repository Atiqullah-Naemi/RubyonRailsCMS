class Post < ApplicationRecord
	mount_uploader :image, ImageUploader
	
	belongs_to :user
	has_many :post_categories
	has_many :categories, through: :post_categories
	has_many :post_tags
	has_many :tags, through: :post_tags

	validates :title, presence: true
	validates :content, presence: true

end
