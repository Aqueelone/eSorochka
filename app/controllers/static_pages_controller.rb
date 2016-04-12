#   class StaticPagesController
#   Copyright (c) 2015-2016, Sergy Nazarevich.
#   This file is licensed under the Common Domain General Public License..

class StaticPagesController < ApplicationController
  before_action :require_admin, only: [:userslist, :adminpanel, :modpanel]
  def home
    @user = User.find(current_user.id) if current_user
    !session['temporary'] && session['temporary'] = ((defined? @user) && !@user.temporary.blank? && @user.temporary) || SecureRandom.uuid
    if current_user
      @user.temporary = session['temporary'] if (@user.temporary.blank? || @user.temporary != session['temporary'])
      @user.update(params[:temporary])
    end
  end

  def contacts
  end

  def about
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
end
