class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  def self.find_for_facebook_oauth(access_token, signed_in_resource = nil)
    return signed_in_resource if signed_in_resource
    data = access_token.info
    if user = User.find_by_email(data.email)
      user
    else
      # TODO: autofill first_name, last_name, avatar
      User.create!(:email => data.email, :password => Devise.friendly_token[0,20])
    end
  end

  def self.find_for_open_id(access_token, signed_in_resource=nil)
    data = access_token.info
    if user = User.where(:email => data["email"]).first
      user
    else
      User.create!(:email => data["email"], :password => Devise.friendly_token[0,20])
    end
  end
end
