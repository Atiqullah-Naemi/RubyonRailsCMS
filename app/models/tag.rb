class Tag < ApplicationRecord
	belongs_to :user
	has_many :post_tags
	has_many :posts, through: :post_tags

	def self.search(query)
		where("name like ?", "%#{query}%")
	end
end
