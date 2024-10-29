class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!
    before_action :set_current_user
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :phone_number, :full_name])
    end

    def after_sign_in_path_for(resource)
        user_path(resource)
    end

    private

    def set_current_user
        if user_signed_in?
            @user = current_user
        else
            @user = nil
        end
    end

    
end
