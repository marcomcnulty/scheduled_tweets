class OmniauthCallbacksController < ApplicationController
  def twitter
    @twitter_account = Current.user.twitter_accounts.where(username: auth.nickname).first_or_initialize
    set_twitter_account

    redirect_to twitter_accounts_path, notice: "Successfully connected your account"
  end

  private

  def set_twitter_account
    @twitter_account.update(
      name:     auth.info.name,
      username: auth.info.nickname,
      image:    auth.info.image,
      token:    auth.credentials.token,
      secret:   auth.credentials.secret
    )
  end

  # Omniauth's way of accessing the credentials
  def auth
    request.env["omniauth.auth"]
  end
end
