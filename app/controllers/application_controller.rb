class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :zipcode, :address, :tel])
  end

# ログアウト後遷移
  def after_sign_out_path_for(resource)
	if resource == :admin
		new_admin_session_path
	else
		root_path
	end
end
	
	# ログイン後遷移
  def after_sign_in_path_for(resource)
  	if resource.instance_of?(Admin)
  		admins_admins_home_path
  	else
  		root_path
  	end
  end

end
