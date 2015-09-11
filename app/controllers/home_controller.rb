class HomeController < ApplicationController
  def index
    if user_signed_in?
      @communities = current_user.communities or []
    else
      redirect_to :new_user_session 
    end
  end
end
