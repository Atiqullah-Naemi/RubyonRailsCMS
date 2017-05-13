class Admin::CommentsController < Admin::ApplicationController
  before_action :find_comment, only: [:destroy]

  def index
  	@comments = Comment.all
  end

  def destroy
  	if @comment.destroy
  		redirect_to admin_comments_path, notice: 'One Comment deleted successfully'
  	end
  end

  private
  def find_comment
  	@comment = Comment.find(params[:id])
  end
end
