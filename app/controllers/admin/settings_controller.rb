class Admin::SettingsController < Admin::ApplicationController
  before_action :find_setting, only: [:edit, :update]

  def new
  	if Setting.any?
  		redirect_to edit_admin_setting_path(Setting.first)
  	else
  		@setting = Setting.new
  	end
  end

  def create
  	@setting = Setting.new(setting_params)
  	if @setting.save
  		redirect_to edit_admin_setting_path(@setting), notice: 'Settings saved successfully'
  	else
  		render :new, alert: 'There was a problem saving settings'
  	end
  end

  def edit
    authorize Setting
  end

  def update
  	if @setting.update(setting_params)
  		redirect_to edit_admin_setting_path(@setting), notice: 'Changes saved successfully'
  	else
  		render :new, alert: 'There was a problem updating settings'
  	end
  end

  private
  def setting_params
  	params.require(:setting).permit(:id, :site_name, :posts_per_page, :logo)
  end

  def find_setting
  	@setting = Setting.find(params[:id])
  end
end
