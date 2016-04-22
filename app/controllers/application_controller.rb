#   class ApplicationController
#   Copyright (c) 2015-2016, Sergy Nazarevich.
#   This file is licensed under the Common Domain General Public License.

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include HttpAcceptLanguage::AutoLocale
  before_action :set_locale
  before_action :set_session
  protect_from_forgery with: :exception
  helper_method :logged_in?

  def set_locale
    I18n.locale = params[:locale] || http_accept_language.compatible_language_from(I18n.available_locales) || I18n.default_locale
  end

  def set_session
    @user = User.find(current_user.id) if current_user
    !session['temporary'] && session['temporary'] = ((defined? @user) && !@user.temporary.blank? && @user.temporary) || SecureRandom.uuid
    session['history'].blank? && (session['history'] = false)
    (!session['category'] || session['category'].blank?) && (session['category'] = 3)
    (!session['view'] || session['view'].blank?) && (session['view'] = 'showcase')
    (!session['deffered'] || session['deffered'].blank?) && (session['deffered'] = Array.new)
    if current_user
      @user.temporary = session['temporary'] if (@user.temporary.blank? || @user.temporary != session['temporary'])
      @user.update(params[:temporary])
    end
  end

  def logged_in?
    session[:token].present?
  end

  def require_admin
    (!current_user || !current_user.is_admin) && (redirect_to root_path, :error => 'You are not admin!')
  end

  def default_url_options(options={})
    { :locale => I18n.locale }
  end
end
