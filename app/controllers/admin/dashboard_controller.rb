class Admin::DashboardController < Admin::ApplicationController
  def index
  	@posts = Post.all
  	@pages = Page.all
  	@categories = Category.all
  	@comments = Comment.all 
  	@users = User.all 
  	@tags = Tag.all 
  	#@messages = Message.all 
  end
end
