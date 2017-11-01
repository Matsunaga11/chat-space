class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  # def after_sign_out_path_for(resource)
  #   #'/users/sign_in'
  #   #flash[:alert] = "ログインまたは登録が必要です。"
  # end


# flash[:notice] = "アカウントが登録されました。"
# flash[:notice] = "ログインしました。"

end
