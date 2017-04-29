class Admin::HomesController < Admin::ApplicationController
  before_action :find_home, only: [:edit, :update]

  def new
  	if Home.any?
  		redirect_to edit_admin_home_path(Home.first)
  	else
  		@home = Home.new
  	end
  end

  def create
  	@home = Home.new(home_params)
  	if @home.save
  		redirect_to edit_admin_home_path(@home), notice: 'Home Page created successfully'
  	else
  		render :new, alert: 'There was a problem creating home page'
  	end
  end

  def edit
    authorize Home
  end

  def update
  	if @home.update(home_params)
  		redirect_to edit_admin_home_path(@home), notice: 'Home Page updated successfully'
  	else
  		render :edit, alert: 'There was a problem updating Home Page'
  	end
  end

  private
  def home_params
  	params.require(:home).permit(:title, :content, :image, :first_button, :second_button)
  end

  def find_home
  	@home = Home.find(params[:id])
  end
end
