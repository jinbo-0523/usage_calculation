class ApplicationController < ActionController::Base
  before_action :authenticate_company!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource)
    new_company_session_path
  end
  protected

  def configure_permitted_parameters
    added_attrs = [ :name ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
