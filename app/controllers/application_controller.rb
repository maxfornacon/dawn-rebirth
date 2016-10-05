class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 	before_action :configure_permitted_parameters, if: :devise_controller?
  after_filter :user_activity

	protected
    def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    	devise_parameter_sanitizer.permit(:account_update, keys: [:is_female, :date_of_birth, :avatar])
    end

  private
    def user_activity
      current_user.try :touch
    end
end
