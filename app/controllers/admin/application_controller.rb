class Admin::ApplicationController < ActionController::Base
	before_action :authenticate_user!
	
	protect_from_forgery with: :exception
	layout = 'admin/application'
end