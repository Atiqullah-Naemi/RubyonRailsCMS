class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])

		@comment = @post.comments.create(comment_params)
		if @comment.save
			flash[:notice] = 'Comment added successfully'
			redirect_to post_path(@post)
		end
	end

	private
	def comment_params
		params.require(:comment).permit(:name, :message, :post_id)
	end
end
