class User < ActiveRecord::Base
  include Gravtastic
  gravtastic :size => 50
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :facebook_id, :avatar,
                  :remote_avatar_url, :remove_avatar, :avatar_cache, :vkontakte_id, :location_attributes, :twitter_id, :google_id,
                  :contacts_attributes, :user_sports_attributes
  has_one :location, :as => :locationable
  accepts_nested_attributes_for :location

  delegate :country, :city, :address, :to => :location, :allow_nil => true
  has_many :contacts, :class_name => 'UserContact', :dependent => :destroy
  accepts_nested_attributes_for :contacts
  has_many :user_sports, :dependent => :destroy
  accepts_nested_attributes_for :user_sports
  has_many :sports, :through => :user_sports

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

  def uses_gravatar?
    !avatar.present?
  end

  def existed_avatar
    uses_gravatar? ? gravatar_url : avatar
  end
end
