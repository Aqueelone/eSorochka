# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#  is_admin               :boolean          default(FALSE)
#  is_moderator           :boolean          default(FALSE)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users GET /users.json
  def index
    @users = User.eager_load(:identities).order('users.created_at DESC')
  end

  # GET /users/:id.:format
  def show
    # authorize! :read, @user
  end

  # GET /users/new GET /users/new.json
  def new
    @user = User.new
  end

  # POST /users POST /users.json
  def create
    @user = User.new(params[:user])
    @user.confirmed_at = Time.now
    @user.skip_confirmation!
    !@user.save && (redirect_to new_user_session_path)
  end

  # GET /users/:id/edit
  def edit
    # authorize! :update, @user
  end

  # PATCH/PUT /users/:id.:format
  def update
    @user = User.find(params[:id])
    @param = params[:user]

    if @param[:password].empty?
      @param.delete(:password)
      @param.delete(:password_confirmation)
    end
    # authorize! :update, @user
    respond_to do |format|
      if @user.update_attributes(@param)
        !current_user && sign_in(@user, :bypass => true)
        format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET/PATCH /users/:id/finish_signup
  def finish_signup
    # authorize! :update, @user
    if request.patch? && params[:user] #&& params[:user][:email]
      @temp_user = User.find(params[:user][:id])
      @verified_user = User.where(email: params[:user][:email]).last

      if @verified_user
        @user = @verified_user
        if @temp_user
          @identity = Identity.where(user_id: params[:user][:id]).last
          @identity.user_id = @verified_user.id
          @identity.save
        end
      else
        @temp_user.update(params[:user][:email]) && @temp_user
        @user = @temp_user
      end

      if @user.update(user_params)
        sign_in(@user, :bypass => true)
        redirect_to root_url, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  # DELETE /users/:id.:format
  def destroy
    # authorize! :delete, @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    accessible = [ :name, :email ] # extend with your own params
    accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
    params.require(:user).permit(accessible)
  end
end
