class SessionController < ApplicationController
  def login; end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user.nil?
      redirect_to session_login_path({locale: I18n.locale})
    else
      session[:current_user_id] = user.id
      session[:expires_at] = Time.current + 2.minutes
      redirect_to game_play_path({locale: I18n.locale})
    end
  end

  def logout
    session[:current_user_id] = nil
    redirect_to root_path
  end
end
