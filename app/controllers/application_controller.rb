#   class ApplicationController
#   Copyright (c) 2015-2016, Sergy Nazarevich.
#   This file is licensed under the Common Domain General Public License.

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in?

  def logged_in?
    session[:token].present?
  end

  def require_admin
    (!current_user || !current_user.is_admin) && (redirect_to root_path, :error => 'You are not admin!')
  end
end
