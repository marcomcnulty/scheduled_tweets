class OmniauthCallbacksController < ApplicationController
  def twitter
    @twitter_account = Current.user.twitter_accounts.where(username: auth.nickname).first_or_initialize
    set_twitter_account
    redirect_to root_path, notice: "Successfully connected your account"
  end

  private

  def set_twitter_account
    @twitter_account.update(
      name:     auth.name,
      username: auth.nickname,
      image:    auth.image,
      token:    auth.token,
      secret:   auth.secret
    )
  end

  # Omniauth's way of accessing the credentials
  def auth
    request.env["omniauth.auth"].info
  end
end
