class FavoriteListsController < ApplicationController
  def index
    @user = current_user
    @favorite_lists = FavoriteList.all
  end
end
