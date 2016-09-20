class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def after_sign_in_path_for resource
    admin_news_index_path
  end

  def authenticate_admin
    redirect_to root_path unless current_admin
  end

end
