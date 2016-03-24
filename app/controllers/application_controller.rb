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

  def after_sign_in_path_for(resource)
    redirect_to 'static_pages#adminpanel' && resource.is_admin?
    redirect_to 'static_pages#modpanel' && resource.is_moderator?
    redirect_to 'static_pages#home'
  end
end
