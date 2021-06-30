class ApplicationController < ActionController::Base
    include Pagy::Backend
    before_action :configure_permitted_parameters, if: :devise_controller?

    rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_path, :alert => exception.message
    end

    protected

    def configure_permitted_parameters
        attributes = [:email, :roles_mask]
        devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    end

    def after_sign_in_path_for(resource_or_scope)
        if current_user.roles_mask==nil then
            edit_user_registration_path
        else
            @user
        end
    end

end
