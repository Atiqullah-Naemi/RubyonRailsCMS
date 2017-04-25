class Admin::CommentsController < Admin::ApplicationController
  before_action :find_comment, only: [:update, :destroy]

  def index
  	@comments = Comment.where(status: convert_to_boolean(params[:status]))
  end

  def update
    if @comment.update(status: params[:status])
      redirect_to :back, notice: 'Comment status changed successfully'
    else
      redirect_to :back, alert: 'There was a problem changing comment status'
    end
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
