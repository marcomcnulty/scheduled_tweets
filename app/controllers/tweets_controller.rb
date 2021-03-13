class TweetsController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_tweet, except: [:index, :new, :create]

  def index
    @tweets = Current.user.tweets
  end

  def new
    @tweet = Tweet.new
  end

  def edit
  end

  def create
    @tweet = Current.user.tweets.create(tweet_params)
    if @tweet.save
      redirect_to tweets_path, notice: "Tweet was scheduled successfully"
    else
      render :new
    end
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweets_path, notice: "Tweet was scheduled successfully"
    else
      render :new
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: "Tweet is no longer scheduled"
  end

  private

  def tweet_params
    params.require(:tweet).permit(:twitter_account_id, :body, :publish_at)
  end

  def set_tweet
    @tweet = Current.user.tweets.find(params[:id])
  end
end
