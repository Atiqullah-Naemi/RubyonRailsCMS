class SettingPolicy
	attr_reader :current_user, :model

	def initialize(current_user, model)
		@current_user = current_user
		@setting = model
	end

	def edit?
		@current_user.try(:admin?)
	end
end
