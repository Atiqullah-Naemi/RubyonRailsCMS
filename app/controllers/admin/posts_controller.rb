class Admin::PostsController < Admin::ApplicationController
  before_action :find_post, only: [:edit, :update, :destroy]

  def index
    if params[:search]
      @posts = Post.search(params[:search]).all.order(created_at: :desc).paginate(:page => params[:page], :per_page => Setting.posts_per_page)
    else
      @posts = Post.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => Setting.posts_per_page)
    end
  end

  def new
    @post = current_user.posts.build
    @category = current_user.categories.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to admin_posts_path
      flash[:notice] = 'New post created successfully'
    else
      flash[:alert] = 'There was a problem creating new post'
      render :new
    end
  end

  def edit
    @category = current_user.categories.build
  end

  def update
    if @post.update(post_params)
      redirect_to admin_posts_path
      flash[:notice] = 'One post updated successfully'
    else
      flash[:alert] = 'There was a problem updating post'
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to admin_posts_path
      flash[:notice] = 'One post deleted successfully'
    else
      flash[:alert] = 'There was a problem deleting post'
      redirect_to admin_posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :content, :user_id, :category_id, :tag_id)
  end

  def find_post
    @post = Post.friendly.find(params[:id])
  end
end
