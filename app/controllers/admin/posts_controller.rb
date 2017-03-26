class Admin::PostsController < Admin::ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order("created_at DESC");
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to admin_posts_path
      flash[:notice] = 'One post created succesfully'
    else
      flash[:alert] = 'There was a problem creating new post'
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to admin_posts_path
      flash[:notice] = 'One post updated succesfully'
    else
      flash[:alert] = 'There was a problem updating new posts'
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to admin_posts_path
      flash[:notice] = 'One post was succesfully deleted'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
