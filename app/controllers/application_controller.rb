class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authentication_check

  private
  def authentication_check
    if Rails.env.production?
      authenticate_or_request_with_http_basic do |user, password|
        user == 'admin' && password == 'neday.org'
      end
    end
  end
end
