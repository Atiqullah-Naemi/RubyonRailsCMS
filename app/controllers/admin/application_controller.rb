class Admin::ApplicationController < ActionController::Base
	before_action :authenticate_user!
	
	protect_from_forgery with: :exception
	layout = 'admin/application'

	def convert_to_boolean(string)
		ActiveRecord::Type::Boolean.new.deserialize(string)
	end

end