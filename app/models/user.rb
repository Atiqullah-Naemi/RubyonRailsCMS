class User < ApplicationRecord
	mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :categories
  has_many :tags
  has_many :pages

  def self.search(query)
  	where("username like ? OR email like ?", "%#{query}%", "%#{query}%")
  end

end
