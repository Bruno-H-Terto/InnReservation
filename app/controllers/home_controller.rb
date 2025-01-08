class HomeController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      @inns = Inn.all
    end
  end
end