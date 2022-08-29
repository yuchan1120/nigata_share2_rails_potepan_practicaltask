class TopController < ApplicationController

  def index
    if user_signed_in?
      @user = current_user.id
    end
  end

end
