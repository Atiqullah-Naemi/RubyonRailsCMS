class Admin::UsersController < Admin::ApplicationController
  def index
  	if params[:search]
  		@users = User.search(params[:search]).all.order(created_at: :desc)
  	else
  		@users = User.all.order(created_at: :desc)
  	end
    authorize User
  end

  def destroy
  	user = User.find(params[:id])
  	user.destroy
  	redirect_to admin_users_path, notice: 'User deleted successfully'
  end
end
