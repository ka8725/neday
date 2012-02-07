class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
    if @user.new_record?
      if @user.save
        flash[:notice] = t("devise.omniauth_callbacks.success", :kind => "Facebook")
        sign_in_and_redirect @user, :event => :authentication
      else
        flash[:error] = t("devise.omniauth_callbacks.failure", :kind => "Facebook", :reason => '')
        render :template => 'devise/registrations/new'
      end
    else
      flash[:notice] = t("devise.omniauth_callbacks.success", :kind => "Facebook")
      sign_in_and_redirect @user, :event => :authentication
    end
  end

  def vkontakte
    # TODO
  end

  def twitter
    # TODO
  end

  def google_apps
    @user = User.find_for_open_id(request.env["omniauth.auth"], current_user)
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
