#   class StaticPagesController
#   Copyright (c) 2015-2016, Sergy Nazarevich.
#   This file is licensed under the Common Domain General Public License..

class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:userslist]
  def home
  end

  def contacts
  end

  def about
  end

  def userslist
    @users = User.all
  end
end
