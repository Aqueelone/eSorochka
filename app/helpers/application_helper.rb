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

  def sort_link_to (text, query, url, html_options = {})
    if defined? descA[query]
      desc_q = true
      icon = '.glyphicon-arrow-down'
    else
      desc_q = false
      icon = '.glyphicon-arrow-up'
    end
    url = url + "/?sort='#{query}'&desc='#{desc_q}'"
    link_to url, html_options do
      "#{text} <i class='.glyphicon #{icon}></i>".html_safe
    end
  end
end
