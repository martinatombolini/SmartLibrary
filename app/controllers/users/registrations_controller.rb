class Users::RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters
    protected
    
    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:email, :password, :created_at, :updated_at, :provider, :uid, :roles_mask)
    end
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email, :password, :created_at, :updated_at, :provider, :uid, :roles_mask)
    end
  end
 
    def update_resource(resource, params)
        resource.update_without_password(params)
    end
end
 