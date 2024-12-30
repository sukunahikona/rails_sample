class ApplicationController < ActionController::Base
    
    protect_from_forgery with: :exception
    
    before_action :permit_params, if: :devise_controller?

    def permit_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:remember_created_at])
    end
end
