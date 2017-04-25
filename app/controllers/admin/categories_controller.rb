class Admin::CategoriesController < Admin::ApplicationController
  before_action :find_category, only: [:edit, :update, :destroy]

  def index
    if params[:search]
      @categories = Category.search(params[:search]).all.order(created_at: :desc)
    else
      @categories = Category.all.order(created_at: :desc)
    end
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.build(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_categories_path, notice: 'New Category was created successfully' }
        format.json { render action: 'index', status: :created, location: @category }
      else
        format.html { render action: 'new' } 
        format.json { render json: @category.errors, status: :unprocessable_entity }
        format.js   { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: 'Category was updated successfully'
    else
      render :edit, alert: 'There was a problem updating category'
    end
  end

  def destroy
    if @category.destroy
      redirect_to admin_categories_path, notice: 'One category deleted successfully'
    else
      redirect_to admin_categories_path, alert: 'There was a problem deleting category'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :content)
  end

  def find_category
    @category = Category.find(params[:id])
  end
end
