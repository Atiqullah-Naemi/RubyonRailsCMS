class PostCategory < ApplicationRecord
  belongs_to :Post
  belongs_to :Category
end
