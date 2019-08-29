class GameController < ApplicationController
  before_action :auth
  #@cur = nil
  def play
    @infos = Info.where(user_id: @cur.id).sort_by{ |elem| elem.score }
  end

  def record
    #user = User.find_by_id session[:current_user_id]
    max = params[:point].to_i
    time = params[:time].to_i
    Info.where_to_add @cur, max, time
  end


  def auth
    cur_user = User.find_by_id session[:current_user_id]
    if cur_user.nil? || User.none?
      redirect_to '/session/create'
    else
      @cur = cur_user
      puts @cur.id
    end
  end
end


