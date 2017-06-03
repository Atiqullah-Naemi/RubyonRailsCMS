class PostsController < ApplicationController
  def index
  	@posts = Post.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => Setting.posts_per_page)
  	@categories = Category.all
  end

  def show
  	@post = Post.friendly.find(params[:id])
  	@categories = Category.all
  	@comments = Comment.all
  end
end
