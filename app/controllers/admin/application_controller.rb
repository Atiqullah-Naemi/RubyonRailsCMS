class Admin::ApplicationController < ActionController::Base
	before_action :authenticate_user!

	include Pundit
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
	
	protect_from_forgery with: :exception
	layout = 'admin/application'

	private

	def user_not_authorized
		flash[:alert] = "You are not allowed to access this page."
    	redirect_to(request.referrer || root_path)
	end
end