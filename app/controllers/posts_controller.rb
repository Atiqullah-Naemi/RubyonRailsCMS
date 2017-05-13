class PostsController < ApplicationController
  def index
  	@posts = Post.all.order(created_at: :desc)
  	@categories = Category.all
  end

  def show
  	@post = Post.find(params[:id])
  	@categories = Category.all
  	@comments = Comment.all
  end
end
