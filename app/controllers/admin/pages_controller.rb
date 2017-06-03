class Admin::PagesController < Admin::ApplicationController
  before_action :find_page, only: [:edit, :update, :destroy]

  def index
    if params[:search]
      @pages = Page.search(params[:search]).all.order(created_at: :desc)
    else
      @pages = Page.all.order(created_at: :desc)
    end
  end

  def new
    @page = current_user.pages.build
  end

  def create
    @page = current_user.pages.build(page_params)
    if @page.save
      redirect_to admin_pages_path, notice: 'New page created successfully'
    else
      render :new, alert: 'There was a problem creating new page'
    end
  end

  def edit
  end

  def update
    if @page.update(page_params)
      redirect_to admin_pages_path, notice: 'One page updated successfully'
    else
      render :edit, alert: 'There was a problem updating page'
    end
  end

  def destroy
    if @page.destroy
      redirect_to admin_pages_path, notice: 'One page deleted successfully'
    else
      flash[:alert] = 'There was a problem deleting page'
    end
  end

  private
  def find_page
    @page = Page.friendly.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:title, :image, :content, :add_to_menu, sliders_attributes: [:id, :image, :text, :_destroy], repeaters_attributes: [:id, :image, :content, :_destroy])
  end
end
