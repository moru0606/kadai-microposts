class ApplicationController < ActionController::Base
  include SessionsHelper
  include Pagy::Backend

  private

  def require_user_logged_in
    redirect_to login_url unless logged_in?
  end

  def counts(user)
    @count_microposts = user.microposts.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
    @count_favorite = user.favorite_microposts.count
  end
end
