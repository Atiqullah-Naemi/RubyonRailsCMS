class Admin::TagsController < Admin::ApplicationController
  before_action :find_tag, only: [:edit, :update, :destroy]

  def index
    if params[:search]
      @tags = Tag.search(params[:search]).all.order(created_at: :desc)
    else
      @tags = Tag.all.order(created_at: :desc)
    end
    @tag = current_user.tags.build
  end

  def create
    tags_params[:name].split(',').map do |f|
      @tags = current_user.tags.build(name: f).save
    end
    respond_to do |format|
      format.html { redirect_to admin_tags_path, notice: 'New Tags created successfully' }
      format.json { render action: 'index', status: :created, location: @tags }
    end
  end

  def edit
  end

  def update
    if @tag.update(tags_params)
      redirect_to admin_tags_path, notice: 'Tags updated successfully'
    else
      render :edit, alert: 'There was a problem updating tags'
    end
  end

  def destroy
    if @tag.destroy
      redirect_to admin_tags_path, notice: 'One tag deleted successfully'
    else
      flash[:alert] = 'There was a problem deleting tag'
    end
  end

  private
  def tags_params
    params.require(:tag).permit(:name)
  end

  def find_tag
    @tag = Tag.find(params[:id])
  end
end
