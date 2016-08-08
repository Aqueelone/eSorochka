#   class StaticPagesController
#   Copyright (c) 2015-2016, Sergy Nazarevich.
#   This file is licensed under the Common Domain General Public License..

class StaticPagesController < ApplicationController
  before_action :require_admin, only: [:userslist, :adminpanel, :modpanel]
  def home
    @category = Category.find(session['category']||3)
  end

  def contacts

  end

  def about

  end

  def order

  end

  def userslist
    @users = User.all
  end

  def privatpolicy

  end

  def adminpanel

  end

  def modpanel

  end

  def sitemap
    path = Rails.root.join("public", "sitemaps", "sitemap.xml")
    if File.exists?(path)
      render xml: open(path).read
    else
      render text: "Sitemap not found.", status: :not_found
    end
  end

  def robots
    render :partial => "static_pages/robots.text.haml"
  end

  def sitetopic
    @categories = Category.where("categories.visible = 't'").order('categories.id ASC')
  end

  def facebook
    render :partial => 'facebook'
  end

  def vkontakte
    render :partial => 'vkontakte'
  end
end
