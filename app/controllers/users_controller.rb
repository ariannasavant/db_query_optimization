class UsersController < ApplicationController
  def index
    p params
    @users = User.by_karma.page(params[:page])
    @page = params[:page].nil? ? 3 : params[:page]

    length = User.all.size + 1

    case 
    when (1..3).include?(params[:page]) then @page = 3
    when (3..length-3).include?(params[:page]) then @page = params[:page].to_i
    when (length-2..length).include?(params[:page]) then @page = length - 3
    end

  end

end


 
