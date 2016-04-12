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
#  temporary              :uuid
#  cell                   :string(255)
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base
  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/


  include Gravtastic
  gravtastic

  has_many :identities

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :name, :is_admin, :is_moderator, :current_sign_in_ip
  validates :email, format: { without: TEMP_EMAIL_REGEX }, on: :update
  validates :password, length: { minimum: 0, maximum: 120 },
            on: :update, allow_blank: true

  def self.find_for_oauth(auth, signed_in_resource = nil)
    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)

    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    user = signed_in_resource ? signed_in_resource : identity.user

    # find the existant user by email
    !user && user = get_user_by_email_and_auth(auth)

    # Create the user if it's a new registration
    !user && user = create_user_by_auth(auth)

    # Associate the identity with the user if needed
    identity.user != user && identity.user = user
    identity.save!
    user
  end

  def self.get_user_by_email_and_auth(auth)
    # Get the existing user by email if the provider gives us a verified email.
    # If no verified email was provided we assign a temporary email and ask the
    # user to verify it on the next step via UsersController.finish_signup
    User.find_by_email(get_email_by_auth(auth))
  end

  def self.create_user_by_auth(auth)
    user = User.new(
        name: auth.extra.raw_info.name,
        email: get_email_by_auth(auth),
        password: Devise.friendly_token[0, 20]
    )
    user.save!
    user
  end

  def self.get_email_by_auth(auth)
    if auth.info.email
      auth.info.email
    else
      "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com"
    end
  end

  def email_verified?
    email && email !~ TEMP_EMAIL_REGEX
  end

  def is_admin?
    self.is_admin
  end

  class << self
    def serialize_from_session(key,salt)
      record = to_adapter.get(key[0].to_param)
      record if record && record.authenticatable_salt == salt
    end
  end
end
