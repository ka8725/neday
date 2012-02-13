class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :facebook_id,
                  :remote_avatar_url, :vkontakte_id, :location_attributes, :twitter_id, :google_id
  has_one :location, :as => :locationable
  accepts_nested_attributes_for :location

  def name
    "#{first_name} #{last_name}".strip
  end

  def self.sign_in_or_build_new_user(auth_data, signed_in_resource, kind)
    return signed_in_resource if signed_in_resource
    data = auth_data.info
    User.find_by_email(data.email) || User.send("find_by_#{kind}_id", auth_data.uid) ||
      User.new(:email             => data.email,
               :password          => Devise.friendly_token[0,20],
               :first_name        => data.first_name,
               :last_name         => data.last_name,
               "#{kind}_id"       => auth_data.uid,
               :remote_avatar_url => data.image, :location_attributes => {:address => data.location})
  end
end
