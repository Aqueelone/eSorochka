module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def resource_class
    User
  end

  def flash_normal
    render 'messages'
  end

  def show_flash
    f = ""
    f += "<div class=\"alert alert-success\">#{notice}</div>" if notice
    f += "<div class=\"alert alert-error\">#{alert}</div>" if alert
    f.html_safe
  end

  def bootstrap_icon_link_to (text, url, icon, html_options = {})
    link_to url, html_options do
      "<i class=\"#{icon}\"></i> #{text}".html_safe
    end
  end
end
