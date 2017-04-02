class Admin::CategoriesController < Admin::ApplicationController
  before_action :find_category, only: [:show, :edit, :update, :destroy]
  
  def index
  end

  def show
  end

  def new
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      render json: @category
      flash[:notice] = 'New Category was created successfully'
    else
      flash[:alert] = 'There was a problem creating new category'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def category_params
    params.require(:category).permit(:name, :content)
  end

  def find_category
    @category = Category.find(params[:id])
  end
end
