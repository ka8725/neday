class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  %w(facebook vkontakte twitter google).each do |net|
    define_method(net) do
      @user = User.sign_in_or_build_new_user(request.env["omniauth.auth"], current_user, net)
      auth_user_action(net)
    end
  end

  private
  def auth_user_action(kind)
    kind = kind.to_s.titleize
    if @user.new_record?
      if @user.save
        flash[:notice] = t("devise.omniauth_callbacks.success", :kind => kind)
        sign_in_and_redirect @user, :event => :authentication
      else
        flash[:error] = t("devise.omniauth_callbacks.failure", :kind => kind)
        render :template => 'devise/registrations/new'
      end
    else
      flash[:notice] = t("devise.omniauth_callbacks.success", :kind => kind)
      sign_in_and_redirect @user, :event => :authentication
    end
  end
end
