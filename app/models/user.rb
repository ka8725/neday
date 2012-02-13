class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :facebook_id,
                  :remote_avatar_url, :location_attributes
  has_one :location, :as => :locationable
  accepts_nested_attributes_for :location

  def name
    "#{first_name} #{last_name}".strip
  end

  def self.find_for_facebook_oauth(auth_data, signed_in_resource = nil)
    return signed_in_resource if signed_in_resource
    data = auth_data.info
    User.find_by_email(data.email) || User.find_by_facebook_id(auth_data.uid) ||
      User.new(:email             => data.email,
               :password          => Devise.friendly_token[0,20],
               :first_name        => data.first_name,
               :last_name         => data.last_name,
               :facebook_id       => auth_data.uid,
               :remote_avatar_url => data.image, :location_attributes => {:address => data.location})
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
