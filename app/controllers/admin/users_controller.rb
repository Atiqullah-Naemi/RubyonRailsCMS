class Admin::UsersController < Admin::ApplicationController
  def index
  	if params[:search]
  		@users = User.search(params[:search]).all.order(created_at: :desc)
  	else
  		@users = User.all.order(created_at: :desc)
  	end
  end

  def destroy
  end
end
